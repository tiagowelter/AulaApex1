import { LightningElement, track } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
import findOpportunities from '@salesforce/apex/OpportunitySummaryController.findOpportunities';

export default class OderSummary extends NavigationMixin(LightningElement) {

    @track opportunities = [];

    connectedCallback(){
        this.findAllOpportunities();
    }

    findAllOpportunities(){

        findOpportunities({}).then( (response) => {

            console.log('response',response);

            this.opportunities = response;

        }).catch( (erro) => {

            console.log('erro',erro);

        });

    }

    executeNewSale(){
        this[NavigationMixin.Navigate]({
            type : 'standard__navItemPage',
            attributes: {
                apiName : 'Carrinho_2'
            }
        });
    }

}