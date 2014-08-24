package com.brandbuyer.util
{
	import com.brandbuyer.model.BrandData;
	
	import flash.text.ReturnKeyLabel;
	
	import mx.collections.ArrayCollection;

	public class Test
	{
		public static function getDummyBrandData():ArrayCollection
		{
			var arrBrand:ArrayCollection =new ArrayCollection();
			
			for(var i:int=0; i<=10; i++)
			{
				var obj:BrandData=new BrandData();
				obj.title="Service";
				obj.seasonId=1+i;
				obj.numProducts=2+i;
				obj.deptId=3+i;
				obj.creatDate=new Date();
				obj.lastUpdate=new Date();
			}
			return arrBrand;
		}
	}
}