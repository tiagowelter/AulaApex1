public class OpportunityItemWrapper {

    @AuraEnabled
    public String id {get;set;}
    
    @AuraEnabled
    public String nome {get;set;}
    
    @AuraEnabled
    public Decimal preco {get;set;}
    
    @AuraEnabled
    public Integer quantity {get;set;}

}
