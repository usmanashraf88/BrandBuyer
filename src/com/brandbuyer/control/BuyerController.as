package com.brandbuyer.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.brandbuyer.command.ForgotPasswordCommand;
	import com.brandbuyer.event.ForgotPasswordEvent;
	
	import mx.controls.*;
	import mx.utils.ObjectUtil;

	public class BuyerController extends FrontController
	{
		public function BuyerController()
		{
			initialiseCommands();
		}

		//▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
		public function initialiseCommands():void
		{
			try
			{
				addCommand(ForgotPasswordEvent.EVENT_FORGOT_PASSWORD,ForgotPasswordCommand);
			}catch(e:Error){trace('--->Error in Controller initialiseCommands() : '+ObjectUtil.toString(e));}	
		}
		//▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
	}
}