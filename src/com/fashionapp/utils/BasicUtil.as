package com.fashionapp.utils
{
	import mx.core.FlexGlobals;

	[Bindable]
	public class BasicUtil
	{
		public function BasicUtil()
		{
		}
		
		public static function getFontSize(fontSize:int):int {
			var screenWidth:int = FlexGlobals.topLevelApplication.width;
			var factor:Number = screenWidth/640;
			fontSize = factor*fontSize;
			return fontSize;
		}
		
		public static function getComponentHeight(height:int):int {
			var screenWidth:int = FlexGlobals.topLevelApplication.width;
			var factor:Number = screenWidth/640;
			height = factor*height;
			return height;
		}
		
		public static function getComponentPadding(padding:int):int {
			var screenWidth:int = FlexGlobals.topLevelApplication.width;
			var factor:Number = screenWidth/640;
			padding = factor*padding;
			return padding;
		}
	}
}