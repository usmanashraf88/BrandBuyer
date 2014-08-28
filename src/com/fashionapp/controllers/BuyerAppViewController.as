package com.fashionapp.controllers
{
	import com.fashionapp.business.BuyerAppServiceLocator;
	import com.fashionapp.control.BuyerAppController;
	import com.fashionapp.model.BuyerAppModelLocator;
	
	import flash.display.DisplayObject;
	
	public class BuyerAppViewController extends BaseController
	{
		private var _frontController : BuyerAppController;
		[Bindable]
		private var _model : BuyerAppModelLocator;
		
		public function BuyerAppViewController()
		{
			super();
		}
		
		public function creationCompleteHandler() : void
		{
			view;
			new BuyerAppServiceLocator();
			_frontController = new BuyerAppController();
			_model = BuyerAppModelLocator.getInstance();
		}
	}
}