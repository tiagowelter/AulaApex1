trigger ContactTrigger on Contact (after insert, after update) {

    //before insert, before update, before delete, after insert, after update, after delete, after undelete
    
    if(Trigger.isInsert){        
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        string [] toaddress = new string[]{'tiagowelter@gmail.com'};

        email.saveAsActivity = false;
        email.setTargetObjectId(UserInfo.getUserId());
        email.setToAddresses(toaddress);
        email.setSubject('Novo contato Adicionado');
        email.setPlainTextBody('Um novo contato foi adicionado no Salesforce');

        Messaging.sendEmail( new Messaging.SingleEmailMessage[] { email } );

    }

    if(Trigger.isUpdate){
    
    
    }
}