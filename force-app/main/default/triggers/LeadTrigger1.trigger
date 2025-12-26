//Prevent the Creation of Duplicate Lead Record Based on Email Field 
trigger LeadTrigger1 on Lead (before insert) {
    trigger LeadTrigger1 on Lead (before insert) {
    /* Prevent Dupliacte Lead Record based on Lead Email and Company*/
     Set<String> newComanySet = new Set<String>();
     Set<String> newEmailSet = new Set<String>();
    
    for(Lead l : Trigger.new){
        if(!String.isBlank(l.company)){
            newComanySet.add(l.company);
        }
        if(!String.isBlank(l.email)){
            newEmailSet.add(l.email);
        }
    }
    /** Query the Existing Lead based on the Lead Company and Email**/
    List<Lead> existingLeadRecords = [SELECT Id, Name, Email, Company FROM Lead 
                                      WHERE Company IN : newComanySet
                                       AND Email IN : newEmailSet ];
    
    for(Lead newLead : Trigger.New){
        for(Lead existingLead:existingLeadRecords){
            /**Check for the Duplicate**/
            if(newLead.Company == existingLead.Company && 
               newLead.email == existingLead.email){
                    newLead.email.addError('Duplicate Lead Detected. A Lead with Same with Same Email ('+ existingLead.email);
                   newLead.company.addError('Duplicate Lead Detected .A Lead with Same Company('+existingLead.Company);
               }

        }
    }
}