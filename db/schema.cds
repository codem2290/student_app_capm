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
    name   : nameType;
    adress : String;
    email  : nameType;
    mobile : String;
    age    : Integer;
    gender : String;
}


entity Courses : cuid, managed, customAscpect {
    //key courseID : UUID;
    name     : nameType;
    cost     : Decimal(10, 2);
    trainer  : String;
    duration : Integer;
}


entity Address {
    key addressID   : Integer;
        description : String;
        city        : String;
        country     : String;
        pincode     : Integer;
}


entity Department {
    key ID: UUID;
    name: String;
}