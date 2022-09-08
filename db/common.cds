namespace minakshi.common;
using { sap, Currency, temporal, managed } from '@sap/cds/common';

type Gender : String(1) enum{
    male = 'M';
    female = 'F';
    nonBinary = 'N';
    noDisclosure = 'D';
    selfDescribe = 'S';
};

type AmountT : Decimal(15,2)@(
    Semantics.amount.currencyCode: 'CURRENCY_CODE',
    sap.unit: 'CURRENCY_CODE'
);


aspect Amount {
    CURRENCY_CODE: String(4);	
    GROSS_AMOUNT:AmountT;	
    NET_AMOUNT:AmountT;
    TAX_AMOUNT:AmountT;     
}

type PhoneNumber : String(30)@assert.format : '^(1\s|1|)?((\(\d{3}\))|\d{3})(\-|\s)?(\d{3})(\-|\s)?(\d{4})$';
type Email: String(255)@assert.format : '^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';



