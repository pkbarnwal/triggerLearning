public with sharing class TriggerHandlerClass1 {
    public static void TaskAfterInsert(List<Account> accList){
         List<Task> taskInertList = new List<Task>();
          for(Account acc : accList){
              Task tk = new Task();
                   tk.Subject = 'Created From APex Trigger';
                   tk.description = 'Created From APex Trigger';
                   tk.ActivityDate = system.today().addDays(7);
                   tk.Status = 'Not STarted';
                   tk.Priority = 'High';
                   tk.WhatId = acc.Id;
                   tk.OwnerId = acc.OwnerId;
            taskInertList.add(tk);
           }
        insert taskInertList;

    }
}