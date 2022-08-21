using { minakshi.db.CDSView } from '../db/CDSView';

service CDSService @(path:'CDSService') {

    entity POWorklist as projection on CDSView.POWorklist;
    entity ProductOrders as projection on CDSView.ProductViewSum;
    entity ProductAggrigation as projection on CDSView.CProductValuesView;
}