
/**
 * 
Develop an Apex Trigger on Opportunity so that When any Opportunity Is Created and 
if the Discount & Amount Field is not blank then Calculate the discount and store it in 
the  Discounted Price Field.

 */

public with sharing class TriggerHandler {
    public static void OpportunityBeforeInsert(List<Opportunity> oppList) {
      for(Opportunity opp : oppList){
        if(opp.Amount != Null && Discount__c != Null){
            Decimal discount = opp.Amount * (opp.Discount__c/100);
            opp.Discounted_Price__c = opp.Amount - discount;
            }
         }

    }
}