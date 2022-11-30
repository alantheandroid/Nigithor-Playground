({
    createLead : function(component, newLead) {
        let action = component.get("c.saveLead");
        action.setParams({
            "lead": newLead
        });
        action.setCallback(this, (response) => {
            let state = response.getState();
            if (state === "SUCCESS") {
                let newLead = response.getReturnValue();
                let newLeadId = newLead.Id;
                let redirect = $A.get("e.force:navigateToSObject");
                redirect.setParams({
                    "recordId": newLeadId
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