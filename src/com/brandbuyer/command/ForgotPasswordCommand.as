package com.brandbuyer.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.brandbuyer.business.BackEndServiceDeligate;
	import com.brandbuyer.event.ForgotPasswordEvent;
	import com.brandbuyer.model.BuyerModelLocator;
	import com.brandbuyer.views.poups.AlertMsg;
	import com.brandbuyer.views.poups.ServiceErrorPopup;
	
	import flash.events.EventDispatcher;
	
	import mx.logging.Log;
	import mx.managers.CursorManager;
	import mx.managers.PopUpManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.utils.ObjectUtil;
	
	public class ForgotPasswordCommand extends EventDispatcher implements ICommand, IResponder
	{
		[Bindable]
		private var model : BuyerModelLocator = BuyerModelLocator.getInstance();
		//=================================================================================================
		public function execute( event : CairngormEvent ): void
		{
			try
			{
				var forgotPasswordEvent:ForgotPasswordEvent= event as ForgotPasswordEvent;
				var deligate : BackEndServiceDeligate = new BackEndServiceDeligate(this);
				deligate.forgotPassword(forgotPasswordEvent.userName,forgotPasswordEvent.email);
				CursorManager.setBusyCursor();
			}catch(e:Error){trace('--->Error in ForgotPasswordCommand execute() : '+ObjectUtil.toString(e));}	
		}
		//=================================================================================================
		public function result( event : Object ) : void
		{
			CursorManager.removeBusyCursor();		
			try
			{
				var fsErrorMsg:ServiceErrorPopup = new ServiceErrorPopup();
				fsErrorMsg.setErrorMessage(event.result);
				//var alert AlertMsg = new AlertMsg();
				//alert.(event.result,'Response');
			}catch(e:Error){trace('--->Error in ForgotPasswordCommand result() : '+ObjectUtil.toString(e));}	
		}

		//=================================================================================================
		public function fault( event : Object ) : void
		{
			CursorManager.removeBusyCursor();
			var fsErrorMsg:ServiceErrorPopup = new ServiceErrorPopup();
			fsErrorMsg.setErrorMessage("Password could not be restored!");
			try
			{
				var faultEvent : FaultEvent = FaultEvent( event );
				if(event.toString().match("NetConnection")!=null || event.toString().match("Cannot open connection")!=null)
				{
					fsErrorMsg.setErrorDetail("You are not connected to the Internet:Please check your Internet connectivity!");
				}
				else
				{
					fsErrorMsg.setErrorDetail(event.toString());
				}
			}catch(e:Error){fsErrorMsg.setErrorDetail('Unknown exception thrown from backend : '+e);}	
			/*PopUpManager.addPopUp(fsErrorMsg,,true,null);
			PopUpManager.centerPopUp(fsErrorMsg);*/
		}
		//=================================================================================================
	}
}