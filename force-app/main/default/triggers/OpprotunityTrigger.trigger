trigger OpprotunityTrigger on Opportunity (after insert, after update) {

    Id SERVICES = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('Services').getRecordTypeId();

    if(Trigger.isInsert){

        List<Task> taskList = new List<Task>();

        for(Opportunity o : Trigger.new)
        {
            
            if(o.RecordTypeId == SERVICES)
            {
                task taskObj = new Task();
                taskObj.Subject = 'Realizar Serviço';
                taskObj.ActivityDate = System.Today();
                taskObj.WhatId = o.Id;
    
                taskList.add(taskObj);
            }

        }

        if(taskList.size() > 0 ){
            insert taskList;
        }

    }

}