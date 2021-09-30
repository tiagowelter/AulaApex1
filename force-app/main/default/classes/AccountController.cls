public class AccountController {
    
    @AuraEnabled(cacheable=true)
    public static String getAccounts(){
        List<Account> accountList = AccountDAO.getAccounts();
        system.debug('accountList '+ accountList);
        List<InputWrapper> listReturn = new List<InputWrapper>();
        for(Account a : accountList){
            listReturn.add(new InputWrapper(a.Id, a.Name));
        }
        system.debug('listReturn '+ listReturn);
        system.debug('JSON '+ JSON.serialize(listReturn));
        return JSON.serialize(listReturn);
    }

    @AuraEnabled(cacheable=true)
    public static PageResultWrapper getAccountsSearch(String filter, Integer pageNumber){

        String whereClausuleStr = '';
        Integer pageSize        = 9;
        Integer offset          = (pageNumber-1)*pageSize;

        if(String.IsNotBlank(filter)){
            whereClausuleStr = ' WHERE Name LIKE \'%'+filter+'%\'';
        }

        PageResultWrapper result    = new PageResultWrapper();
        result.tamanhoDaPagina      = pageSize;
        result.numeroDaPagina       = 0;
        result.totalItensPesquisa   = Database.countQuery('SELECT count() FROM Account '+whereClausuleStr);
        result.allDatas = Database.query('SELECT Id, Name FROM Account '+whereClausuleStr+' LIMIT :pageSize OFFSET :offset ');

        return result;

    }

}
