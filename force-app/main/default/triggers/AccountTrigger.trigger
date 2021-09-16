trigger AccountTrigger on Account (after insert,after update){

    //Variáveis de contexto
    //Trigger.New //Lista com os valores novos
    //Trigger.Old // Lista com os valores antigos - só no update

    if(Trigger.isInsert){

        List<Task> taskList = new List<Task>();

        for(Account a : Trigger.new){

            Task taskObj = new Task();
            taskObj.Subject = 'Verificar dados cadastrais';
            taskObj.ActivityDate  = System.Today();
            taskObj.WhatId = a.Id;
            taskList.add(taskObj);

        }

        insert taskList;

    }

}