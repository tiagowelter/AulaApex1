import { LightningElement, api } from 'lwc';

export default class AccountCard extends LightningElement {
    _account;

    @api
    get account(){
        return this._account;
    }
    set account(value){
        let image = 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg';
        this._account = {id: value.Id, nome : value.Name, imagem: image};
    }

    handleAccountSelected(){
        const accountSelected = new CustomEvent("selected", {
            detail: JSON.stringify(this._account),
        })
        this.dispatchEvent(accountSelected);    
    }

}