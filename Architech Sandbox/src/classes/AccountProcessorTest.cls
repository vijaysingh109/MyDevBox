@IsTest
private class AccountProcessorTest{

  @IsTest
  private static void testcountContacts() {
    Test.setMock(HttpCalloutMock.class, new accountUpdate ());
    Test.startTest();
    Account acc = new Account(Name='Test VJ');
    insert acc;
    Contact con = new Contact(LastName = 'Test VJ',AccountId=acc.id);
    insert con;
    list<Id> accountIds = new list<Id>();
    accountIds.add(acc.id);
    AccountProcessor.countContacts(accountIds );
    Test.stopTest();
    // runs callout and check results
    Account acc1 = [select Number_of_Contacts__c from Account where Id =:acc.id];
    System.assertEquals(1, acc1.Number_of_Contacts__c);
  }

}