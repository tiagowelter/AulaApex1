import { LightningElement, wire, track } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';
import { registerListener } from 'c/pubsub';
import addNewCase from '@salesforce/apex/CaseController.addNewCase';
import { NavigationMixin} from 'lightning/navigation';

export default class Case2Detail extends NavigationMixin(LightningElement) {
    
    @wire(CurrentPageReference) pageRef;
    @track account = [];
    @track accountName = null;
    @track accountId = null;
    @track caseName = null;
    @track caseDate = null;
    @track caseDescription = null;
    @track errorMessage = null;
    
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
        return this.accountId && this.caseName && this.caseDate && this.caseDescription;
    }

    handleDescription(event){
        this.caseDescription = event.currentTarget.value;
    }

    get isClientBlank(){
        return !this.accountId;
    }

    createNewCase(){
        addNewCase({accountId : this.accountId, caseName : this.caseName, caseDate: this.caseDate, caseDescription : this.caseDescription }).then((response) => {
            this[NavigationMixin.Navigate]({
                type : 'standard__recordPage',
                attributes : {
                    recordId : response.Id,
                    actionName : 'view'
                }
            });
        }).catch( (error) => {
            console.log('ERRO AO CRIAR UM CASO', error);
            this.errorMessage = error.body.fieldErrors.Subject[0].message;
            console.log('this.errorMessage', this.errorMessage.body.fieldErrors.Subject[0].message);
        });
    }

    get getErrorMessage(){
        return this.errorMessage != null;
    }
}