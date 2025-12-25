public with sharing class contactHelperRollupSUmmar1 {
    public static void countContact(Map<Id, Account> idToAccountMap){
         List<AggregateResult> aggregateResults = [ SELECT COUNT(Id),Count(Email), AccountId FROM Contact WHERE AccountId IN :  idToAccountMap.keySet() GROUP BY AccountId];
            
            //List<Account> accountListToUpdate = new List<Account>();
            
            for(AggregateResult ar: aggregateResults){
                Integer totalCount = (Integer)ar.get('expr0');  // Object -> get()
                Integer totalContactWithEMail = (Integer)ar.get('expr1');
                Id accountId = (Id)ar.get('AccountId');
               // accountListToUpdate.add(new Account(Id = accountId,
                                      // Total_No_of_Contact__c = totalCount));
                idToAccountMap.put(accountId, new Account(Id = accountId,Total_Number_of_Contacts__c= totalCount));  
            }
           // update accountListToUpdate;
           update idToAccountMap.values();

    }
}