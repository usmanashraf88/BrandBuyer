package com.brandbuyer.network
{
	import air.net.URLMonitor;
	
	import flash.events.StatusEvent;
	import flash.net.URLRequest;

	public class CheckInternetAvailability
	{
		private static var monitor			:URLMonitor; 
		[Bindable]  
		private static var isOnline        : Boolean = false;
		
		 
		public static function monitorConnection(url:String='http://www.google.com'):Boolean { 
			monitor = new URLMonitor( 
				new URLRequest(url)); 
			monitor.addEventListener(StatusEvent.STATUS,announceStatus); 
			monitor.start(); 
			return isOnline;
		} 
		
		/* 
		Declare the status from the monitorConnection function 
		and set the value to the variable isOnline 
		*/ 
		private static function announceStatus(e:StatusEvent):void { 
			trace("Status change. Current status: " + monitor.available); 
			if(monitor.available) { 
				isOnline = true; 
				/* 
				Inside here, you can run any functions or script 
				that require network connection, as it exists. 
				*/ 
			} else { 
				isOnline = false; 
			} 
		}
	}
}