using { minakshi.db.master, minakshi.db.transaction } from '../db/datamodel';

service CatalogService @(path:'CatalogService'){
    entity AddressSet as projection on master.address;
    entity ProductSet as projection on master.product;
    entity BPSet as projection on master.businesspartner;
    @Capabilities : { Insertable, Updatable, Deletable, Readable}
    entity EmployeeSet as projection on master.employees;

    entity POs @(title : '{i18n>POHeader}') as projection on transaction.purchaseorder{
        *,
        round(GROSS_AMOUNT, 2) as GROSS_AMOUNT : Decimal(15,2),
        Items : redirected to POItems
    }actions{
        function largestOrder() returns array of POs;
        action boost();
    }

    entity POItems @(title : '{i18n>POItems}') as projection on transaction.poitems{
        *,
        PARENT_KEY : redirected to POs,
        PRODUCT_GUID : redirected to ProductSet
    }
}