package com.fashionapp.model
{
	import com.adobe.cairngorm.CairngormError;
	import com.adobe.cairngorm.CairngormMessageCodes;
	import com.adobe.cairngorm.model.IModelLocator;
	import com.fashionapp.vo.LoginVO;
	
	import mx.collections.ArrayCollection;
	
	public class BuyerAppModelLocator implements IModelLocator
	{
		private static var _instance : BuyerAppModelLocator;
		
		public static function getInstance() : BuyerAppModelLocator
		{
			if ( _instance == null )
			{
				_instance = new BuyerAppModelLocator();
			}
			return _instance;
		}
		
		[Bindable]
		public var loginData:LoginData;
		
		[Bindable]
		public var users:ArrayCollection = new ArrayCollection();
		
		public function FlexcasterModelLocator()
		{
			if ( _instance != null )
			{
				throw new CairngormError(
					CairngormMessageCodes.SINGLETON_EXCEPTION, "BuyerAppModelLocator" );
			}
			_instance = this;
		}
	}
}