public class BatchReplace implements Database.Batchable<sObject> {
    public Database.QueryLocator start (Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, OwnerId, Account.OwnerId FROM Contact ' +
                                        'WHERE Different_OwnerId__c = true '
                                        // + 'AND (LastModifiedDate = TODAY OR Account.LastModifiedDate = TODAY)'
                                        );
    }
    public void execute(Database.BatchableContext bc, List<Contact> scope) {
        System.debug('scope' + scope);
        List<Contact> contacts = new List<Contact>();
        for (Contact con : scope) {
            con.OwnerId = con.Account.OwnerId;
            contacts.add(con);
        }
        update contacts;
    }
    public void finish(Database.BatchableContext bc) {}
}