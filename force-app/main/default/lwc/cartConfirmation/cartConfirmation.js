import { LightningElement } from 'lwc';
import { NavigationMixin} from 'lightning/navigation';

export default class CartConfirmation extends NavigationMixin(LightningElement) {

    closeModal(){
        const cancelEvent = new CustomEvent( "cancelconfirmation", {
            detail : {},
        });
        this.dispatchEvent(cancelEvent);
    }


}