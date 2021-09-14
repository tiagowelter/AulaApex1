public with sharing class Carro {

    public static void trocarRodas(){
        String estadoAtualDasRodas = 'velhas';
        estadoAtualDasRodas = 'Novas';
        System.debug('Estado das rodas: '+estadoAtualDasRodas);
    }

}
