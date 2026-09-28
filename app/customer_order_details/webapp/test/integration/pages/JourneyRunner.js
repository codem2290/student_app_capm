sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/customer/app/customerorderdetails/test/integration/pages/CustomersList.gen",
	"com/customer/app/customerorderdetails/test/integration/pages/CustomersObjectPage.gen"
], function (JourneyRunner, CustomersListGenerated, CustomersObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/customer/app/customerorderdetails') + '/test/flp.html#app-preview',
        pages: {
			onTheCustomersListGenerated: CustomersListGenerated,
			onTheCustomersObjectPageGenerated: CustomersObjectPageGenerated
        },
        async: true
    });

    return runner;
});

