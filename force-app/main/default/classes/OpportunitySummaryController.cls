public class OpportunitySummaryController {

    @AuraEnabled
    public static List<Opportunity> findOpportunities(){

        List<Opportunity> oppoList = OpportunityDAO.getAllOpportunities();

        return oppoList;

    }

}
