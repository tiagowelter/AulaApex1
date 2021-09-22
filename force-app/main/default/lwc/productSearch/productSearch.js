import { LightningElement, track, wire } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';
import { fireEvent, registerListener } from 'c/pubsub'; //carrego os metodos do psub

export default class ProductSearch extends LightningElement {

    @track accountId = null;

    @wire(CurrentPageReference) pageRef; //carrego as informações da página

    //este metodo é executado sempre que o componente é renderizado
    connectedCallback(){
        //aqui capturamos um evento com o seu respectivo valor e executamos um método para tratar esse valor
        registerListener('selectedAccount', this.getAccount, this);
    }

    //Metodo que trata o valor do evento capturado
    getAccount(account){
        this.accountId = account;
        console.log('CAPTUROU NO OUTRO COMPONENTE', this.accountId);
    }

    get getAccountId(){
        return this.accountId;
    }    

}