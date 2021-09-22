public with sharing class ProductController {
    
    //Ele listar todos os produtos
    //retornar o total de produtos listados
    //Buscar pelo nome dos produtos procurados
    //retornar a pagina que estamos

    @AuraEnabled(cacheable=true)
    public static PageResultWrapper getProducts(String filter){

        Integer pageSizeInt = 10;
        String whereClausuleStr = '';

        if(String.IsNotBlank(filter)){
            whereClausuleStr = ' WHERE Name LIKE \'%'+filter+'%\'';
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
