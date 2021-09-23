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

        //vamos verificar se existe o produto na lista
        //se não existir vamos adicionar
        //se existir vamos somar uma quantidade
        //console.log('hasProductInList(newProduct)', hasProductInList(newProduct));
        if( !this.hasProductInList(newProduct) ){
            //ADICIONEI UMA NOVA LINHA
            this._products.push( {...newProduct, quantity: 1} );
        }else{
            //SOMEI A QUANTIDADE EM UMA LINHA QUE EXISTIA
            this.getProductFromList(newProduct).quantity++;
        }


    }

    hasProductInList(product){
        console.log('entrou aqui');
        return this._products.filter( (prodParam) => prodParam.id === product.id ).length > 0;
    }

    getProductFromList(product){
        return this._products.find( prod => prod.id === product.id);
    }

}