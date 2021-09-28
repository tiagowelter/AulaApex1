public with sharing class ProductController {
    
    //Ele listar todos os produtos
    //retornar o total de produtos listados
    //Buscar pelo nome dos produtos procurados
    //retornar a pagina que estamos

    @AuraEnabled(cacheable=true)
    public static PageResultWrapper getProducts(String filter){

        Integer pageSizeInt = 10;
        String whereClausuleStr = '';

        //PriceBook2 pb2 = [SELECT Id FROM PriceBook2 WHERE IsStandard = true LIMIT 1];
        List<PriceBookEntry> pbeList = [SELECT Id, Product2Id FROM PriceBookEntry WHERE /*PriceBook2Id = :pb2.Id AND*/ PriceBook2.IsStandard  = true];
        List<Id> idsProdsList =  new List<Id>();
        
        for(PriceBookEntry p : pbeList){
            idsProdsList.add(p.Product2Id);
        }

        if(String.IsNotBlank(filter)){
            whereClausuleStr = ' WHERE Name LIKE \'%'+filter+'%\'';
        }

        if(idsProdsList.size() > 0){
            if(String.isBlank(whereClausuleStr)){
                whereClausuleStr += ' WHERE Id In :idsProdsList ';
            }else{
                whereClausuleStr += ' AND Id In :idsProdsList ';
            }
            
        }

        system.debug('SELECT Id, Name, Price__c, DisplayUrl FROM Product2 '+whereClausuleStr);

        PageResultWrapper result    = new PageResultWrapper();
        result.tamanhoDaPagina      = pageSizeInt;
        result.numeroDaPagina       = 0;
        result.totalItensPesquisa   = Database.countQuery('SELECT count() FROM Product2 '+whereClausuleStr);
        result.produtos = Database.query('SELECT Id, Name, Price__c, DisplayUrl FROM Product2 '+whereClausuleStr);

        system.debug('result '+result);

        return result;

    }
    

}
