trigger opportunity on Opportunity (after update) {
    
    Id[] workItemIds = getWorkItemId(trigger.newMap.keyset());
    System.debug('workItemIds ---------'+workItemIds);
    
    if(workItemIds.size()>0){
        for(Id workItemId :workItemIds){
            Approval.ProcessWorkitemRequest req2 = new Approval.ProcessWorkitemRequest();
            req2.setComments('Approving request.');
            req2.setAction('Approve'); //This is the action that is approve in your case, you can set it to Reject also
            //req2.setNextApproverIds(new Id[] {UserInfo.getUserId()});
            req2.setWorkitemId(workItemId); 
            Approval.ProcessResult result2 =  Approval.process(req2);
        }
    }
    
    public Id[] getWorkItemId(set<Id> targetObjectIds)
    {
        list<Id> retVal = new List<Id>();
        for(ProcessInstanceWorkitem workItem  : [Select p.Id from ProcessInstanceWorkitem p
            where p.ProcessInstance.TargetObjectId =: targetObjectIds])
        {
            retVal.add(workItem.Id);
        }
        return retVal;
    }
    
}