trigger AccountTrigger on Account (before insert) {
    Switch on Trigger.operationType{
        when BEFORE_INSERT{
          AccountAddressUpdate.getShippingAddressUpdate(Trigger.new);
        }
    }

}