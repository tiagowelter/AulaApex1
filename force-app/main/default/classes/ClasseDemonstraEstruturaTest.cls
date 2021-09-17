
@isTest
public with sharing class ClasseDemonstraEstruturaTest {
    
    @isTest
    static void testnomeDoMetodo(){

        Opportunity oppObj = new Opportunity();
        oppObj.Name = 'Test';
        oppObj.CloseDate = System.Today();
        oppObj.StageName = 'Prospecting';
        insert oppObj;

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
    static void testSomaDoisValores() {
        ClasseDemonstraEstrutura.somaDoisValores(0,18);
    }

}
