trigger ContactTrigger2 on Contact (after insert) {
    switch on Trigger.operationType{
        when AFTER_INSERT{
            ContactTriggerHandler.getContactUpdated((Map<Id, Contact>) Trigger.newMap);
        }
    }

}