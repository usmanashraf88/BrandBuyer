package com.tshirtdesigner.events
{
	/* @author M.USMAN ASHRAF
	* Date 15-01-2013.
	*/
	import flash.events.Event;
	
	public class LoginButtonClickEvent extends  Event
	{
		public var txtUserName:String;
		public var txtPassword:String;
		
		public function LoginButtonClickEvent(type:String,username:String,password:String):void{
			super(type,true);
			this.txtUserName = username;
			this.txtPassword= password;
		}
		override public function clone():Event
		{
			return new LoginButtonClickEvent(type,txtUserName,txtPassword);
		}
	}
}