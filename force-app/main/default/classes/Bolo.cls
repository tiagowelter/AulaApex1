public with sharing class Bolo {

    private integer quantidadeOvos {get;set;}
    private Boolean possoAssarOBolo {get;set;}
    private Boolean fornoLigado = false;

    public Bolo() {

        this.quantidadeOvos = 5;
        preparaMassa();
        this.fornoLigado = true;
        assarBolo();

    }

    private void preparaMassa(){
        this.possoAssarOBolo = true;

        if(this.quantidadeOvos < 5){
            this.possoAssarOBolo = false;
        }
    }

    private void assarBolo(){
        if(this.fornoLigado && this.possoAssarOBolo){
            system.debug('Esta assando o bolo');
        }else{
            system.debug('Não esta assando o bolo');
        }
    }

}
