package com.fashionapp.vo
{
	[Bindable]
	[RemoteClass(alias="au.com.coplsaas.totalinsurance.csvgenerator.dto.PayableRequest")]
	public class PayableRequest
	{
		public function PayableRequest()
		{
		}
		private var _requestID:String;
		private var _requestDate:Date;
		
		

		public function get requestDate():Date
		{
			return _requestDate;
		}

		public function set requestDate(value:Date):void
		{
			_requestDate = value;
		}

		public function get requestID():String
		{
			return _requestID;
		}

		public function set requestID(value:String):void
		{
			_requestID = value;
		}

	}
}