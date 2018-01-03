@RestResource(urlMapping='/insertAccount')   
global class insertAccountRecord {
    
    @HttpPost
    global static Id createAccouunt(string accountName,string description) {
        
        Account acc = new Account();
        acc.Name = accountName;
        acc.Description = description;
        insert acc;
        return acc.Id; 
   }
}