package com.fashionapp.Parser
{
	import com.fashionapp.model.LoginData;
	
	import flash.data.SQLResult;

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
			
			for(var i:int=0;i < arrLoginData.length; i++){
			}
			return ld;
		}
	}
}