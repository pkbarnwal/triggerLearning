trigger OpportunityTrigger on Opportunity (before insert) {
     Set<Id> accId = new Set<Id>();
    for(Opportunity opp : Trigger.New){
        if(Opp.AccountId !=  null){
            accId.add(Opp.AccountId);
         }
    }
    List<Account> accList = [SELECT Id, Name, Description FROM Account 
                                    WHERE Id IN :  accId]; // ABC, XYZ
    
    for(Opportunity opp : Trigger.New){   // Salesforce.com ---> ABC, Google.com ----> XYZ
         if(opp.Amount != null && opp.Discount_Percent__c != null){
            Decimal discountAmount = (opp.Amount * opp.Discount_Percent__c)/100;
            Decimal discountedAmount = opp.Amount - discountAmount;
            opp.Amount_After_Discount__c = discountedAmount;
            }
         //update the Opportunity Description with the related account Description
        if(opp.AccountId <> null){
           for(Account acc : accList){
               if(acc.Id == opp.AccountId){
                   opp.Description = acc.Description;
                }
            }
        }
    }

}