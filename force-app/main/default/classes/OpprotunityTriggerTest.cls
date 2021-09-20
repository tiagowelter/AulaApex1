@isTest
public class OpprotunityTriggerTest {
    
    @isTest
    static void testInsertOppService(){

        test.startTest();
        
        Id SERVICES = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('Services').getRecordTypeId();
        Id SALES = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('Sales').getRecordTypeId();

        Opportunity oppObj = new Opportunity();
        oppObj.Name = 'Service test';
        oppObj.CloseDate = System.Today();
        oppObj.RecordTypeId = SERVICES;
        oppObj.StageName    = 'Prospecting';
        insert oppObj;

        List<Task> taskList = new List<Task>([SELECT Id FROM Task WHERE WhatId = :oppObj.Id]);

        System.AssertEquals(1, taskList.size());

        Opportunity oppObj2 = new Opportunity();
        oppObj2.Name = 'Sales test';
        oppObj2.CloseDate = System.Today();
        oppObj2.StageName    = 'Prospecting';
        oppObj2.RecordTypeId = SALES;
        insert oppObj2;

        taskList = new List<Task>([SELECT Id FROM Task WHERE WhatId = :oppObj2.Id]);

        System.AssertEquals(0, taskList.size());

        test.stopTest();

    }
    
}
