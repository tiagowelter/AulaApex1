public with sharing class OpportunityDAO {
    
    public static List<Opportunity> getAllOpportunities(){

        List<Opportunity> oppList = new List<Opportunity>([SELECT Id, Name FROM Opportunity]);

        return oppList;

    }
    

}
