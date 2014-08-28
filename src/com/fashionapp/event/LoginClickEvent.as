package com.tshirtdesigner.events
{
	/* @author M.USMAN ASHRAF
	* Date 15-01-2013.
	*/
	import flash.events.Event;
	
	public class LoginClickEvent extends  Event
	{
		public var successfulyLoggedIn:Boolean;
		public function LoginClickEvent(type:String,loggedIn:Boolean):void{
			super(type,true);
			this.successfulyLoggedIn =loggedIn;
		}
		override public function clone():Event
		{
			return new LoginClickEvent(type,successfulyLoggedIn);
		}
	}
}

