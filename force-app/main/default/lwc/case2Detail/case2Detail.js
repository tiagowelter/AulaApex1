import { LightningElement, wire, track } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';
import { registerListener } from 'c/pubsub';

export default class Case2Detail extends LightningElement {
    
    @wire(CurrentPageReference) pageRef;
    @track account = [];
    @track accountName = null;
    @track accountId = null;
    @track caseName = null;
    @track caseDate = null;
    
    connectedCallback(){
        registerListener('accountSelected', this.handleAccountSelected, this);
    }

    handleAccountSelected(accountPar){        
        console.log('accountPar', accountPar);
        this.account = [];
        this.account.push( {...JSON.parse(accountPar)} );
        console.log('this.account', this.account[0].nome);
        this.accountName = this.account[0].nome;
        this.accountId = this.account[0].id; 
    }

    handleCaseName(event){
        this.caseName = event.currentTarget.value;
    }

    handleCaseDate(event){
        this.caseDate = event.currentTarget.value;
    }

    get isSaveCase(){
        return this.accountId && this.caseName && this.caseDate;
    }
}