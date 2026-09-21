namespace student.db;

using {
    cuid,
    managed
} from '@sap/cds/common';

type nameType : String(50);

aspect customAscpect {
    status : String;
}

entity Students : cuid, managed, customAscpect {
    //key studentID : UUID;
    name    : nameType;
    adress  : String;
    email   : nameType;
    mobile  : String;
    age     : Integer;
    gender  : String;
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
    author: Association to Authors;// managed assocaition
}

entity Authors: cuid {
    name: String;
    books: Composition of many Books on books.author = $self;
}


