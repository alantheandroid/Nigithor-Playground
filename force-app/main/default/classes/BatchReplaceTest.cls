@isTest
private class BatchReplaceTest {
    @isTest static void alrightChange(){
        List<User> users = [SELECT Id, Name FROM User WHERE Name='Security User' OR Name='Integration User' OR Name='Alessio Ilardi'];
        Map<String, User> userByName = new Map<String, User>();
        for (User u : users) {
            userByName.put(u.Name, u);
        }
        
        List<Account> accList = new List<Account>();
        Account acc1 = new Account(Name = 'accTest 1', BillingState = 'Catania', OwnerId = userByName.get('Security User').Id);
        insert acc1;

        Contact c1 = new Contact(LastName='cntTest 1', AccountId = acc1.Id, OwnerId = userByName.get('Integration User').Id);
        
        insert c1;
        Test.startTest();
            BatchReplace x = new BatchReplace();
            Database.executeBatch(x);
        Test.stopTest();
        
    } 
}