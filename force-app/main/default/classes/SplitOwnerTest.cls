@isTest
private class SplitOwnerTest {
	
    @isTest static void triggerTest() {
        Account acc = new Account(Name = 'Test', BillingState = 'Catania');
        
        Test.startTest();
        Database.SaveResult result = Database.insert(acc, false);
        Test.stopTest();
        
        System.assert(result.isSuccess());
        // System.assertEquals(result.Account.OwnerId, userByName.get('Alessio Ilardi').Id);
    }
}