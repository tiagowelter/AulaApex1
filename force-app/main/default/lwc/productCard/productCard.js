import { LightningElement, api } from 'lwc';

export default class ProductCard extends LightningElement {

    _product;

    @api
    get product(){
        return this._product;
    }
    set product(value){

        let image = value.DisplayUrl == null ? 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg' : value.DisplayUrl;

        let priceProduct = value.Price__c == null ? 0 : value.Price__c;

        this._product = {id: value.Id, nome : value.Name, imagem: image, preco: priceProduct};

    }

    handleProductSelected(){
        const productSelected = new CustomEvent("selected", {
            detail: JSON.stringify(this._product),
        })
        this.dispatchEvent(productSelected);    
    }

}