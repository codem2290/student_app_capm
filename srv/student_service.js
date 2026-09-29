const cds = require("@sap/cds");
const { SELECT, UPDATE } = require("@sap/cds/lib/ql/cds-ql");

class StudentAPIService extends cds.ApplicationService {
    init() {
        const { Customers, Orders } = this.entities;
        this.before('UPDATE', Customers.drafts, (req) => {
            //debugger;

            const { email } = req.data;

            if (email) {
                const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                const isValid = regex.test(email);

                if (!isValid) {
                    return req.reject({
                        status: 400,
                        message: "Invalid Email Adress!",
                        target: 'email'
                    });
                }
            }

        });

        this.before('CREATE', Orders.drafts, async (req) => {
            req.data.orderDate = new Date().toISOString().split('T')[0];
            return req;
        });

        this.on("updateCustomerStatus", async (req) => {
            const { customerID, name } = req.data;

            if(customerID){
                let customerData = await SELECT.one.from(Customers).where({
                    "customerID": customerID
                });

                if(!customerData){
                    return req.reject(404, "Customer Record Not Found!");
                }

                await UPDATE(Customers).set({
                    status_id: 1
                }).where({
                    "customerID": customerID
                });

                return "Status Updated Successfully!";

            }


        });

        this.on("updateCustomer", async (req) => {
            const { customerID } = req.params[0];

            if(customerID) {
                await UPDATE(Customers).set({
                    status_id: 2
                }).where({
                    "customerID": customerID
                });
            }

            return;
        });

        return super.init();
    }
}
module.exports = StudentAPIService 