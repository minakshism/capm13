using { minakshi.db.master, minakshi.db.transaction } from '../db/datamodel';

service CatalogService @(path:'CatalogService'){
    entity AddressSet as projection on master.address;
    entity ProductSet as projection on master.product;
    entity BPSet as projection on master.businesspartner;
    entity EmployeeSet as projection on master.employees;

    entity POs @(title : '{i18n>POHeader}') as projection on transaction.purchaseorder{
        *,
        Items : redirected to POItems
    }

    entity POItems @(title : '{i18n>POItems}') as projection on transaction.poitems{
        *,
        PARENT_KEY : redirected to POs,
        PRODUCT_GUID : redirected to ProductSet
    }
}