using CatalogService as service from '../../srv/CatalogService';

//

annotate service.POs with @( UI : {
    SelectionFields  : [
        PO_ID,
        GROSS_AMOUNT,
        LIFECYCLE_STATUS,
        CURRENCY_CODE
    ],
    LineItem  : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT

        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.boost',
            Label : 'Boost',
            Inline : true
        },
        {
            $Type : 'UI.DataField',
            Value : LIFECYCLE_STATUS,
            Criticality : Criticality,
            CriticalityRepresentation : #WithIcon
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_CODE,
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },

        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        }
    ],
    HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : '{i18n>PurchaseOrder}',
        TypeNamePlural : '{i18n>PurchaseOrders}',
        Title : {
            Label : '{i18n>PoID}',
            Value : PO_ID
        },
        Description : {
            Label : '{i18n>Description}',
            Value : PARTNER_GUID.COMPANY_NAME
        }
    },
    Facets  : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>POGeneralInfo}',
            Target : ![@UI.FieldGroup#HeaderGeneralInfo]
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>POItemDetails}',
            Target : 'Items/@UI.LineItem'
        }
        
    ],
    FieldGroup#HeaderGeneralInfo : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : PO_ID ,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PARTNER_GUID_NODE_KEY,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PARTNER_GUID.COMPANY_NAME,
                },
                {
                    $Type : 'UI.DataField',
                    Value : LIFECYCLE_STATUS,
                },
                {
                    $Type : 'UI.DataField',
                    Value : TAX_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : GROSS_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : CURRENCY_CODE,
                },
            ]

    }
});

annotate service.POItems with @( UI : {
    LineItem  : [
       {
           $Type : 'UI.DataField',
           Value : CURRENCY_CODE,
       }, 
       {
           $Type : 'UI.DataField',
           Value : TAX_AMOUNT,
       },
       {
           $Type : 'UI.DataField',
           Value : GROSS_AMOUNT,
       },
       {
           $Type : 'UI.DataField',
           Value : NET_AMOUNT,
       },
       {
           $Type : 'UI.DataField',
           Value : PRODUCT_GUID_NODE_KEY,
       },
       {
           $Type : 'UI.DataField',
           Value : PRODUCT_GUID.PRODUCT_ID,
       },

    ],
    HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Po Item',
        TypeNamePlural : 'PO Items',
        Title : {
            $Type : 'UI.DataField',
            Value : ID
        },
        Description : {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DESCRIPTION,
        },
    },
    Facets  : [
       {
           Label : 'PO Item Header',
           $Type : 'UI.ReferenceFacet',
           Target : '@UI.FieldGroup#LineItemHeader',
       }, 
       {
           Label : 'Product Details',
           $Type : 'UI.ReferenceFacet',
           Target : 'PRODUCT_GUID/@UI.FieldGroup#ProductDetails'
       }
    ],
    FieldGroup#LineItemHeader  : {
        $Type : 'UI.FieldGroupType',
        Data : [
             {
                 $Type : 'UI.DataField',
                 Value : ID,
             },
             {
                 $Type : 'UI.DataField',
                 Value : PRODUCT_GUID.DESCRIPTION,
             },
             {
                 $Type : 'UI.DataField',
                 Value : TAX_AMOUNT,
             },
             {
                 $Type : 'UI.DataField',
                 Value : PARENT_KEY.OVERALL_STATUS,
             },
             {
                 $Type : 'UI.DataField',
                 Value : CURRENCY_CODE,
             },
             {
                 $Type : 'UI.DataField',
                 Value : GROSS_AMOUNT ,
             },
        ]
        
    },
}) ;

annotate service.ProductSet with @( UI : {
    FieldGroup#ProductDetails  : {
        $Type : 'UI.FieldGroupType',
        Label : 'Product Information',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CATEGORY,
            },
            {
                $Type : 'UI.DataField',
                Value : DEPTH,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : WEIGHT_MEASURE,
            },
            {
                $Type : 'UI.DataField',
                Value : SUPPLIER_GUID.COMPANY_NAME,
            },
            {
                $Type : 'UI.DataField',
                Value : NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : SUPPLIER_GUID.EMAIL_ADDRESS ,
            },
            {
                $Type : 'UI.DataField',
                Value : SUPPLIER_GUID.PHONE_NUMBER,
            },
        ]
    },
});



