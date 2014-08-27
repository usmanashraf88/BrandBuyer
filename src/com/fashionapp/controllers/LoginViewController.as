package com.fashionapp.controllers
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.fashionapp.DAO.DaoLogin;
	import com.fashionapp.events.LoginClickEvent;
	import com.fashionapp.events.LoginEvent;
	import com.fashionapp.model.LoginData;
	import com.fashionapp.network.Network;
	import com.fashionapp.util.Utils;
	import com.fashionapp.views.HomeView;
	import com.fashionapp.views.LoginView;
	import com.fashionapp.views.MainMenuView;
	import com.fashionapp.views.poups.Alert;
	import com.fashionapp.vo.LoginVO;
	
	import flash.events.MouseEvent;
	import flash.net.URLVariables;
	
	import mx.core.FlexGlobals;
	import mx.events.ValidationResultEvent;
	import mx.validators.Validator;

	public class LoginViewController extends BaseController
	{
		public var usernameValidator:Validator;
		public var passwordValidator:Validator;
		
		public function LoginViewController()
		{
			super();
		}
		
		public function creationCompleteHandler():void 
		{
			usernameValidator = new Validator();
			passwordValidator = new Validator();
			
			usernameValidator.source =  (view as LoginView).txt_username;
			passwordValidator.source =  (view as LoginView).txt_password;
			
			usernameValidator.property = "text";
			passwordValidator.property = "text";
			
			usernameValidator.required = true;
			passwordValidator.required = true;
			
			addListeners();
		}
		
		private function addListeners():void
		{
			if(FlexGlobals.topLevelApplication.hasEventListener('LoginClickEvent')==false){
				FlexGlobals.topLevelApplication.addEventListener('LoginClickEvent',loginClickEventListener,false,0,true);
			}
		}
		
		private function loginClickEventListener(event:LoginClickEvent):void
		{
			var ld:LoginData = new LoginData();
			ld = event.loginDataObject;
			if(ld.userName == (view as LoginView).txt_username.text){
				(view as LoginView).navigator.pushView(MainMenuView);
			}else{
				Alert.show(view as LoginView,"Please give correct username !");
			}
		}
		
		public function doLogin(username:String,password:String):void 
		{
			//Temp open due to missing db file other wise comment
			if(usernameValidator.validate().type == ValidationResultEvent.VALID && passwordValidator.validate().type == ValidationResultEvent.VALID) 
			{
				var loginVo:LoginVO = new LoginVO(username,password);
				var loginEvent:LoginEvent = new LoginEvent(LoginEvent.LOGIN,loginVo,"");
				CairngormEventDispatcher.getInstance().dispatchEvent(loginEvent);
				
				(view as LoginView).navigator.pushView(HomeView);
			}
			
			// Code commented due to missing local db file//
			/*var dl:DaoLogin = new DaoLogin();
			if(Network.checkInterNetAvailability() == true){
				var urlVariable:URLVariables  = new URLVariables;
				urlVariable.username = (view as LoginView).txt_username.text;
				urlVariable.password = (view as LoginView).txt_password.text;
				urlVariable.type = "buyer";
				Network.call_API(view as LoginView,"http://smarttees.biz/build/products.php",urlVariable,"post");
			}else{
				dl.getLoginDataFromDB((view as LoginView).txt_username.text);
			}*/
		}
		
		//Usman I have commented this as this function is not used
		
		/*protected function label1_clickHandler(event:MouseEvent):void
		{
			if((view as LoginView).txt_username.text == ""){
				Alert.show(this,"Please enter your email.");
			}else{
				var urlVariable:URLVariables  = new URLVariables;
				urlVariable.email = Utils.FORGOT_EMAIL;
				//Network.call_API(this,"http://smarttees.biz/build/products.php",urlVariable,"post");
			}
		}*/
	}
}