import { LightningElement, wire, track } from 'lwc';
import { CurrentPageReference} from 'lightning/navigation';
import { fireEvent, registerListener } from 'c/pubsub';
import getAccountsSearch from '@salesforce/apex/AccountController.getAccountsSearch';

export default class AccountList extends LightningElement {
    
    @wire(CurrentPageReference) pageRef;

    @track accountId = null;
    @track filter = null;
    @track pageNumber = 1;
    @track totalItemCount = 0;
    @track pageSize;

    @wire(getAccountsSearch, {filter : '$filter', pageNumber : '$pageNumber'}) accountsObj;

    connectedCallback(){
        registerListener('filterChangeSearch', this.getChangedValue, this);
    }

    getChangedValue(param){
        this.filter = param;
        this.pageNumber = 1;
    }    

    handlePreviousPage(){
        this.pageNumber = this.pageNumber - 1;
    }

    handleNextPage(){
        this.pageNumber = this.pageNumber + 1;
    }


}