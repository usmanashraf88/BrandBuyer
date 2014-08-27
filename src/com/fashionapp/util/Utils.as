package com.fashionapp.util
{
	import com.fashionapp.model.LoginData;
	
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.display.DisplayObject;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	
	import mx.utils.ObjectUtil;
	
	import spark.components.ViewNavigator;

	public class Utils
	{
		public static var SUCCESS:String = "success";
		public static var FORGOT_EMAIL:String;
		public static var loginUserName:String= "";
		public static var navigator:ViewNavigator = new ViewNavigator();
		public static function parseLoginData(results:SQLResult):LoginData{
			var ld:LoginData = new LoginData();
			var arrLoginData:Array =  results.data;
			
			ld.id = arrLoginData[0].groupID;
			ld.code = arrLoginData[0].code;
			ld.userName = arrLoginData[0].username;
			ld.fullName = arrLoginData[0].fullname;
			ld.email = arrLoginData[0].email;
			ld.tel = arrLoginData[0].tel;
			ld.status = arrLoginData[0].statusID;
			
			for(var i:int=0;i < arrLoginData.length; i++){
			}
			return ld;
		}
	}
}