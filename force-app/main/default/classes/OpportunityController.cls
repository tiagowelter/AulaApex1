public with sharing class OpportunityController {

    @AuraEnabled
    public static Opportunity executeOpportunity(String opportunityName, Date dateClosed, String idAccount, String produtos)
    {

        system.debug('produtos '+produtos);

        PriceBook2 pb2 = [SELECT Id FROM PriceBook2 WHERE IsStandard = true LIMIT 1];

        Opportunity opp = new Opportunity();
        opp.Name        = opportunityName;
        opp.CloseDate   = dateClosed;
        opp.AccountId   = idAccount;
        opp.StageName   = 'Prospecting';
        opp.PriceBook2Id= pb2.Id;
        insert opp;

        List<OpportunityItemWrapper> productsLis = (List<OpportunityItemWrapper>) JSON.deserialize(produtos, List<OpportunityItemWrapper>.class);

        //DESAFIO : vamos percorrer a lista e adicionar um novo item de oportunidade em uma nova lista

        List<OpportunityLineItem> itensList = new List<OpportunityLineItem>();

        List<PriceBookEntry> pbeList = [SELECT Id, Product2Id FROM PriceBookEntry WHERE PriceBook2Id : pb2.Id];
        map<Id,PriceBookEntry> pbeMap = new Map<Id, PriceBookEntry>();
        for(PriceBookEntry p : pbeList){
            pbeMap.put(p.Product2Id, p);
        }

        for(OpportunityItemWrapper o : productsLis){

            PriceBookEntry pbeItem = pbeMap.get(o.id);

            OpportunityLineItem item = new OpportunityLineItem();
            item.OpportunityId = opp.Id;
            item.Product2Id    = o.id;
            item.UnitPrice     = o.preco;
            item.Quantity      = o.quantity;
            item.PriceBookEntryId = pbeItem.Id;
            
            itensList.add(item);

        }

        if(itensList.size() > 0){
            insert itensList;
        }

        return opp;

    }
    

}
