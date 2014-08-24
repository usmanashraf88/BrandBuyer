package com.brandbuyer.views.components
{
	import com.brandbuyer.skins.TopTabButtonSkin;
	
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	import mx.events.FlexEvent;
	import mx.events.StateChangeEvent;
	
	import spark.components.Button;
	import spark.components.Image;
	import spark.components.Label;
	
	public class TopTabButton extends Button
	{
		private var _icon:Class;
		
		[SkinPart(required="true")]
		public var iconImage:Image;
		
		public function TopTabButton()
		{
			super();
			this.setStyle("skinClass",TopTabButtonSkin);
			this.addEventListener(FlexEvent.CREATION_COMPLETE,function(event:FlexEvent):void {
				iconImage.source = _icon;
			});
		}
		
		public function set icon(cls:Class):void {
			_icon = cls;
		}
	}
}