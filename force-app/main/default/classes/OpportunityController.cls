public with sharing class OpportunityController {

    @AuraEnabled
    public static Opportunity executeOpportunity(String opportunityName, Date dateClosed, String idAccount, String produtos)
    {

        system.debug('produtos '+produtos);

        Opportunity opp = new Opportunity();
        opp.Name        = opportunityName;
        opp.CloseDate   = dateClosed;
        opp.AccountId   = idAccount;
        opp.StageName   = 'Prospecting';
        insert opp;

        List<OpportunityItemWrapper> productsLis = (List<OpportunityItemWrapper>) JSON.deserialize(produtos, List<OpportunityItemWrapper>.class);

        //DESAFIO : vamos percorer a lista e adicionar um novo item de oportunidade em uma nova lista

        return opp;

    }
    

}
