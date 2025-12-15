trigger AccountTrigger on Account (before insert) {
    Switch on Trigger.operationType{
        when BEFORE_INSERT{
            //Calling the getShippingAddressUpdate method
        //  AccountAddressUpdate.getShippingAddressUpdate(Trigger.new);
       
        // calling AccountIndustryUpdated method
        AccountIndustryUpdate.updateIndustryField(Trigger.new);

        }
    }

}