package com.fashionapp.event
{
	/* @author M.USMAN ASHRAF
	* Date 15-01-2013.
	*/
	import com.fashionapp.model.LoginData;
	
	import flash.events.Event;
	
	public class LoginClickEvent extends  Event
	{
		public var results:String;
		public function LoginClickEvent(type:String,result:String):void{
			super(type,true);
			this.results =result;
		}
		override public function clone():Event
		{
			return new LoginClickEvent(type,results);
		}
	}
}

