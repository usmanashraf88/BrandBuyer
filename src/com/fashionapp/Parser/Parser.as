package com.fashionapp.Parser
{
	import com.fashionapp.model.BuyerAppModelLocator;
	import com.fashionapp.model.LoginData;
	
	import flash.data.SQLResult;
	import flash.events.Event;
	
	import mx.core.FlexGlobals;

	public class Parser
	{
		/**
		* Parse login data
		*/
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
			BuyerAppModelLocator.getInstance().loginData = ld;
			return ld;
		}
		
		
		public static function parseContactList(results:SQLResult):void{
			var arrLoginData:Array =  results.data;
			
			for(var i:int=0;i < arrLoginData.length; i++){
				var ld:LoginData = new LoginData();
				ld.id = arrLoginData[i].id;
				ld.code = arrLoginData[i].code;
				ld.userName = arrLoginData[i].username;
				ld.fullName = arrLoginData[i].fullname;
				ld.email = arrLoginData[i].email;
				ld.tel = arrLoginData[i].tel;
				ld.status = arrLoginData[i].statusID;
				if(ld.id != BuyerAppModelLocator.getInstance().loginData.id){
					BuyerAppModelLocator.getInstance().users.addItem(ld)
				}
			}
			FlexGlobals.topLevelApplication.dispatchEvent(new Event('ContactListRecieved',true));
		}
	}
}