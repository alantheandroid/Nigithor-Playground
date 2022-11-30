public with sharing class AccountFormController {
    @AuraEnabled
    public static Account saveAccount(Account account){
        upsert account;
        return account;
    }
}