package com.brandbuyer.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.brandbuyer.model.BuyerModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;

	public class BackEndServiceDeligate
	{
		[Bindable] private var model:BuyerModelLocator=BuyerModelLocator.getInstance();
		
		//▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
		public function forgotPassword(userName:String, email:String):void
		{
			var call:Object="usman";//service.forgotPassword(userName, email); 
			call.addResponder(responder);
		}
		//▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
		private var responder:IResponder;
		private var service:Object;
	}
}