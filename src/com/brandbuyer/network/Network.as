package com.brandbuyer.network
{
	import com.brandbuyer.views.LoginView;
	import com.brandbuyer.views.poups.InformationBox;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import mx.managers.CursorManager;

	public class Network
	{
		private static var objParent:DisplayObject;
		public static function call_API(parentObj:DisplayObject,url:String,
										variables:URLVariables,method:String = "post"):void{
			objParent  = parentObj;
			CursorManager.setBusyCursor();
			var myVariables:URLVariables = new URLVariables();
			myVariables = variables;
			var myURLRequest:URLRequest = new URLRequest();
			var myURLLoader:URLLoader = new URLLoader(); 
			if(method == "get".toLocaleLowerCase()){
				myURLRequest.method = URLRequestMethod.GET;
			}else if(method == "post".toLocaleLowerCase()){
				myURLRequest.method = URLRequestMethod.POST;
			} 
			myURLRequest.url = url;
			if(variables != null){
				myURLRequest.data = variables;
			}
			myURLLoader.load(myURLRequest);
			myURLLoader.addEventListener(IOErrorEvent.IO_ERROR,IOErrorHanlder);
			myURLLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,SECURITY_ERRORHanlder);
			myURLLoader.addEventListener(Event.COMPLETE, uploadDesignedImgComplete);
		}
		/*******************************************************************/
		private static function IOErrorHanlder(event:Event):void{
			InformationBox.show(objParent,"IOError ",event.target.data);
			CursorManager.removeBusyCursor();
		}
		/*******************************************************************/ 
		private static function SECURITY_ERRORHanlder(event:Event):void{
			InformationBox.show(objParent,"SECURITY_ERROR ",event.target.data);
			CursorManager.removeBusyCursor();
		}
		/*******************************************************************/ 
		private static function uploadDesignedImgComplete(event:Event):void{
			InformationBox.show(objParent,"Successful ",event.target.data);
			/*if(event.target.data == 'Image upload sucessfull'){
				navigateToURL(new URLRequest('http://smarttees.biz/printing?get_cart_url=1'), "_self");
			}*/
			CursorManager.removeBusyCursor();
		}
		/*******************************************************************/ 					
	}
}