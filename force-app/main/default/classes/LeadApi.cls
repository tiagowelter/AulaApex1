@RestResource(urlMapping='/cursoapex/Leads/*')

//https://mindful-wolf-53lb9f-dev-ed.my.salesforce.com/services/apexrest/cursoapex/Leads

global with sharing class LeadApi {

    @HttpGet //tipo de requisição
    global static void getLeads(){

        RestResponse restResult = RestContext.response; //variavel de contexto de retorno

        List<Lead> leadList = new List<Lead>([SELECT Id, Name, Email, Company FROM Lead]);

        //Integer i = 0;
        //String str = String.Valueof(i);

        restResult.responseBody = Blob.valueOf(JSON.serializePretty(leadList));
        restResult.StatusCode = 200;

    }

    @HttpPost
    global static void insertLeads(List<LeadInsertWrapper> leadList){

        RestResponse resultRest = RestContext.response;
        List<Lead> leadListInsert = new List<Lead>();

        for(LeadInsertWrapper l : leadList){
            Lead leadToInsertObj = new Lead(
                LastName = l.lastName,
                Company  = l.comanyName,
                Status   = l.statusLead,
                Email    = l.emailLead 
            );
            leadListInsert.add(leadToInsertObj);
        }

        List<String> idsLeadsList = new List<String>();
        //Interger int1, int2;

        if(leadListInsert.size() > 0){

            Database.UpsertResult[] results = Database.upsert(leadListInsert);

            for(Integer index = 0 ; index < results.size() ; index++){

                if(results[index].isSuccess()){
                    Id idDoFor = results[index].Id;
                    idsLeadsList.add(idDoFor);
                }else{
                    idsLeadsList.add('ERROR');
                }

            }

        }

        resultRest.responseBody = Blob.valueOf(JSON.serializePretty(idsLeadsList));
        resultRest.StatusCode = 200;
        
    }
    
}
