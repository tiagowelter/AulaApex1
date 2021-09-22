import { LightningElement, api } from 'lwc';

export default class ProductCard extends LightningElement {

    _product;

    @api
    get product(){
        return this._product;
    }
    set product(value){

        this._product = {id: value.Id, nome : value.Name};

    }

}