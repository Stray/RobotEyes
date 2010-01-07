package com.newloop.roboteyes.drivers {
	
	import flash.text.TextField;
	import flash.events.TextEvent;
	import flash.events.Event;
	
	public class TextFieldDriver extends InteractiveObjectDriver {
		
		private var _textField:TextField;
		
		public function TextFieldDriver(tf:TextField) {
			_textField = tf;
			super(_textField);
		}
		
		public function get textField():TextField{
			return _textField;
		}
		
		public function enterText(newText:String):void{
			_textField.dispatchEvent(new TextEvent(TextEvent.TEXT_INPUT));
			_textField.text = newText;
			_textField.dispatchEvent(new Event(Event.CHANGE))
		}
		
		public function checkText(newText:String):Boolean{
			return _textField.text == newText;
		}
		
	}
}
