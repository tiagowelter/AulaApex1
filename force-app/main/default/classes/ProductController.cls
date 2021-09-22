public with sharing class ProductController {
    
    //Ele listar todos os produtos
    //retornar o total de produtos listados
    //Buscar pelo nome dos produtos procurados
    //retornar a pagina que estamos

    @AuraEnabled
    public static PageResultWrapper getProducts(){

        Integer pageSizeInt = 10;

        PageResultWrapper result = new PageResultWrapper();
        result.tamanhoDaPagina = pageSizeInt;
        result.numeroDaPagina = 0;
        result.totalItensPesquisa = Database.countQuery('SELECT count() FROM Product2');
        result.produtos = Database.query('SELECT Id, Name FROM Product2');
        
        return result;

    }
    

}
