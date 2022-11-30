({
    clickCreate : function(component, event, helper) {
        let validLead = component.find("leadform").reduce((validSoFar, inputCmp) => {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get("v.validity").valid;
        }, true);
        if(validLead) {
            let newLead = component.get("v.newLead");
            console.log(JSON.stringify(newLead));
            helper.createLead(component, newLead);
        }
    }
})