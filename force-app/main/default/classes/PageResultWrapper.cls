public class PageResultWrapper {
    
    @AuraEnabled
    public integer numeroDaPagina {get;set;} //página que estamos atualmente
    
    @AuraEnabled
    public integer tamanhoDaPagina {get;set;} //tamanho total de produtos mostrado na pagina
    
    @AuraEnabled
    public integer totalItensPesquisa {get;set;} //total geral de produtos
    
    @AuraEnabled
    public object[] produtos {get;set;} //lista de produtos

}
