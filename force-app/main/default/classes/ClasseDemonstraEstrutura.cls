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

}
