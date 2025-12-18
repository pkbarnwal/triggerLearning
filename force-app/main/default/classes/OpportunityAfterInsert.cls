
/*
Develop an Apex Trigger so that when an opportunity is Created and Account is Blank
    Create a Task under Opportunity. Hint :- AccountId == null

*/

public with sharing class OpportunityAfterInsert {
    public static void CreateTaskAfterInsert(Map<Id, Opportunity> OpportunityMap){
         List<Task> taskList = new List<Task>();
        for(Opportunity opp:  OpportunityMap.values()){
            if(opp.AccountId == null){
                Task tsk = new Task();
                tsk.Subject = ' Opportunity is created without Account';
                tsk.Description = 'Opportunity is created without Account, Please assign the Correct';
                tsk.ActivityDate = System.today().addDays(7);
                tsk.Status= 'Not Started';
                tsk.Priority = 'High';
                tsk.WhatId = opp.Id;
                tsk.OwnerId = opp.OwnerId;
              taskList.add(tsk);
             }
        }
        insert taskList;

    }
}