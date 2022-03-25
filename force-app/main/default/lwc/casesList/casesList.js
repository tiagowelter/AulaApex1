import { LightningElement, track } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
import findCases from '@salesforce/apex/CaseController.findCases';

const columns = [
    {
        label : 'Id do Chamado',
        fieldName : 'Id',
        type : 'text',
        shortable : true,
        hideDefaultActions : true
    },
    {
        label : 'Título do problema',
        fieldName : 'Subject',
        type : 'text',
        shortable : true,
        hideDefaultActions : true
    },
    {
        label : 'Data de abertura',
        fieldName : 'CreatedDate',
        type : 'date',
        shortable : true,
        hideDefaultActions : true
    }
];

export default class CasesList extends NavigationMixin(LightningElement) {
    
    @track columns = columns;
    @track data = [];

    connectedCallback(){
        this.findAllCases();
    }

    findAllCases(){

        findCases({}).then( (response) => {

            console.log('response',response);
            this.data = response;

        }).catch( (erro) => {

            console.log('erro',erro);

        });

    }
    
    executeNewCase(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'new'
            },
        });        
        /*this[NavigationMixin.Navigate]({
            type : 'standard__navItemPage',
            attributes: {
                apiName : 'Cases_Creator'
            }
        });*/
    }
}