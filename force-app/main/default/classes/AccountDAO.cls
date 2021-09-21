public with sharing class AccountDAO {

    public static List<Account> getAccounts(){
        List<Account> accountList = new List<Account>([SELECT Id, Name FROM Account]);
        return accountList;
    }

}
