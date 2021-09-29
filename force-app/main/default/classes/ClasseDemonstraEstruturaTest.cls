
@isTest
public with sharing class ClasseDemonstraEstruturaTest {
    
    @TestSetup
    static void setup(){
        Opportunity oppObj  = new Opportunity();
        oppObj.Name         = 'Test';
        oppObj.CloseDate    = System.Today();
        oppObj.StageName    = 'Prospecting';
        oppObj.Amount       = 100;
        insert oppObj; 

        test.loadData(Account.sObjectType, 'AccountsTest');

        /*Account acctOjt = new Account();
        acctOjt.Name = 'Test';
        acctOjt.CustomerPriority__c = 'ZZ';
        insert acctOjt;*/
        
        Lead leadObj = new Lead();
        leadObj.LastName = 'Welter';
        leadObj.Email = 'tiagowelter@gmail.com';
        leadObj.Status = 'Working - Contacted';
        leadObj.Company = 'Empresa Tal';
        insert leadObj;

    }

    @isTest
    static void testnomeDoMetodo(){

        system.debug('Contas '+ [SELECT Name FROM Account]);

        Boolean verifyMethodBool = ClasseDemonstraEstrutura.nomeDoMetodo();

        System.AssertEquals(true, verifyMethodBool);

    }
        
    @istest
    static void testmetodoEstruturaControle1() {

        ClasseDemonstraEstrutura.metodoEstruturaControle1(1);
        ClasseDemonstraEstrutura.metodoEstruturaControle1(10);
        ClasseDemonstraEstrutura.metodoEstruturaControle1(11);
        ClasseDemonstraEstrutura.metodoEstruturaControle1(19);
        ClasseDemonstraEstrutura.metodoEstruturaControle1(50);

    }

    @istest
    static void testSomaDoisValores(){
        Integer i1 = ClasseDemonstraEstrutura.somaDoisValores(0,18);

        System.AssertEquals(i1,18);

        Integer i2 = ClasseDemonstraEstrutura.somaDoisValores(6,2);

        System.AssertEquals(i2,10);
    }

    @isTest
    static void testreturnAccountWithoutPriority(){

        List<Account> accountList = ClasseDemonstraEstrutura.returnAccountWithoutPriority();

        System.AssertEquals(accountList.size(), 0);

        Account accObj2 = new Account();
        accObj2.Name = 'Test2';
        insert accObj2;

        accountList = ClasseDemonstraEstrutura.returnAccountWithoutPriority();

        System.AssertEquals(accountList.size(), 1);

    }

    @isTest
    static void testgetTotalGrossByStage(){
        Decimal amountDec = ClasseDemonstraEstrutura.getTotalGrossByStage('Prospecting');
        System.AssertNotEquals(amountDec, 0 );
    }

    @isTest
    static void testreturnOpportunityByName(){

        Opportunity oppObj = [SELECT Name FROM Opportunity LIMIT 1];

        List<Opportunity> oppList = ClasseDemonstraEstrutura.returnOpportunityByName(oppObj.Name);

        System.AssertEquals(oppList.size(), 1);
    }

    @isTest
    static void testreturnOpportunityByName2(){

        Opportunity oppObj = [SELECT Name FROM Opportunity LIMIT 1];

        Opportunity oppRetObj = ClasseDemonstraEstrutura.returnOpportunityByName2(oppObj.Name);

        System.AssertNotEquals(oppRetObj, null);
    }

    @isTest
    static void testquantityAccounts(){

        Integer qntyAccountsInt = ClasseDemonstraEstrutura.quantityAccounts();

        System.AssertNotEquals(qntyAccountsInt, 0);

    }

    @isTest 
    static void testverifyLeadByEmail(){
        Boolean isLeadByEmailBool = ClasseDemonstraEstrutura.verifyLeadByEmail([SELECT Email FROM Lead WHERE Email != '' LIMIT 1].Email);
        System.AssertEquals(isLeadByEmailBool,true);
    }

    @isTest 
    static void testverifyLeadByEmail2(){
        Boolean isLeadByEmailBool = ClasseDemonstraEstrutura.verifyLeadByEmail2('sdgjahdgajsh@kjdhfkjashfkjasd.com');
        System.AssertEquals(isLeadByEmailBool,false);
    }

    @isTest
    static void testdemonstrationDML(){
        ClasseDemonstraEstrutura.demonstrationDML();

        Opportunity oppObj = [SELECT Name, StageName FROM Opportunity WHERE Name = 'Nome da oportunidade Exemplo 2' LIMIT 1];

        System.AssertNotEquals(oppObj, null);
        System.AssertEquals(oppObj.StageName, 'Qualification');

    }

    @istest
    static void testdemonstrationDML2(){

        ClasseDemonstraEstrutura.demonstrationDML2();

        List<String> strList = new List<String>();
        for(Integer count = 0; count < 10; count++){
            strList.add('Oportunidade Exemplo FOR '+count);
        }
        system.debug('strList '+ strList);

        List<Opportunity> oppList = new List<Opportunity>([SELECT Id FROM Opportunity WHERE Name IN :strList]);
        system.debug('oppList '+ oppList);

        System.AssertEquals(10, oppList.size());

    }

    @istest
    static void testaddAccount(){
        Account accObj = ClasseDemonstraEstrutura.addAccount();

        System.AssertNotEquals(accObj, null);
    }

    @istest
    static void testaddLead(){

        ClasseDemonstraEstrutura.addLead();

        List<String> strList = new List<String>();
        for(Integer i = 0; i < 10; i++){
            strList.add(i == 5 ? 'Tiago Welter' : 'LastName '+i);
        }
        system.debug('strList '+ strList);

        List<Lead> leadList = new List<Lead>([SELECT Id FROM Lead WHERE LastName IN :strList]);
        system.debug('leadList '+ leadList);

        System.AssertEquals(10, leadList.size());

    }    

}
