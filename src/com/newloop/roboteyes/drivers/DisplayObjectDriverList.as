/* AS3
	Copyright 2010 Newloop.
*/
package com.newloop.roboteyes.drivers {
	
	import com.newloop.roboteyes.core.RobotEyesMaster;
	
	import flash.display.DisplayObject;
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  07.01.2010
	 */
	public class DisplayObjectDriverList extends DisplayObjectDriver {
		
		private var _matchingInstancesArray:Array;
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function DisplayObjectDriverList(matchingInstancesArray:Array){
			_matchingInstancesArray = matchingInstancesArray;
			super(_matchingInstancesArray[0]);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
        
		public function named(withName:String):DisplayObjectDriver{
			var iLength:uint = _matchingInstancesArray.length;
			for (var i:uint = 0; i<iLength; i++){
				var nextItem:DisplayObject = _matchingInstancesArray[i];
				if(nextItem.name == withName){
					return RobotEyesMaster.createDriverFor(nextItem);
				}
			}
			
			return null;
		}
		
		public function withProperty(propName:String, propValue:*):DisplayObjectDriver{
			
			var iLength:uint = _matchingInstancesArray.length;
			for (var i:uint = 0; i<iLength; i++){
				var nextItem:DisplayObject = _matchingInstancesArray[i];
				if(nextItem.hasOwnProperty(propName)){
					if(nextItem[propName]==propValue){
						return RobotEyesMaster.createDriverFor(nextItem);
					}
				}
			}
			
			return null;
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
