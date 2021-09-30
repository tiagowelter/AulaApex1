public class PageResultWrapper {
    
    @AuraEnabled
    public integer numeroDaPagina {get;set;} //página que estamos atualmente
    
    @AuraEnabled
    public integer tamanhoDaPagina {get;set;} //tamanho total de dados mostrado na pagina
    
    @AuraEnabled
    public integer totalItensPesquisa {get;set;} //total geral de dados
    
    @AuraEnabled
    public object[] allDatas {get;set;} //lista de dados

}
