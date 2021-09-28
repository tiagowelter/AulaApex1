import { LightningElement, track } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
import findOpportunities from '@salesforce/apex/OpportunitySummaryController.findOpportunities';

const columns = [
    {
        label : 'Id da Oportunidade',
        fieldName : 'Id',
        type : 'text',
        shortable : true,
        hideDefaultActions : true
    },
    {
        label : 'Nome da oportunidade',
        fieldName : 'Name',
        type : 'text',
        shortable : true,
        hideDefaultActions : true
    }
];

export default class OderSummary extends NavigationMixin(LightningElement) {

    @track opportunities = [];

    connectedCallback(){
        this.findAllOpportunities();
    }

    @track columns = columns;
    @track data = [];

    findAllOpportunities(){

        findOpportunities({}).then( (response) => {

            console.log('response',response);

            this.opportunities = response;
            this.data = response;

        }).catch( (erro) => {

            console.log('erro',erro);

        });

    }

    executeNewSale(){
        this[NavigationMixin.Navigate]({
            type : 'standard__navItemPage',
            attributes: {
                apiName : 'Carrinho'
            }
        });
    }

}