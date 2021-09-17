@RestResource(urlMapping='/cursoapex/Accounts/*')

global with sharing class AccountApi {

    @HttpGet
    global static List<Account> getAccounts(){

        List<Account> accountList = new List<Account>();
        RestRequest request = RestContext.request;

        String idAccountStr = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);

        system.debug('idAccountStr '+ idAccountStr);

        if(  String.isBlank(idAccountStr) ){
            accountList = new List<Account>([SELECT Id, Name FROM Account]);
            system.debug('entrou no if ');
        }else{
            accountList = new List<Account>([SELECT Id, Name FROM Account WHERE Id = :idAccountStr]);
            system.debug('entrou no else ');
        }

        return accountList;

    }

    @HttpPost
    global static void insertAccount(List<AccountInsertWrapper> accountList){

        RestResponse resultRest = RestContext.response;
        List<Account> accountToAddList = new List<Account>();

        for(AccountInsertWrapper a : accountList){

            Account accToAddObj = new Account(
                Name = a.nameAccount
            );
            accountToAddList.add(accToAddObj);

        }

        List<String> idsList = new List<String>();

        if(accountToAddList.size() > 0){

            Database.SaveResult[] results = Database.insert(accountToAddList);

            for(Integer index = 0; index < results.size() ; index++){
                if(results[index].isSuccess()){
                    idsList.add(results[index].id);
                }else{
                    idsList.add('Error');
                }
            }

        }

        resultRest.responseBody = Blob.Valueof(JSON.serializePretty(idsList));

    }


}
