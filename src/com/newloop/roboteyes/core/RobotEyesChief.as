/* AS3
	Copyright 2010 Newloop.
*/
package com.newloop.roboteyes.core {
	
	import flash.display.DisplayObjectContainer;
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import com.newloop.roboteyes.drivers.DisplayObjectDriver;
	import com.newloop.roboteyes.drivers.DisplayObjectDriverList;
	import com.newloop.roboteyes.drivers.TextFieldDriver;
	import com.newloop.roboteyes.drivers.InteractiveObjectDriver;
	
	import flash.text.TextField;
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  07.01.2010
	 */
	public class RobotEyesChief extends Object {
		
		private var _viewRoot:DisplayObjectContainer;
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function RobotEyesChief(){
			trace("initialising: RobotEyesChief ");
			super();
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public function set viewRoot(view:DisplayObjectContainer):void{
			_viewRoot = view;
		}
		                    
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
        
		public function inViewOf(viewClazz:Class, useViewRoot:DisplayObjectContainer = null):DisplayObjectDriver{
			return findContextView(viewClazz, useViewRoot);
		}
		
		public function getA(uiClazz:Class, useViewRoot:DisplayObjectContainer = null):DisplayObjectDriverList{
		    trace("getA");
			return findInstancesOf(uiClazz, useViewRoot);
		}
		
		public function createDriverFor(uiItem:DisplayObject):DisplayObjectDriver{
			if(uiItem is TextField){
				return new TextFieldDriver(uiItem as TextField);
			}
			
			if(uiItem is InteractiveObject){
				return new InteractiveObjectDriver(uiItem as InteractiveObject);
			}
			return new DisplayObjectDriver(uiItem);
		}                                                 

		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
        
		private function findInstancesOf(uiClazz:Class, useViewRoot:DisplayObjectContainer = null):DisplayObjectDriverList{
			trace("findInstancesOf " + uiClazz);
			if(useViewRoot == null){
				useViewRoot = _viewRoot;
			}
			
		   	var matchingInstancesArray:Array = [];
			
			var iLength:uint = useViewRoot.numChildren;
			for (var i:uint = 0; i<iLength; i++){
				var nextChild:DisplayObject = useViewRoot.getChildAt(i) as DisplayObject;
				trace("nextChild = " + nextChild);
				
				if(nextChild is uiClazz){
					trace("found matching instance of " + uiClazz);
					matchingInstancesArray.push(nextChild);
				}
			}
			
			if(matchingInstancesArray.length>0){
				return new DisplayObjectDriverList(matchingInstancesArray);
			}
			
			return null;
		}

		private function findContextView(viewClazz:Class, useViewRoot:DisplayObjectContainer = null):DisplayObjectDriver{
			if(useViewRoot == null){
				useViewRoot = _viewRoot;
			}
			var foundView:DisplayObjectContainer = checkForViewClass(viewClazz, useViewRoot);
			if(foundView){
				return new DisplayObjectDriver(foundView);
			}
			return null;
		} 
		
		private function checkForViewClass(viewClazz:Class, viewToWalk:DisplayObjectContainer):DisplayObjectContainer{
			trace("checkForViewClass");
			if(viewToWalk is viewClazz){
				trace("found required view class");
				return viewToWalk;
			}
			trace("viewToWalk: " + viewToWalk);
			trace('viewToWalk.numChildren: ' + viewToWalk.numChildren);
			
			
			var iLength:uint = viewToWalk.numChildren;
			for (var i:uint = 0; i<iLength; i++){
				var nextChild:DisplayObjectContainer = viewToWalk.getChildAt(i) as DisplayObjectContainer;
				trace("nextChild = " + nextChild);
				if(nextChild!=null){
					var walkResults:DisplayObjectContainer = checkForViewClass(viewClazz, nextChild);
					if(walkResults!=null){
						return walkResults;
					}
				}
			}
			return null;
		}

		//--------------------------------------
		//  UNIT TESTS
		//--------------------------------------
		
	}
	
}
