
@isTest
public with sharing class ClasseDemonstraEstruturaTest {
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
