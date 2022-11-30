({
    doInit: function(component, event, helper) {
        component.set("v.newAccount", true)
    },

    handleAccountClick : function(component, event, helper) {
        component.set("v.newLead", false);
        component.set("v.newAccount", true);
    },

    handleLeadClick : function(component, event, helper) {
        component.set("v.newAccount", false);
        component.set("v.newLead", true);
    }
})