public class AddPrimaryContact  implements Queueable{
    
    Contact contact;
    string stateName = '';
    public AddPrimaryContact(Contact con, string state){
        this.stateName = state;
        this.contact = con;
    }
    
    public void execute(QueueableContext context) {
             
             createSameContact(contact, stateName);
            
    }
    
    
    public static void createSameContact(Contact con , String stateName ){
            
         List<Account> ListAccount = [SELECT ID, Name ,(Select id,FirstName,LastName from contacts ) FROM ACCOUNT WHERE BillingState = :stateName LIMIT 200];
         List<Contact> lstContact = new List<Contact>();
         for (Account acc:ListAccount){
             Contact cont = con.clone(false,false,false,false);
             cont.AccountId =  acc.id;
             lstContact.add( cont );
         }
         
         if(lstContact.size() >0 ){
             insert lstContact;
         }

    }
   
}