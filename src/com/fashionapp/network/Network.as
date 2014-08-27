package com.fashionapp.network
{
	import air.net.URLMonitor;
	
	import com.fashionapp.views.LoginView;
	import com.fashionapp.views.poups.Alert;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.StatusEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import mx.managers.CursorManager;
	
	public class Network
	{
		private static var objParent:DisplayObject;
		
		// Internet related.
		private static var monitor			:URLMonitor; 
		[Bindable]  
		private static var isOnline        : Boolean = false;
		
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
			Alert.show(objParent,event.target.data);
			CursorManager.removeBusyCursor();
		}
		/*******************************************************************/ 
		private static function SECURITY_ERRORHanlder(event:Event):void{
			Alert.show(objParent,event.target.data);
			CursorManager.removeBusyCursor();
		}
		/*******************************************************************/ 
		private static function uploadDesignedImgComplete(event:Event):void{
			Alert.show(objParent,event.target.data);
			/*if(event.target.data == 'Image upload sucessfull'){
				navigateToURL(new URLRequest('http://smarttees.biz/printing?get_cart_url=1'), "_self");
			}*/
			CursorManager.removeBusyCursor();
		}
		
		
		/*************************  Check internet  ******************************************/
		public static function checkInterNetAvailability(url:String='http://www.google.com'):Boolean { 
			monitor = new URLMonitor( 
				new URLRequest(url)); 
			monitor.addEventListener(StatusEvent.STATUS,announceStatus); 
			monitor.start(); 
			return isOnline;
		} 
		private static function announceStatus(e:StatusEvent):void { 
			trace("Status change. Current status: " + monitor.available); 
			if(monitor.available) { 
				isOnline = true; 
			} else { 
				isOnline = false; 
			} 
		}
		/*******************************************************************/
	}
}