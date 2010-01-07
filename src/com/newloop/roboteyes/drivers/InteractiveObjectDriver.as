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
			trace("initialising: InteractiveObjectDriver ");
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
