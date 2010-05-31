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
	import com.newloop.roboteyes.errors.RobotEyesError;
	
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
			return findInstancesOf(uiClazz, useViewRoot);
		}
		
		public function getAny(uiClazz:Class, useViewRoot:DisplayObjectContainer = null):DisplayObjectDriver{
			return findAnyInstanceOf(uiClazz, useViewRoot);
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
		
		public function countChildrenOfType(childClazz:Class, useViewRoot:DisplayObjectContainer):uint {
			return countChildInstancesOf(childClazz, useViewRoot);
		}                                                 

		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
        
		private function findInstancesOf(uiClazz:Class, useViewRoot:DisplayObjectContainer = null):DisplayObjectDriverList{
			if(useViewRoot == null){
				useViewRoot = _viewRoot;
			}
			
		   	var matchingInstancesArray:Array = [];
			
			var iLength:uint = useViewRoot.numChildren;
			for (var i:uint = 0; i<iLength; i++){
				var nextChild:DisplayObject = useViewRoot.getChildAt(i) as DisplayObject;
				
				if(nextChild is uiClazz){
					matchingInstancesArray.push(nextChild);
				}
			}
			
			if(matchingInstancesArray.length>0){
				return new DisplayObjectDriverList(matchingInstancesArray);
			}
			
			for(i=0; i<iLength; i++){
				nextChild = useViewRoot.getChildAt(i) as DisplayObject;
				
				if(nextChild is DisplayObjectContainer){
					try {
						var grandChildResult:DisplayObjectDriverList = findInstancesOf(uiClazz, nextChild as DisplayObjectContainer);
						if(grandChildResult != null)
						{
							return grandChildResult;
						}
					} catch(e:RobotEyesError) {
						//
					}
					
				}
			}
			
			var e:RobotEyesError = new RobotEyesError("RobotEyes couldn't find a " + uiClazz + " inside " + useViewRoot.toString());
			throw(e);
			
			return null;
		}
		
		private function findAnyInstanceOf(uiClazz:Class, useViewRoot:DisplayObjectContainer = null):DisplayObjectDriver{
			if(useViewRoot == null){
				useViewRoot = _viewRoot;
			}
			
			var iLength:uint = useViewRoot.numChildren;
			for (var i:uint = 0; i<iLength; i++){
				var nextChild:DisplayObject = useViewRoot.getChildAt(i) as DisplayObject;
				
				if(nextChild is uiClazz){
					return createDriverFor(nextChild);
				}
			}
			
			var e:RobotEyesError = new RobotEyesError("RobotEyes couldn't find a " + uiClazz + " inside " + useViewRoot.toString());
			throw(e);
			
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
			
			var e:RobotEyesError = new RobotEyesError("RobotEyes couldn't find a " + viewClazz + " inside " + useViewRoot.toString());
			throw(e);
			
			return null;
		} 
		
		private function checkForViewClass(viewClazz:Class, viewToWalk:DisplayObjectContainer):DisplayObjectContainer{
			if(viewToWalk is viewClazz){
				return viewToWalk;
			}
			var iLength:uint = viewToWalk.numChildren;
			for (var i:uint = 0; i<iLength; i++){
				var nextChild:DisplayObjectContainer = viewToWalk.getChildAt(i) as DisplayObjectContainer;
				if(nextChild!=null){
					var walkResults:DisplayObjectContainer = checkForViewClass(viewClazz, nextChild);
					if(walkResults!=null){
						return walkResults;
					}
				}
			}
			return null;
		}
		
		private function countChildInstancesOf(childClazz:Class, useViewRoot:DisplayObjectContainer):uint
		{
			var typeCounter:uint = 0;
			
			var iLength:uint = useViewRoot.numChildren;
			for (var i:int = 0; i < iLength; i++)
			{
			    var nextChild:DisplayObject = useViewRoot.getChildAt(i) as DisplayObject;
				if(nextChild is childClazz)
				{
					typeCounter++;
				}
				else if (nextChild is DisplayObjectContainer)
				{
					typeCounter += countChildInstancesOf(childClazz, nextChild as DisplayObjectContainer);
				}
				
			}
			
			return typeCounter;
		}

		//--------------------------------------
		//  UNIT TESTS
		//--------------------------------------
		
	}
	
}
