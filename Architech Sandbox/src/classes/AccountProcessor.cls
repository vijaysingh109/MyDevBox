public class AccountProcessor{

    @future(callout=true)
    public static void countContacts(List<Id> accountIds) {
        
        Map<Id,List<Contact>> mapAccountIdAndContactCoount = new Map<Id,List<Contact>>();
        for(Contact con :[select Id,Name,AccountId from Contact where AccountId in:accountIds]){
            if(mapAccountIdAndContactCoount.get(con.AccountId)==null){
                mapAccountIdAndContactCoount.put(con.AccountId,new list<Contact>());
            }
            mapAccountIdAndContactCoount.get(con.AccountId).add(con);
        }
        
        List<Account> lstAccountToUpdate = new List<Account>();
        for(Account acc: [select id,Number_of_Contacts__c from Account where Id in:accountIds]){
            if(mapAccountIdAndContactCoount.containskey(acc.id)){
                acc.Number_of_Contacts__c  = mapAccountIdAndContactCoount.get(acc.id).size();
                lstAccountToUpdate.add(acc);
            }
        }
        if(lstAccountToUpdate.size()>0){
            update lstAccountToUpdate; 
        }
        
    }
}