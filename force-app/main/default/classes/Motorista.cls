public with sharing class Motorista {

    public static void girarChave(Boolean girouChave){

        Boolean estadoCarro = Carro.ligaCarro(girouChave);

        system.debug('O carro esta ligado? '+ estadoCarro);

    }

    public static void ligarFarol(String ligaFarol){

        String farolLigado = Carro.ligarFarol(ligaFarol == 'Sim' ? true : false);

        system.debug('Estado do farol: '+farolLigado);

    }

    //acelera // receber um inteiro // passar esse inteiro para o carro

    public static void aceleraCarro(Integer velocidade){

        system.debug('A velocidade do carro é: '+ Carro.aceleraCarro(velocidade)+' KM por hora.');

    }

    
    
}
