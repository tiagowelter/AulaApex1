import { LightningElement, wire, track } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';

import { registerListener } from 'c/pubsub';

export default class CartDetails extends LightningElement {

    @wire(CurrentPageReference) pageRef;
    @track accountId = null;
    @track _products = [];

    connectedCallback(){
        registerListener('productSelected', this.handleProducSelected, this);
        registerListener('selectedAccount', this.getAccount, this);
    }

    getAccount(account){
        console.log('esta buscando o account aqio list itens');
        this.accountId = account;
    }

    get getAccountId(){
        return this.accountId;
    }

    handleProducSelected(product)
    {
        console.log('pegou o seguinte produto: ', product);

        let newProduct = {...JSON.parse(product)};

        console.log('tratou o json do produto produto: ', newProduct);

        this._products.push( {...newProduct, quantity: 1} );

    }

}