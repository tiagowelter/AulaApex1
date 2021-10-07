public with sharing class CaseController {
    
    @AuraEnabled
    public static Case addNewCase(String accountId, String caseName, String caseDate, String caseDescription){

        Case caseObj = new Case();
        caseObj.Subject         = caseName;
        caseObj.AccountId       = accountId;
        caseObj.Origin          = 'Aplicativo';
        caseObj.Status          = 'New';
        caseObj.Description     = caseDescription;
        insert caseObj;

        return caseObj;

    }    

    @AuraEnabled
    public static List<Case> findCases(){

        List<Case> caseList = new List<Case>([SELECT Id, Subject, CreatedDate FROM Case WHERE Origin = 'Aplicativo']);

        return caseList;

    }

}
