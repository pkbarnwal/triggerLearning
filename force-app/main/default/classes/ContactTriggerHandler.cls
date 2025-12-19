public with sharing class ContactTriggerHandler {
    /*
      Develop an Apex Trigger when any Contact created on Account Record 
      then update  same Opportunity Record
    */
    public static void getContactUpdated(Map<Id, Contact> newMap){
        Set<Id> accIds = new Set<Id>();
           for(Contact conObj : newMap.values()){
               if(conObj.AccountId != Null){
                     accIds.add(conObj.AccountId);
               } 
            }
            List<Opportunity> oppList = [SELECT Id, AccountId, Account.Name,
                                    Account.Rating, Account.Industry,Account.Phone,
                                    FROM Opportunity WHERE AccountId IN: accIds];

            for(Opportunity opp: oppList ){
                opp.Account_Name__c = opp.Account.Name;
                opp.Account_Industry__c = opp.Account.Industry;
                opp.Account_Rating__c = opp.Account.Rating;
                opp.Account_Phone__c = opp.Account.Phone;
             }
             update as user oppList;

    }

}