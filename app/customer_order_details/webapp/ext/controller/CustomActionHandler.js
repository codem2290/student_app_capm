sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oContext the context of the page on which the event was fired. `undefined` for list report page.
         * @param aSelectedContexts the selected contexts of the table rows.
         */
        updateCustomerStatus: function(oContext, aSelectedContexts) {
            let sAction = "updateCustomerStatus";
            let customerObject = oContext.getObject();
            let oParameter = {
                model: this.getModel(),
                parameterValues: [{
                    "name": "customerID",
                    "value": customerObject.customerID
                },{
                    "name": "name",
                    "value": customerObject.name
                }],
                skipParameterDialog: true
            };
            this.editFlow.invokeAction(sAction, oParameter).then((response) => {
                
            }).catch((error) => {

            });

        }
    };
});
