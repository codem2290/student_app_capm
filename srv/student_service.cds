using {student.db as model} from '../db/schema';
using {API_BUSINESS_PARTNER as external} from './external/API_BUSINESS_PARTNER';
using {EmployeeService as onpremise} from './external/EmployeeService';

service StudentAPIService {
    entity StudentSet        as projection on model.Students;
    entity Authors           as projection on model.Authors;
    entity Status            as projection on model.Status;
    entity Products          as projection on model.Products;

    @odata.draft.enabled
    entity Customers         as projection on model.Customers
        actions {
            @Common: {SideEffects: {
                $Type           : 'Common.SideEffectsType',
                TargetProperties: ['*']
            }, }
            action updateCustomer() returns String;
        };

    entity Orders            as projection on model.Orders;
    // entity Customers  as projection on model.Customers {
    //     id,
    //     name
    // };
    //unbound Actions
    action updateCustomerStatus(customerID: String, name: String) returns String;


    entity A_BusinessPartner as projection on external.A_BusinessPartner;
    entity EmployeeSet       as projection on onpremise.EmployeeSet;
//entity ITEmployees as select ID,name from model.Employees where department.departmentID = 'IT';
}
