@isTest
private class DailyLeadProcessorTest{

   
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    static testmethod void testScheduledJob(){
        List<Lead> leads = new List<Lead>();
        
        for (Integer i=0; i<200; i++) {
            Lead ld = new Lead(LastName = 'Name' + i,Company='SAASFOCUS');
            leads.add(ld);
        }
        insert leads ;
        System.assertEquals(200, leads.size(), 'Tasks exist before job has run');
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',CRON_EXP,new DailyLeadProcessor());     
        
    }
}