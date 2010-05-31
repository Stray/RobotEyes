/* AS3
	Copyright 2010 Newloop.
*/
package com.newloop.roboteyes.drivers {
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import com.newloop.roboteyes.core.RobotEyesMaster;
	import com.newloop.roboteyes.errors.RobotEyesError;
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  07.01.2010
	 */
	public class DisplayObjectDriver extends Object {
		
		protected var _view:DisplayObject;
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function DisplayObjectDriver(view:DisplayObject){
			_view = view;
			super();
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public function get view():DisplayObject {
			return _view;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
        
		public function inViewOf(viewClazz:Class):DisplayObjectDriver{
			
			if(_view is DisplayObjectContainer){
				return RobotEyesMaster.inViewOf(viewClazz, _view as DisplayObjectContainer);
				
			}
			
			return null;
		}
		
		public function getA(uiClazz:Class):DisplayObjectDriverList{
			
			if(_view is DisplayObjectContainer){
				return RobotEyesMaster.getA(uiClazz, _view as DisplayObjectContainer);
				
			}
			
			return null;
			
		}
		
		public function getAny(uiClazz:Class):DisplayObjectDriver{
			
			if(_view is DisplayObjectContainer){
				return RobotEyesMaster.getAny(uiClazz, _view as DisplayObjectContainer);
				
			}
			
			return null;
			
		}
		
		public function checkPropertyHasValueOf(propertyName:String, value:*):Boolean{
						
			if(_view.hasOwnProperty(propertyName)){
				if(_view[propertyName] == value) {
					return true;
				}
				return false;
			}
			// you're looking for something that doesn't exist...
			var err:RobotEyesError = new RobotEyesError("RobotEyes couldn't find the property " + propertyName + " on " + _view );
			throw(err);
			
			return false;
		}
		
		public function countChildrenOfType(childClazz:Class):uint{
			
			if(_view is DisplayObjectContainer){
				return RobotEyesMaster.countChildrenOfType(childClazz, _view as DisplayObjectContainer);
				
			}
			
			return 0;
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
