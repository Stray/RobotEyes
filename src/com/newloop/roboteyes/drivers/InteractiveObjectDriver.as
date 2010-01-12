/* AS3
	Copyright 2010 Newloop.
*/
package com.newloop.roboteyes.drivers {
	
	import flash.display.InteractiveObject;
	
	import flash.events.MouseEvent;
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  07.01.2010
	 */
	public class InteractiveObjectDriver extends DisplayObjectDriver {
		
		private var _item:InteractiveObject;
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function InteractiveObjectDriver(uiItem:InteractiveObject){
			super(uiItem);
			_item = uiItem;
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public function get item():InteractiveObject{
			return _item;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
        
		public function click():void{
			_item.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
		
		public function mouseOver():void{
			_item.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
		}
		
		public function mouseOut():void{
			_item.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OUT));
		}
		
		public function mouseDown():void{
			_item.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
		}
		
		public function mouseUp():void{
			_item.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
		}
		
		public function rollOver():void{
			_item.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OVER));
		}
		
		public function rollOut():void{
			_item.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OUT));
		}

		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------

		//--------------------------------------
		//  UNIT TESTS
		//--------------------------------------
		
	}
	
}
