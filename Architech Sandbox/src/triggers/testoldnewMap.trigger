trigger testoldnewMap on Account (after update) {

    for(Account acc : trigger.new){
        if(acc.Rating != trigger.oldMap.get(acc.id).Rating){
            system.debug('&&&&&&');
        }        
    }
}