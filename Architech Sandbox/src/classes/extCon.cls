public with sharing class extCon {


    public string id {get;set;} 
   
    public extCon(ApexPages.StandardController controller) {
        id = apexpages.currentpage().getparameters().get('id');
        opp = [select EL__c from Opportunity where id=:id];
        htmlvalue  = opp.EL__c.replace('Kind Attention: Mr. XXXXXXXXXXXX', 'Replaced');
        
        opp.EL__c.replace('Kind Attention: Mr. XXXXXXXXXXXX', 'Replaced');
    }
    
    public Opportunity opp {get;set;}
    public string htmlvalue {get;set;}
   
    
}