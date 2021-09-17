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

    @HttpPost //anotação de contexto da API
    //recebe um json, numa lista com um objeto customizado
    global static void insertLeads(List<LeadInsertWrapper> leadList){

        RestResponse resultRest = RestContext.response; //setamos o objeto de contexto de retorno
        List<Lead> leadListInsert = new List<Lead>(); //lista que salva os leads

        //percorremos a lista do objeto customizado e adicionamos um novo lead
        for(LeadInsertWrapper l : leadList){
            Lead leadToInsertObj = new Lead(
                LastName = l.lastName,
                Company  = l.comanyName,
                Status   = l.statusLead,
                Email    = l.emailLead 
            );
            leadListInsert.add(leadToInsertObj);
        }

        List<String> idsLeadsList = new List<String>(); //lista de retorno dos ids do lead
        //Interger int1, int2;

        if(leadListInsert.size() > 0){

            //faz um upsert na base de dados e guarda o resultado
            Database.UpsertResult[] results = Database.upsert(leadListInsert);

            //percorremos o resultado do upsert
            for(Integer index = 0 ; index < results.size() ; index++){

                //verificamos se o registro foi salvo com sucesso ou não
                if(results[index].isSuccess()){
                    Id idDoFor = results[index].Id;
                    idsLeadsList.add(idDoFor);
                }else{
                    idsLeadsList.add('ERROR');
                }

            }

        }

        resultRest.responseBody = Blob.valueOf(JSON.serializePretty(idsLeadsList));//transformamos a lista num corto de retorno no formato JSON
        resultRest.StatusCode = 200; //define o status
        
    }
    
}
