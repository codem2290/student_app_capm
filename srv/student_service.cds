using {student.db as model} from '../db/schema';


service StudentAPIService {
    entity StudentSet as projection on model.Students;
    entity Authors    as projection on model.Authors;

    @odata.draft.enabled
    entity Customers  as projection on model.Customers;

    entity Orders     as projection on model.Orders;
    // entity Customers  as projection on model.Customers {
    //     id,
    //     name
    // };
    //unbound Actions
    action updateCustomerStatus(customerID: String, name: String) returns String;

//entity ITEmployees as select ID,name from model.Employees where department.departmentID = 'IT';
}
