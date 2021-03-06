import { LightningElement, track, wire } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import { fireEvent } from 'c/pubsub';

export default class SelectAccount extends LightningElement {

    @track accountsList = [];

    @wire(CurrentPageReference) pageRef; //carrega as informações da prória página

    //carrega as informações do método do Apex
    @wire(getAccounts,{})
    wiredResponseAccount({
        error,
        data
    }){
        if(error){
            console.log('ERRO AO BUSCAR OS CLIENTES', JSON.stringify(error));
        }else if(data){
            this.accountsList = JSON.parse(data);
        }
    }

    /*
    //Aqui é uma outra forma de chamar o método
    connectedCallback(){
        getAccounts({}).then( (response) => {
            console.log('response',response);
            this.accountsList = JSON.parse(response);
        }).catch( (erro) => {
            console.log('erro',erro);
        });
    }*/

    handleAccount(event){
        let idAccount = event.detail.value;
        console.log('O id da conta selecionada é', idAccount);
        fireEvent(this.pageRef, 'selectedAccount', idAccount);        
    }
    

}