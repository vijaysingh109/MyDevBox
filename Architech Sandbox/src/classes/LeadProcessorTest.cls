@isTest
private class LeadProcessorTest{

    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 200 leads
        for (Integer i=0;i<200;i++) {
            Lead lead = new Lead(LastName = 'VIJAY', Company='SAASFOCUS');
            leads.add(lead);
        }
        insert leads;
    }

    static testmethod void test() {        
        Test.startTest();
        LeadProcessor  leadPro = new LeadProcessor ();
        Id batchId = Database.executeBatch(leadPro);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead where LeadSource= 'Dreamforce']);
    }
    
}