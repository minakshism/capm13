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

