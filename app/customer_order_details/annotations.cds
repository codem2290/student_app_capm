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
            {
                $Type : 'UI.DataField',
                Value : status.name,
                Label : 'Status',
                Criticality : status.criticality,
                CriticalityRepresentation : #WithIcon,
            },
            {
                $Type : 'UI.DataField',
                Value : product_productID,
                Label : 'Products',
            },
            {
                $Type : 'UI.DataField',
                Value : product.name,
                Label : 'Product Name',
            },
            {
                $Type : 'UI.DataField',
                Value : product.price,
                Label : 'Price',
            },
            {
                $Type : 'UI.DataField',
                Value : product.description,
                Label : 'Description',
            },
            {
                $Type : 'UI.DataField',
                Value : product.category,
                Label : 'Category',
            },
            {
                $Type : 'UI.DataField',
                Value : product.stock,
                Label : 'Stock',
            },
        ],
    },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'StudentAPIService.updateCustomer',
            Label : 'Deactivate',
            Criticality : #Negative,
        },
    ],
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

annotate service.Status with {
    name @Common.FieldControl : #ReadOnly
};

annotate service.Customers with {
    product @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Products',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_productID,
                    ValueListProperty : 'productID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'price',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'category',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
        },
        Common.ValueListWithFixedValues : false,
)};



annotate service.Customers with @(
    Common.SideEffects #updateProduct: {
        SourceProperties : [
            'product_productID',
        ],
        TargetProperties : [
            'product/name',
            'product/category',
            'product/description',
            'product/price',
            'product/stock'
        ]
    }
);

annotate service.Customers with @(
    Common.SideEffects #updateStatus: {
        SourceProperties : [
            'status_id',
        ],
        TargetProperties : [
            'status/name',
        ]
    }
);
