package com.fashionapp.DAO
{
	import com.fashionapp.Parser.Parser;
	import com.fashionapp.model.ChatData;
	import com.fashionapp.util.Utils;
	import com.fashionapp.utils.DBUtils;
	
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;

	public class DaoChat
	{
		public function DaoChat()
		{
		}
		
		private var dbConn:SQLConnection;
		private	var dataFile:File  = new File();
		
		public function getContactsFromDB():void{
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
					Parser.parseContactList(result);
				}
			}
		}
		private var chat:ChatData;
		public function sendChat(chat:ChatData):void{
			this.chat = chat;
			dataFile.nativePath = Utils.db_path;
			dbConn = new SQLConnection();
			dbConn.addEventListener(SQLEvent.OPEN, DBOpenedForSend);
			dbConn.open(dataFile);
		}
		
		private function DBOpenedForSend(event:SQLEvent):void{
			if (event.type == "open"){
				var stmt1:SQLStatement = new SQLStatement();
				var uniqueId:int = DBUtils.getUniqueID();
				stmt1.text = "INSERT INTO Chat(id,toUserID,type, content,statusID,createBy,createDate,lastUpdate) VALUES("+uniqueId+","+chat.toUserId+",'"+chat.type+"','"+chat.content+"',"+chat.statusId+","+chat.createdBy+","+chat.createDate+","+chat.createDate+")";
				stmt1.sqlConnection = dbConn;
				stmt1.addEventListener(SQLEvent.RESULT, openHandler);
				stmt1.addEventListener(SQLErrorEvent.ERROR, errorHandler);
				stmt1.execute();
				
				var result:SQLResult = stmt1.getResult();
				if (result != null){
					trace(result);
				}
			}
		}
		private	function openHandler(event:SQLEvent):void{
		}
		private	function errorHandler(event:SQLErrorEvent):void{
		}
	}
}