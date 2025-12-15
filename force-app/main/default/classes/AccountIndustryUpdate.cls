public with sharing class AccountIndustryUpdate {
    public static void updateIndustryField(List<Account> accList){
        for(Account acc : accList){
            if(String.isBlank(acc.Industry) || String.isBlank(acc.Description)){
                acc.Industry = 'Education';
                acc.Description = 'Account Description is Blank';
            }
        }
    }
}