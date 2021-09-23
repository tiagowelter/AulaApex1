import { LightningElement, wire } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';

import { registerListener } from 'c/pubsub';

export default class CartDetails extends LightningElement {

    @wire(CurrentPageReference) pageRef;

    connectedCallback(){
        registerListener('productSelected', this.handleProducSelected, this);
    }

    handleProducSelected(product){
        console.log('pegou o seguinte produto: ', product);
    }

}