import { LightningElement, track } from 'lwc';
import findOpportunities from '@salesforce/apex/OpportunitySummaryController.findOpportunities';

export default class OderSummary extends LightningElement {

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

}