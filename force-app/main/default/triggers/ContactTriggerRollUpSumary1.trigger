//Trigger to count number of Contacts associated to Account 
  //and update the Account's contact count field

trigger ContactTriggerRollUpSumary1 on Contact (after insert, after update, after delete, after undelete) {
    switch on Trigger.operationType{
        when AFTER_INSERT, AFTER_UNDELETE{
          /* Count the Total Number of Contact under Account*/
            // count, sum , min, max, avg ---> Aggregate Query
            Set<Id> accountIdsSet = new Set<Id>();
            for(Contact con : Trigger.New ){
                if(con.accountId <> Null){
                     accountIdsSet.add(con.AccountId);
                }
            }
            List<AggregateResult> aggregateResults = [ SELECT COUNT(Id),Count(Email), AccountId FROM Contact WHERE AccountId IN : accountIdsSet GROUP BY AccountId];
            
            List<Account> accountListToUpdate = new List<Account>();
            
            for(AggregateResult ar: aggregateResults){
                Integer totalCount = (Integer)ar.get('expr0');  // Object -> get()
                Integer totalContactWithEMail = (Integer)ar.get('expr1');
                Id accountId = (Id)ar.get('AccountId');
                accountListToUpdate.add( new Account(Id = accountId,
                                      Total_Number_of_Contacts__c = totalCount));
            }
            update accountListToUpdate;
            
        }
        when AFTER_UPDATE{
            Set<Id> accountIdsSet = new Set<Id>();
            for(Contact newContact : Trigger.New ){
                Contact oldContact = Trigger.oldMap.get(newContact.Id);
                if(oldContact.accountId <> newContact.accountId){
                    if(oldContact.AccountId != null){
                        accountIdsSet.add(oldContact.AccountId); // Decrease Number
                    }
                     if(newContact.AccountId != null){
                        accountIdsSet.add(newContact.AccountId);  //Increase Number
                    }
                }
            }
            List<AggregateResult> aggregateResults = [ SELECT COUNT(Id),Count(Email), AccountId FROM Contact WHERE AccountId IN : accountIdsSet GROUP BY AccountId];
            
            List<Account> accountListToUpdate = new List<Account>();
            
            for(AggregateResult ar: aggregateResults){
                Integer totalCount = (Integer)ar.get('expr0');  // Object -> get()
                Integer totalContactWithEMail = (Integer)ar.get('expr1');
                Id accountId = (Id)ar.get('AccountId');
                accountListToUpdate.add(new Account(Id = accountId,
                                      Total_Number_of_Contacts__c = totalCount));
            }
        

            update accountListToUpdate;
        }
    
        when AFTER_DELETE {
            //The "Zero" Problem: Aggregate queries only return results for 
            //groups that have records. If the last contact is deleted or moved, 
            //the query won't find that Account. That's why we use accountIds.remove() 
            //and a final loop to set remaining accounts to 0.
            //to solve this problem we can use below Approach
            
            
            //1. Create Map of Account Object at Starting of After Delete instead of Set
            //2. In After Delete Trigger  we are storing the Id inside the Map also create 
             // account with 
   
             Map<Id, Account> idToAccountMap = new Map<Id, Account>();

            //Set<Id> accountIdsSet = new Set<Id>();
            for(Contact con : Trigger.Old ){
                   if(con.accountId != null){
                         // accountIdsSet.add(con.AccountId);
                       idToAccountMap.put(con.AccountId, 
                                      new Account(Id=con.AccountId ,Total_Number_of_Contacts__c=0)
                        );

                   }
             }

             contactHelperRollupSUmmar1.countContact(idToAccountMap);
           
        }
    }
}
