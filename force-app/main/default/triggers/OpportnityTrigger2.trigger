/*A. Create a Custom Field on Opportunity “ Discount ” and the data type of this field Should be Percent. 
   B. Create a Custom Field on Opportunity “Discounted Price” with Currency Data Type 
 Requirement 
Develop an Apex Trigger on Opportunity so that When any Opportunity Is Created and 
if the Discount & Amount Field is not blank then Calculate the discount and 
store it in the  Discounted Price Field.
*/
trigger OpportnityTrigger2 on SOBJECT (before insert) {
    Switch on Trigger.operationType{
        when BEFORE_INSERT{
            TriggerHandler.OpportunityBeforeInsert(Trigger.new);
        }
        /*
        Developer an Apex Trigger so that when an opportunity is Created and Account is Blank
        Create a Task under Opportunity. Hint :- AccountId == null
        */
        when AFTER_INSERT{
            OpportunityAfterInsert.CreateTaskAfterInsert((Map<Id, Opportunity>)Trigger.newMap);

        }
    }
}