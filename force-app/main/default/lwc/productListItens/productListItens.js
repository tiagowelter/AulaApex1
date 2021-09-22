import { LightningElement, wire, track } from 'lwc';
import { CurrentPageReference} from 'lightning/navigation';
import { fireEvent, registerListener } from 'c/pubsub';
import getProducts from '@salesforce/apex/ProductController.getProducts';

export default class ProductListItens extends LightningElement {

    @wire(CurrentPageReference) pageRef;

    @track accountId = null;

    @wire(getProducts, {}) produtosObj;
    //@track produtos = [];

    connectedCallback(){
        
        /*getProducts({}).then( (response) => {
            console.log('response',response.produtos);
            this.produtos = response.produtos;
        }).catch( (erro) => {
            console.log('erro',erro);
        });*/
        
        console.log('produtos', this.produtosObj);
        registerListener('selectedAccount', this.getAccount, this);
    }    

    getAccount(account){
        this.accountId = account;
    }

    get getAccountId(){
        return this.accountId;
    }

}