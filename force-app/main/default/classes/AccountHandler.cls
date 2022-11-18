public class AccountHandler {
    // sistemare il currentOwner e customMetaData
    public static void changeOwner(List<Account> listNew) {
        List<User> users = [SELECT Id, Name FROM User WHERE Name='Security User' OR Name='Integration User' OR Name='Alessio Ilardi'];
        Map<String, User> userByName = new Map<String, User>();
        for (User u : users) {
            userByName.put(u.Name, u);
        }
        for(Account a : listNew) {
            if(a.BillingState == 'Catania') {
                a.OwnerId = userByName.get('Alessio Ilardi').Id;
            } else if(a.BillingState == 'Milano') {
                User u = userByName.get('Security User');
                a.OwnerId = u.Id;
            } else {
                a.OwnerId = userByName.get('Integration User').Id;
            }
        }
    }
}