({
    createAccount : function(component, newAccount) {
        let action = component.get("c.saveAccount");
        action.setParams({
            "account": newAccount
        });
        action.setCallback(this, (response) => {
            let state = response.getState();
            if (state === "SUCCESS") {
                console.log("Account created")
            } else {
                let errorArray = response.getError()
                console.log(state, errorArray[0].message);
            }
        });
        $A.enqueueAction(action);
    }
})
