package com.fashionapp.DAO
{
	import com.fashionapp.Parser.Parser;
	import com.fashionapp.event.LoginClickEvent;
	import com.fashionapp.model.LoginData;
	import com.fashionapp.util.Utils;
	import com.fashionapp.views.poups.Alert;
	
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.display.DisplayObject;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	
	import mx.core.FlexGlobals;

	public class DaoLogin
	{
		private var loginData:LoginData;
		/*************************************************************************************************/
		private var dbConn:SQLConnection;
		private	var dataFile:File  = new File();
		
		public function getLoginDataFromDB(username:String):void{
			
			/*use below commented lines For Mobile storage. 
			define where to find the database file
			var appStorage:File = File.applicationStorageDirectory;
			var dbFile:File = appStorage.resolvePath("ExampleDatabase.db");*/
			
			dataFile.nativePath = Utils.db_path;
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
				if (result != null){
					FlexGlobals.topLevelApplication.dispatchEvent(new LoginClickEvent('LoginClickEvent',Parser.parseLoginData(result)));
				}
			}
		}
		private	function openHandler(event:SQLEvent):void{
		}
		private	function errorHandler(event:SQLErrorEvent):void{
		}
	}
}