package com.fashionapp.controllers
{
	import com.fashionapp.DAO.DaoChat;
	import com.fashionapp.model.BuyerAppModelLocator;
	import com.fashionapp.model.ChatData;
	import com.fashionapp.network.Network;
	
	import flash.events.Event;
	
	import mx.core.FlexGlobals;

	public class ChatViewController extends BaseController
	{
		public function ChatViewController()
		{
			super();
		}
		
		public function creationCompleteHandler():void 
		{
			addListeners();
			var dc:DaoChat = new DaoChat();
			if(Network.checkInterNetAvailability() == true){
				trace('internet available');
				/*var urlVariable:URLVariables  = new URLVariables;
				urlVariable.username = (view as LoginView).txt_username.text;
				urlVariable.password = (view as LoginView).txt_password.text;
				urlVariable.type = "buyer";
				Network.call_API(view as LoginView,"http://smarttees.biz/build/products.php",urlVariable,"post");*/
			}else{
				dc.getContactsFromDB();
			}
			
			// for testing
			dc.getContactsFromDB();
		}
		
		private function addListeners():void
		{
			if(FlexGlobals.topLevelApplication.hasEventListener('ContactListRecieved')==false){
				FlexGlobals.topLevelApplication.addEventListener('ContactListRecieved',contactsRecieved,false,0,true);
			}
		}
		
		private function contactsRecieved(event:Event):void{
			BuyerAppModelLocator.getInstance().users.refresh();
		}
		
		public function send(chat:ChatData):void{
			var dc:DaoChat = new DaoChat();
			if(Network.checkInterNetAvailability() == true){
				trace('internet available');
			}else{
				dc.sendChat(chat);
			}
			
			// for testing
			dc.sendChat(chat);
		}
		
		
	}
}