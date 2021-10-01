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

}
