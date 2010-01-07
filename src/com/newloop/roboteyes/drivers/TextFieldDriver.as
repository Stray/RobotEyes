package com.newloop.roboteyes.drivers {
	
	import flash.text.TextField;
	
	public class TextFieldDriver extends DisplayObjectDriver {
		
		private var _textField:TextField;
		
		public function TextFieldDriver(tf:TextField) {
			_textField = tf;
			super(_textField);
		}
		
		public function get textField():TextField{
			return _textField;
		}
		
		public function enterText(newText:String):void{
			_textField.text = newText;
		}
		
		public function checkText(newText:String):Boolean{
			return _textField.text == newText;
		}
		
	}
}
