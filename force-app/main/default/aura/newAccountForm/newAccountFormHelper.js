({
    createAccount : function(component, newAccount) {
        let action = component.get("c.saveAccount");
        action.setParams({
            "account": newAccount
        });
        action.setCallback(this, (response) => {
            let state = response.getState();
            if (state === "SUCCESS") {
                let newAccount = response.getReturnValue();
                let newAccountId = newAccount.Id;
                let redirect = $A.get("e.force:navigateToSObject");
                redirect.setParams({
                    "recordId": newAccountId
                });
                redirect.fire();
            } else {
                let errorArray = response.getError()
                console.log(state, errorArray[0].message);
            }
        });
        $A.enqueueAction(action);
    }
})