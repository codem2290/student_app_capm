const cds = require("@sap/cds");

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
            debugger;
        });

        return super.init();
    }
}
module.exports = StudentAPIService 