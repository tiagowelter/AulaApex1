trigger LeadTrigger on Lead (after insert){

    List<Task> taskList =  new List<Task>();

    for(Lead l : Trigger.new){

        List<Account> accList = new List<Account>([SELECT Id FROM Account WHERE Name != '']);

        Id idAccount;
        for(Account a : [SELECT Id FROM Account WHERE Name != '']){
            idAccount = a.Id;
        }

        Task taskObj = new Task();
        taskObj.Subject = 'Ligar para o lead';
        taskObj.ActivityDate = System.Today();
        taskObj.WhoId = l.Id;
        taskObj.WhatId = idAccount;

        //taskList.add(taskObj);
        insert taskList;

    }

}
