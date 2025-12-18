/*
4. When the Account is Created, Create a task Record under that Account and assign the Task 
to the Account Owner , Use below Information.
Subject: Created From Apex Trigger
Comments: Created From Apex Trigger
Due Date: Today Date + 7
Status = Not Started
Priority = High 
Related To( What) - AccountId
Assigned to(OwnerId) - Account Owner Id
*/
trigger AccountTrigger2 on Account(after insert) {
   switch on Trigger.operationType{
    when AFTER_INSERT{
        TriggerHandlerClass1.TaskAfterInsert(Trigger.new);
    }
   }
}