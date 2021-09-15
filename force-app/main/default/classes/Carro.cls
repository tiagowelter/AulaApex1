public with sharing class Carro {

    public static void trocarRodas(){
        String estadoAtualDasRodas = 'velhas';
        estadoAtualDasRodas = 'Novas';
        System.debug('Estado das rodas: '+estadoAtualDasRodas);
    }

    public static Boolean ligaCarro(Boolean ligaCarro)
    {

        Boolean carroLigado = ligaCarro ? true : false;

        /*if(ligaCarro == true){
            carroLigado = false;
        }else{
            carroLigado = true;
        }*/

        return ligaCarro ? true : false;

    }

    public static String ligarFarol(Boolean ligaFarol)
    {

        return ligaFarol ? 'Farol Ligado' : 'Farol Desligado';

    }

    ///velocimetro // recebe a velocidade // retorna a mesma velocidade

    public static Integer aceleraCarro(Integer velocidade){
        return velocidade;
    }

}
