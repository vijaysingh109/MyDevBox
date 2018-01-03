public with sharing class remoteController {

        
        
        @RemoteAction
        public static List<Account> getAccount(){
            
            return [select Id,Name from Account Limit 10];
        }

}