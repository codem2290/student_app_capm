using StudentAPIService as service from '../../srv/student_service';
using from '@sap/cds/common';
using from '../../db/schema';




annotate service.Customers with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : customerID,
            Label : 'customerID',
        },
        {
            $Type : 'UI.DataField',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Value : mobile,
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : address,
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Customer Form',
            ID : 'CustomerForm',
            Target : '@UI.FieldGroup#CustomerForm',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order',
            ID : 'Order',
            Target : 'orders/@UI.LineItem#Order',
        },
    ],
    UI.FieldGroup #CustomerForm : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : customerID,
                Label : 'customerID',
            },
            {
                $Type : 'UI.DataField',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Value : mobile,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
        ],
    },
);

annotate service.Orders with @(
    UI.LineItem #Order : [
        {
            $Type : 'UI.DataField',
            Value : orderDate,
            Label : 'orderDate',
        },
        {
            $Type : 'UI.DataField',
            Value : orderID,
            Label : 'orderID',
        },
        {
            $Type : 'UI.DataField',
            Value : customer_customerID,
            Label : 'customer_customerID',
        },
    ]
);

