public with sharing class ClasseDemonstraEstrutura {

    public static Boolean nomeDoMetodo(){

        //Del=claro as variaveis que pertencem ao metodo
        Boolean primeiraVariavelBooleana = true;
        String exemploString = 'texto';
        Decimal decimalDeExemplo = 50.01;
        Double doubleExemplo = 50.000001;

        Set<String> listaDeExemploSet = new Set<String>();
        listaDeExemploSet.add('Informação 1');
        listaDeExemploSet.add('Informação 1');
        system.debug('listaDeExemploSet '+listaDeExemploSet);

        List<String> listaDeExemploList = new List<String>();
        listaDeExemploList.add('Informação 1');
        listaDeExemploList.add('Informação 1');
        listaDeExemploList.add('Informação 2');
        listaDeExemploList.add('Informação 3');
        system.debug('listaDeExemploList '+listaDeExemploList);

        List<Integer> listaExInteger = new List<Integer>();
        listaExInteger.add(1);
        listaExInteger.add(20);
        listaExInteger.add(78);
        system.debug('listaExInteger '+listaExInteger);

        List<String> listaDeExemploList2 = new List<String>{'Informação 1','Informação 2','Informação 3'};
        system.debug('listaDeExemploList2 '+listaDeExemploList2);

        List<Opportunity> opportunityList = new List<Opportunity>([SELECT Id, Name FROM Opportunity]);
        system.debug('opportunityList '+ opportunityList);

        system.debug('A lista de oportunidades tem essa quantidade de registros: '+opportunityList.size());


        Account accountVariable;
        Opportunity opportunityVariable;
        
        //duas formas de fazer o for
        //forma 1
        Integer count = 1;
        for(Opportunity o : opportunityList){
            system.debug('Nome da oportunidade '+count+' : '+o.Name);
            count++;
        }

        //forma 2
        for(Integer count1 = 0 ; count1 < opportunityList.size(); count1++ ){
            system.debug('Nome da oportunidade '+count1+' no FOR 2: '+opportunityList[count1].Name);
        }

        //While
        String nameOpportunity;

        while(nameOpportunity == null){
            count = 1;
            for(Opportunity o : opportunityList){
                nameOpportunity = o.Name;
                system.debug('Nome da oportunidade no While '+count+' : '+o.Name);
                count++;
            }
        }

        return primeiraVariavelBooleana;

    }

    public static Boolean metodoEstruturaControle1(Integer paramInt1){
        Boolean retBoolean = false;

        if( paramInt1 > 10 && paramInt1 != 19){
            retBoolean = true;
        }else if(paramInt1 == 19){
            retBoolean = false;
        }else{
            retBoolean = false;
        }

        system.debug('retBoolean '+retBoolean);

        return retBoolean;

    } 

    //Desafio 1
    //Construir um método que receba dois parâmetros do tipo Inteiro e retorne o a soma destes dois parâmetros
    //Se o parâmetro 1 for maior do 5 deve somar mais dois neste resultado
    public static Integer somaDoisValores(Integer paramInt1, Integer paramInt2)
    {

        Integer resultSum = paramInt1 + paramInt2;

        if(paramInt1 > 5){
            resultSum += 2;
        }

        system.debug('resultSum '+resultSum );

        return resultSum;

    }

    public static List<Account> returnAccountWithoutPriority(){

        List<Account> acoountList = new List<Account>([SELECT Id, Name, CustomerPriority__c FROM Account WHERE CustomerPriority__c = '' ORDER BY Name]);

        system.debug('acoountList '+acoountList);

        return acoountList;

    }

    //Debug : ClasseDemonstraEstrutura.getTotalGrossByStage('Qualification');
    public static Decimal getTotalGrossByStage(String stageNameStr){

        //Monta uma lista e depois dentro da mesma executa uma query com uma variável do Apex agregada: stageNameStr
        List<Opportunity> opportunitiesList = new List<Opportunity>([SELECT GrossTotal__c, Amount FROM Opportunity WHERE StageName = :stageNameStr]);

        //List > Add
        //Map > Put

        system.debug('opportunitiesList '+opportunitiesList);

        //Define a variavel de retorno
        Decimal totalDecimal = 0;
        Decimal totalGrossDecimal = 0;

        //Aqui percorremos a lista opportunitiesList e aliemntamos o valor da variável totalDecimal com o valor do o.Amount
        for(Opportunity o : opportunitiesList){
            //totalDecimal =  totalDecimal + o.Amount;
            totalDecimal +=  o.Amount;
            totalGrossDecimal += o.GrossTotal__c;
        }

        system.debug('totalDecimal '+totalDecimal);
        system.debug('totalGrossDecimal '+totalGrossDecimal);
        return totalDecimal;
    }

    //DESAFIO : Criar uma classe que receba o nome de uma oportunidade, faça uma consulta e retorne os dados da mesma.
    //Forma 1 
    //ClasseDemonstraEstrutura.returnOpportunityByName('Burlington Textiles Weaving Plant Generator');
    public static List<Opportunity> returnOpportunityByName(String nameStr){

        List<Opportunity> opportunitiesList = new List<Opportunity>([SELECT Id, Name FROM Opportunity WHERE Name = :nameStr ]);

        system.debug('opportunitiesList '+opportunitiesList);
        return opportunitiesList;

    }

    //Forma 2
    //ClasseDemonstraEstrutura.returnOpportunityByName2('Burlington Textiles Weaving Plant Generator');
    public static Opportunity returnOpportunityByName2(String nameStr){

        Opportunity opportunityObj = [SELECT Id, Name FROM Opportunity WHERE Name = :nameStr LIMIT 1];
        system.debug('opportunityObj '+opportunityObj);
        return opportunityObj;

    }

    //DESAFIO : Criar uma classe que retorne a quantidade de contas cadastradas no sistema.
    //ClasseDemonstraEstrutura.quantityAccounts();
    public static Integer quantityAccounts(){

        List<Account> accountList = new List<Account>([SELECT Id FROM Account]);

        system.debug('accountList '+ accountList.size());

        return accountList.size();

    }
    
    //DESAFIO: Criar uma classe que receba um email e verifique se existe um lead, retornar true ou false;
}
