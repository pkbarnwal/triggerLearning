public with sharing class AccountAddressUpdate {
    public static void getShippingAddressUpdate(List<Account> accList){
        for(Account acc : Trigger.new){
                if(acc.BillingStreet != null || 
                   acc.BillingCity != null ||
                   acc.BillingState != null){
                    acc.ShippingStreet = acc.BillingStreet;
                    acc.ShippingCity = acc.BillingCity;
                    acc.ShippingState = acc.BillingState;
            }
        }
    }
}