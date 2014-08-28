package com.fashionapp.util
{
	import com.fashionapp.model.LoginData;
	
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.display.DisplayObject;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.text.ReturnKeyLabel;
	import flash.utils.ByteArray;
	
	import mx.utils.Base64Decoder;
	import mx.utils.Base64Encoder;
	import mx.utils.ObjectUtil;
	
	import spark.components.ViewNavigator;

	public class Utils
	{
		public static var FORGOT_EMAIL:String;
		public static var db_path:String = "E:/fashionDB.s3db";
		public static var  key:String = 'dSChAjgz36TTexeLODPYxleJndjVcOMVzsLJjSM8dLpXsTS4FCeMbhw2s2u';
		
		
		public static function encrypt(str:String, key:String):String {
			var myEncoder:Base64Encoder = new Base64Encoder();
			var result:String = '';
			for (var i:int = 0; i < str.length; i++) {
				var char:String = str.substr(i, 1);
				var keychar:String = key.substr((i % key.length) - 1, 1);
				var ordChar:int = char.charCodeAt(0);
				var ordKeychar:int = keychar.charCodeAt(0);
				var sum:int = ordChar + ordKeychar;
				char = String.fromCharCode(sum);
				result = result + char;
			}
			myEncoder.encode(result);
			return result;
		}
		
		public static function decrypt(str:String, key:String):String {
			var myDecoder:Base64Decoder = new Base64Decoder();
			var result:String = '';
			myDecoder.decode(str); 
			for (var i:int = 0; i < str.length; i++) {
				var char:String = str.substr(i, 1);
				var keychar:String = key.substr((i % key.length) - 1, 1);
				var ordChar:int = char.charCodeAt(0);
				var ordKeychar:int = keychar.charCodeAt(0);
				var sum:int = ordChar - ordKeychar;
				char = String.fromCharCode(sum);
				result = result + char;
			}
			return result;
		}
		
		
		public static function encode(data:String):String {
			// Convert string to ByteArray
			var bytes:ByteArray = new ByteArray();
			bytes.writeMultiByte(data, "ISO-8859-1");
			// Return encoded ByteArray
			return encodeByteArray(bytes);
		}
		
		
		public static function encodeByteArray(data:ByteArray):String {
			// Initialise output
			var output:String = "";
			// Create data and output buffers
			var dataBuffer:Array;
			var outputBuffer:Array = new Array(4);
			// Rewind ByteArray
			data.position = 0;
			// while there are still bytes to be processed
			while (data.bytesAvailable > 0) {
				// Create new data buffer and populate next 3 bytes from data
				dataBuffer = new Array();
				for (var i:uint = 0; i < 3 && data.bytesAvailable > 0; i++) {
					dataBuffer[i] = data.readUnsignedByte();
				}
				// Convert to data buffer Base64 character positions and 
				// store in output buffer
				outputBuffer[0] = (dataBuffer[0] & 0xfc) >> 2;
				outputBuffer[1] = ((dataBuffer[0] & 0x03) << 4) | ((dataBuffer[1]) >> 4);
				outputBuffer[2] = ((dataBuffer[1] & 0x0f) << 2) | ((dataBuffer[2]) >> 6);
				outputBuffer[3] = dataBuffer[2] & 0x3f;
				// If data buffer was short (i.e not 3 characters) then set
				// end character indexes in data buffer to index of '=' symbol.
				// This is necessary because Base64 data is always a multiple of
				// 4 bytes and is basses with '=' symbols.
				for (var j:uint = dataBuffer.length; j < 3; j++) {
					outputBuffer[j + 1] = 64;
				}
				// Loop through output buffer and add Base64 characters to 
				// encoded data string for each character.
				for (var k:uint = 0; k < outputBuffer.length; k++) {
					output += BASE64_CHARS.charAt(outputBuffer[k]);
				}
			}
			// Return encoded data
			return output;
		}
		private static const BASE64_CHARS:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
		
		
	}
	
}