/* AS3
	Copyright 2010 Newloop.
*/
package  com.newloop.roboteyesdemoapp {

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import flash.geom.ColorTransform;
	
	import skins.roboteyesDemoAppSkin;
	
	/**
	 *	Sprite sub class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  2010-01-10
	 */
	public class TestTextView extends Sprite {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function TestTextView(){
			super();
			init();
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var entry_txt:TextField;
		
		private var store_txt:TextField;
		
		private var copy_btn:Sprite;
		
		private var clear_btn:Sprite;
		
		private var swapBGColour_btn:Sprite;
		
		private var backgroundSprite:Sprite;
		
		private var colour1:uint = 0x006699;
		private var colour2:uint = 0x993333;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		private function copyClickHandler(evt:MouseEvent):void
		{   
			// don't copy if it's blank
			if(entry_txt.text == ""){
				return;
			}
			
			//
			store_txt.appendText(entry_txt.text + "\n");
			entry_txt.text = "";
		}
		
		private function clearClickHandler(evt:MouseEvent):void
		{
			store_txt.text = "";
		}
		
		private function swapColourClickHandler(evt:MouseEvent):void
		{
			var newColour:uint = colour1;
			if(backgroundSprite.transform.colorTransform.color == colour1){
				newColour = colour2;
			}
			
			var newTransform:ColorTransform = new ColorTransform();
			newTransform.color = newColour;
			backgroundSprite.transform.colorTransform = newTransform;
		}
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------

		/**
		 *	Initialises this object instance.
		 */
		private function init() : void
		{			
			var viewSprite:Sprite = new roboteyesDemoAppSkin.TextTestViewSkin();
			addChild(viewSprite);
			
			entry_txt = viewSprite['field1_txt'];
			store_txt = viewSprite['field2_txt'];
			copy_btn = viewSprite['copy_btn'];
			clear_btn = viewSprite['clear_btn'];
			swapBGColour_btn = viewSprite['swapColour_btn'];
			backgroundSprite = viewSprite['background_mc'];
			
			entry_txt.text ="";
			store_txt.text ="";
			
			setupButtons();
			swapColourClickHandler(null);
		}
		
		private function setupButtons():void
		{
			copy_btn.buttonMode = true;
			clear_btn.buttonMode = true;
			swapBGColour_btn.buttonMode = true;
			
			copy_btn.addEventListener(MouseEvent.CLICK, copyClickHandler);
			clear_btn.addEventListener(MouseEvent.CLICK, clearClickHandler);
			swapBGColour_btn.addEventListener(MouseEvent.CLICK, swapColourClickHandler);
		}
		
		
	}
	
}
