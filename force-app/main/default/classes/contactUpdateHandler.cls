public with sharing class contactUpdateHandler {
     public static void getContactUpdate(List<Contact> conList){
        Set<Id> accIds = new Set<Id>();
        for(Contact con: conList){
            accIds.add(con.AccountId);
        }
        Map<Id,Account> accMap = new Map<Id, Account>([SELECT Id, ShippingStreet,
                           ShippingCity,ShippingState,ShippingPostalCode,ShippingCountry,
                                                       BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry
                                                       FROM Account WHERE Id IN : accIds]);                         
        for(Contact con: conList){
           Account accAddressInfo = accMap.get(con.AccountId);
            if(con.AccountId != NULL) {
                con.MailingStreet = accAddressInfo.ShippingStreet;
                con.MailingCity = accAddressInfo.ShippingCity;
                con.MailingCountry = accAddressInfo.ShippingCountry;
                con.MailingState = accAddressInfo.ShippingState;
                con.MailingPostalCode = accAddressInfo.ShippingPostalCode;
            
                con.OtherStreet = accAddressInfo.BillingStreet;
                con.OtherCity= accAddressInfo.BillingCity;
                con.OtherState = accAddressInfo.BillingState;
                con.OtherCountry = accAddressInfo.BillingCountry;
                con.OtherPostalCode = accAddressInfo.BillingPostalCode;
            }
        }
    }
}