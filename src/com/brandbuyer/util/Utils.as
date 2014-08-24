package com.brandbuyer.util
{
	import com.brandbuyer.model.LoginData;

	public class Utils
	{
		public static var SUCCESS:String = "success";
		public static var FORGOT_EMAIL:String;
		/**
		* Get login data
		*/ 
		public static function getLoginData():LoginData{
			var loginData:LoginData  = new LoginData();
			return loginData;
		}
	}
}