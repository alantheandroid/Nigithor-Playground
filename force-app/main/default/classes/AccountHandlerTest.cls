@isTest
private class AccountHandlerTest {

    @isTest static void changeTest() {
        List<User> users = [SELECT Id, Name FROM User WHERE Name='Security User' OR Name='Integration User' OR Name='Alessio Ilardi'];
        Map<String, User> userByName = new Map<String, User>();
        for (User u : users) {
            userByName.put(u.Name, u);
        }
        
        List<Account> accList = new List<Account>();
        Account accCatania = new Account(Name = 'Test 1', BillingState = 'Catania', OwnerId = userByName.get('Security User').Id);
        Account accMilano = new Account(Name = 'Test 2', BillingState = 'Milano', OwnerId = userByName.get('Integration User').Id);
        Account accTorino = new Account(Name = 'Test 3', BillingState = 'Torino', OwnerId = userByName.get('Security User').Id);
        accList.add(accCatania);
        accList.add(accMilano);
        accList.add(accTorino);
            
        // AccountHandler.changeOwner(accList);
        
        List<Database.SaveResult> result = Database.insert(accList, false);
        
        System.assertEquals(accCatania.OwnerId, userByName.get('Alessio Ilardi').Id);
        System.assertEquals(accMilano.OwnerId, userByName.get('Security User').Id);
        System.assertEquals(accTorino.OwnerId, userByName.get('Integration User').Id);
    }
}