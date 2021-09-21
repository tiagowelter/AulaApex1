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
}
