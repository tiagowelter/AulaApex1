trigger LeadTrigger on Lead (after insert) {

    List<Task> taskList =  new List<Task>();

    for(Lead l : Trigger.new){

        Task taskObj = new Task();
        taskObj.Subject = 'Ligar para o lead';
        taskObj.ActivityDate = System.Today();
        taskObj.WhoId = l.Id;

        taskList.add(taskObj);

    }

    insert taskList;


}
