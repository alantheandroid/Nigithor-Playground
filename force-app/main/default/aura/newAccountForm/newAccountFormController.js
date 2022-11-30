({
    clickCreate : function(component, event, helper) {
        let validAccount = component.find("accountform").reduce((validSoFar, inputCmp) => {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get("v.validity").valid;
        }, true);
        if(validAccount) {
            let newAccount = component.get("v.newAccount");
            console.log(JSON.stringify(newAccount));
            helper.createAccount(component, newAccount);
        }
    }
})