import { LightningElement, wire, track } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';

import { registerListener } from 'c/pubsub';

export default class CartDetails extends LightningElement {

    @wire(CurrentPageReference) pageRef;
    @track accountId = null;
    @track _products = [];
    @track amountTotal = 0;
    @track opportunityName = null;
    @track opportunityDate = null;
    @track isShowModal = false;
    @track errorMessage = null;

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
        this.calculateTotal();

    }

    hasProductInList(product){
        console.log('entrou aqui');
        return this._products.filter( (prodParam) => prodParam.id === product.id ).length > 0;
    }

    getProductFromList(product){
        return this._products.find( prod => prod.id === product.id);
    }

    get hasProducts(){
        return this._products.length > 0;
    }

    handleProductPrice(event){
        let selectedItem = event.currentTarget.ariaRowIndex;
        this._products[selectedItem].preco = event.currentTarget.value;
        this.calculateTotal();
    }

    handleProductQuantity(event){
        let selectedIten = event.currentTarget.ariaRowIndex;
        this._products[selectedIten].quantity = event.currentTarget.value;
        this.calculateTotal();
    }

    calculateTotal(){
        this.amountTotal = this._products.reduce( (total, prod) => ( total += prod.quantity * prod.preco), 0 );
    }

    handleOppName(event){
        this.opportunityName = event.currentTarget.value;
    }

    handleOppDate(event){
        this.opportunityDate = event.currentTarget.value;

        var today = new Date();
        var date = today.getFullYear()+'-'+(today.getMonth())+'-'+today.getDate();        
        if(this.opportunityDate < date){
            this.errorMessage = 'Data de fechamento não pode ser menor que a data atual.';
        }
    }

    get getIsEnabledSave(){
        return this.opportunityName != null && this.opportunityDate != null && this.errorMessage == null;
    }

    openModal(){
        this.isShowModal = true;
    }

    get getOpenModal(){
        return this.isShowModal;
    }

    handleCancelConfirmation(){
        this.isShowModal = false;
    }

    get getErrorMessage(){
        return this.errorMessage != null;
    }
}