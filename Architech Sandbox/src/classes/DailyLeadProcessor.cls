global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<Lead> lead = [SELECT Id, Name, LeadSource FROM Lead WHERE LeadSource = Null];
        List<Lead> leadtoUpdate = new List<Lead>();
        for(Lead ld : lead){
            ld.LeadSource = 'Dreamforce';
            leadtoUpdate.add(ld);
        }
        update leadtoUpdate;
    }
    
}