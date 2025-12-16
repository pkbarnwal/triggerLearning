//Develop an Apex Trigger so that every time when 
//any account is inserted then set the value of the Industry field 
//to Education. Also, check if the Description is blank then set the value
//for the description field to "Account Description is blank"
//1. Industry = Education
//2. Description = Account Description is blank if Description is null
public with sharing class AccountIndustryUpdate {
    public static void updateIndustryField(List<Account> accList){
        for(Account acc : accList){
             acc.Industry = 'Education';
            if(String.isBlank(acc.Description)){
               acc.Description = 'Account Description is Blank';
            }
        }
    }
}