import { LightningElement, wire, track } from 'lwc';
import { CurrentPageReference} from 'lightning/navigation';
import { fireEvent, registerListener } from 'c/pubsub';
import getProducts from '@salesforce/apex/ProductController.getProducts';

export default class ProductListItens extends LightningElement {

    @wire(CurrentPageReference) pageRef;

    @track accountId = null;
    @track filter = null;
    @track pageNumber = 1;
    @track totalItemCount = 0;
    @track pageSize;

    @wire(getProducts, {filter : '$filter', pageNumber : '$pageNumber'}) produtosObj;
    //@track produtos = [];

    connectedCallback(){
        
        /*getProducts({}).then( (response) => {
            console.log('response',response.produtos);
            this.produtos = response.produtos;
        }).catch( (erro) => {
            console.log('erro',erro);
        });*/
        
        console.log('produtos', this.produtosObj);
        registerListener('filterChangeSearch', this.getChangedValue, this);
        registerListener('selectedAccount', this.getAccount, this);
    }    

    getAccount(account){
        console.log('esta buscando o account aqio list itens');
        this.accountId = account;
    }

    get getAccountId(){
        return this.accountId;
    }

    getChangedValue(param){
        this.filter = param;
        console.log('VALOR DA BUSCA', param);
        this.pageNumber = 1;
    }

    handleProductSelected(event){
        console.log('capturou o evento pelo componente pai');
        fireEvent(this.pageRef, 'productSelected', event.detail);
    }

    handlePreviousPage(){
        this.pageNumber = this.pageNumber - 1;
    }

    handleNextPage(){
        this.pageNumber = this.pageNumber + 1;
    }

}