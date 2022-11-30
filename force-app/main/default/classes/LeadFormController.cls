public with sharing class LeadFormController {
    @AuraEnabled
    public static Lead saveLead(Lead lead){
        upsert lead;
        return lead;
    }
}