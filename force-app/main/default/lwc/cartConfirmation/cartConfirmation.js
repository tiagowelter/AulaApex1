import { LightningElement, api } from 'lwc';
import { NavigationMixin} from 'lightning/navigation';
import executeOpportunity from '@salesforce/apex/OpportunityController.executeOpportunity';

export default class CartConfirmation extends NavigationMixin(LightningElement) {

    @api products;
    @api nameopp;
    @api dateopp;
    @api amountopp;
    @api iddaconta;

    closeModal(){
        const cancelEvent = new CustomEvent( "cancelconfirmation", {
            detail : {},
        });
        this.dispatchEvent(cancelEvent);
    }

    submitDetails(){

        executeOpportunity({opportunityName : this.nameopp, dateClosed : this.dateopp, idAccount: this.iddaconta, produtos : JSON.stringify(this.products)}).then((response) => {
            console.log('response opportunidade', response);
        }).catch( (error) => {
            console.log('ERRO AO PROCESSAR A OPORTUNIDADE: ', error);
        });

    }


}