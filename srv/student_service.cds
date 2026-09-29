using {student.db as model} from '../db/schema';


service StudentAPIService {
    entity StudentSet as projection on model.Students;
    entity Authors    as projection on model.Authors;
    entity Status     as projection on model.Status;
    entity Products   as projection on model.Products;

    @odata.draft.enabled
    entity Customers  as projection on model.Customers
        actions {
            @Common : { 
                SideEffects : {
                    $Type : 'Common.SideEffectsType',
                    TargetProperties: ['*']
                },
             }
            action updateCustomer() returns String;
        };

    entity Orders     as projection on model.Orders;
    // entity Customers  as projection on model.Customers {
    //     id,
    //     name
    // };
    //unbound Actions
    action updateCustomerStatus(customerID: String, name: String) returns String;

//entity ITEmployees as select ID,name from model.Employees where department.departmentID = 'IT';
}
