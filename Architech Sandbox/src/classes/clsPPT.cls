public with sharing class clsPPT {

    public List<Account> getAccounts(){
        return [select Id,Name from Account Limit 10];
    }

}