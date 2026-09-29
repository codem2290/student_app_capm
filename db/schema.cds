namespace student.db;

using {
    cuid,
    managed,
    Country
} from '@sap/cds/common';

type nameType : String(50);

aspect customAscpect {
    status : String;
}

entity Students : cuid, managed, customAscpect {
    //key studentID : UUID;
    name   : nameType;
    adress : String;
    email  : nameType;
    mobile : String;
    age    : Integer;
    gender : String;
//courses : Composition of many Cours
}


entity Courses : cuid, managed, customAscpect {
    //key courseID : UUID;
    name     : nameType;
    cost     : Decimal(10, 2);
    trainer  : String;
    duration : Integer;
}


entity Address {
    key addressID   : UUID;
        description : String;
        city        : String;
        country     : String;
        pincode     : Integer;
}


entity Department {
    key ID   : UUID;
        name : String;
}

entity Enrollments {
    key id           : UUID;
        enrolledDate : Date;
        cost         : Decimal(10, 2);
}


entity Books : cuid {
    name          : String;
    title         : String;
    publishedDate : String;
    author        : Association to Authors; // managed assocaition
}

entity Authors : cuid {
    name  : String;
    books : Composition of many Books
                on books.author = $self;
}

entity Departments {
    key departmentID : Integer;
        name         : String(50);
}

entity Employees {
    key ID         : UUID;
        name       : String(50);
        address    : String(200);
        email      : String(50);
        department : Association to Departments;
}

entity Orders {
    key orderID    : UUID;
        orderDate  : Date;
        customer   : Association to Customers;
        orderitems : Composition of many OrderItems
                         on orderitems.order = $self;
}

entity Customers {
    key customerID : UUID;
        //key id         : UUID;
        name       : String(50) @title: '{i18n>name}';
        address    : String     @title: '{i18n>Address}';
        email      : String     @title: '{i18n>Email}';
        mobile     : String     @title: '{i18n>Mobile}';
        orders     : Composition of many Orders
                         on orders.customer = $self;
        country    : Country;
        status     : Association to Status;
        product    : Association to Products;
}


entity OrderItems {
    key id       : UUID;
        product  : String(100);
        quantity : Integer;
        order    : Association to Orders;
}

entity Status {
    key id          : Integer;
        name        : String;
        criticality : Integer;
}


entity Products {
    key productID   : Integer;
        name        : String;
        price       : Decimal(10, 2);
        category    : String;
        description : String;
        stock       : Integer;
}
