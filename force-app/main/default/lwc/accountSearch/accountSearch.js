import { LightningElement, track, wire } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';
import { fireEvent, registerListener } from 'c/pubsub'; //carrego os metodos do psub

export default class AccountSearch extends LightningElement {

    @track filter = null;

    @wire(CurrentPageReference) pageRef; //carrego as informações da página


    handleSearch(event){
        this.filter = event.target.value;
        this.fireFilterProds();
    }

    fireFilterAccounts(){
        console.log('esta enviando a busca',this.filter );
    
        this.delayTimeout = setTimeout(() => {
            fireEvent(this.pageRef, 'filterChangeSearch', this.filter);
        }, 350);    
    
    }

}