package com.brandbuyer.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	
	import mx.collections.ArrayCollection;

	[Bindable] public class BuyerModelLocator implements ModelLocator
	{
		private static var modelLocator:BuyerModelLocator;
		//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//		public var loginData:LoginData=new LoginData();
		public var readOnly:Boolean=false;
		public var invalidUserName:String='';
		public var applicationType:String;
		public var selectedClaimSummaryRecord:Object=new Object();
		public var isSavePressForUpdate:Boolean=true;
		public var cmsWBSearcIndicator:Boolean=false;
		public var submittedClaimSummaryArray:ArrayCollection=new ArrayCollection();
		public var claimSummary:ArrayCollection=new ArrayCollection();
		public var claimBPCSummary:ArrayCollection=new ArrayCollection();
		public var claimSearchSummary:ArrayCollection=new ArrayCollection();
		public var myFilesSummary:ArrayCollection=new ArrayCollection();
		public var updateSubmitInd:String=null;
		public var updatedClaimOfficerID:Number=0;
		public var selectedComponentName:String='claim';
		//=======================================================================================
//		public var version:String=ApplicationVersion.VERSION;// ==== VERSION NUMBER ====
		//=======================================================================================
		public static function getInstance():BuyerModelLocator
		{
			if (modelLocator == null)
			{
				modelLocator=new BuyerModelLocator();
			}
			return modelLocator;
		}
		//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
		public function BuyerModelLocator()
		{
			if (modelLocator != null)
			{
				throw new Error("Only one  BuyerModelLocator instance should be instantiated");
			}
		}
		//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	}
}
