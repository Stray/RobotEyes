/* AS3
	Copyright 2010 Newloop.
*/
package com.newloop.roboteyes.core {
	
	import flash.display.DisplayObjectContainer;
	import flash.display.DisplayObject;
	import com.newloop.roboteyes.drivers.DisplayObjectDriver;
	import com.newloop.roboteyes.drivers.DisplayObjectDriverList;
	
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  07.01.2010
	 */
	public class RobotEyesMaster extends Object {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		private static var _robotEyesChief:RobotEyesChief = new RobotEyesChief();
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function RobotEyesMaster(){
			super();
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public static function get robotEyesChief():RobotEyesChief
		{
			return _robotEyesChief;
		}
		
		public static function set viewRoot(_viewRoot:DisplayObjectContainer):void
		{
			_robotEyesChief.viewRoot = _viewRoot;
		} 
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
        
		public static function inViewOf(viewClazz:Class, viewRoot:DisplayObjectContainer = null):DisplayObjectDriver{
			return _robotEyesChief.inViewOf(viewClazz, viewRoot);
		}
		
		public static function getA(uiClazz:Class, viewRoot:DisplayObjectContainer = null):DisplayObjectDriverList{
			return _robotEyesChief.getA(uiClazz, viewRoot);
		}
		
		public static function getAny(uiClazz:Class, viewRoot:DisplayObjectContainer = null):DisplayObjectDriver{
			return _robotEyesChief.getAny(uiClazz, viewRoot);
		}
		
		public static function createDriverFor(uiItem:DisplayObject):DisplayObjectDriver{
			return _robotEyesChief.createDriverFor(uiItem);
		}
		
		public static function countChildrenOfType(childClazz:Class, viewRoot:DisplayObjectContainer):uint{
			return _robotEyesChief.countChildrenOfType(childClazz, viewRoot);
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
