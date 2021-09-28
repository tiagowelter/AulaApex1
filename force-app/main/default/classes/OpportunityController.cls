public with sharing class OpportunityController {

    @AuraEnabled
    public static Opportunity executeOpportunity(String opportunityName, Date dateClosed, String idAccount, String produtos)
    {

        system.debug('produtos '+produtos);

        //Posicionamos na lista de preço padrão, para conseguir relacionar com a oportunidade
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

        //carregamos os produtos da lista de preço padrão
        List<PriceBookEntry> pbeList = [SELECT Id, Product2Id FROM PriceBookEntry WHERE PriceBook2Id = :pb2.Id];

        //utilizamos este MAP para guardar os produtos da lista, fizemos isso para não fazer uma query dentro do for
        map<Id,PriceBookEntry> pbeMap = new Map<Id, PriceBookEntry>();
        for(PriceBookEntry p : pbeList){
            pbeMap.put(p.Product2Id, p);
        }

        for(OpportunityItemWrapper o : productsLis){

            //buscamos no MAP o ID da lista de preço pelo ID do produto
            PriceBookEntry pbeItem = pbeMap.get(o.id);

            //comentamos este if pois solucionamos o problema no ProductController
            //if(pbeItem != null){
                OpportunityLineItem item = new OpportunityLineItem();
                item.OpportunityId = opp.Id;
                item.Product2Id    = o.id;
                item.UnitPrice     = o.preco;
                item.Quantity      = o.quantity;
                item.PriceBookEntryId = pbeItem.Id;
                
                itensList.add(item);
            //}

        }

        if(itensList.size() > 0){
            insert itensList;
        }

        return opp;

    }
    

}
