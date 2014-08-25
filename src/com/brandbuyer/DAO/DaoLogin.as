package com.brandbuyer.DAO
{
	import com.brandbuyer.model.LoginData;
	import com.brandbuyer.util.Utils;
	import com.brandbuyer.views.LoginView;
	import com.brandbuyer.views.MainMenuView;
	
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;

	public class DaoLogin
	{
		private var loginData:LoginData;
		/*************************************************************************************************/
		private var m_oAppStorageDir:File = File.documentsDirectory.resolvePath("myFolder/structure");//my documents or sdcard
		private var dbConn:SQLConnection;
		private	var dataFile:File  = new File();
		private var userName:String = "";
		public function getLoginDataFromDB(username:String):void{
			this.userName = username;
			dataFile.nativePath = "E:/Projects/flex/BrandBuyer/BrandBuyer/src/assets/buyerbrands.s3db";
			dbConn = new SQLConnection();
			dbConn.addEventListener(SQLEvent.OPEN, DBOpened);
			dbConn.open(dataFile,FileMode.READ);
		}
		private function DBOpened(event:SQLEvent):void{
			if (event.type == "open"){
				var stmt1:SQLStatement = new SQLStatement();
				stmt1.text = "SELECT * FROM Users";
				stmt1.sqlConnection = dbConn;
				stmt1.addEventListener(SQLEvent.RESULT, openHandler);
				stmt1.addEventListener(SQLErrorEvent.ERROR, errorHandler);
				stmt1.execute();
				
				var result:SQLResult = stmt1.getResult();
				if (result != null)
				{
					loginData = new LoginData();
					loginData =  Utils.parseLoginData(result);
					if(loginData.userName ==  Utils.loginUserName ){
						
						Utils.navigator.pushView(MainMenuView);
					}else {
						trace("Please give correct username !");
					}
				}
			}
		}
		private	function openHandler(event:SQLEvent):void{
		}
		private	function errorHandler(event:SQLErrorEvent):void{
		}
	}
}