/* AS3
	Copyright 2010 Newloop.
*/
package com.newloop.roboteyesdemoapp {

	import flash.display.Sprite;
	import flash.events.Event;
   	import flash.events.MouseEvent;
    
	import skins.roboteyesDemoAppSkin;
	
	/**
	 *	Sprite sub class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  2010-01-12
	 */
	public class RotatingShapesView extends Sprite {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function RotatingShapesView(){
			super();
			init();
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var squareView:RotatingSquareView;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		private function clickHandler(e:MouseEvent):void{
			if(this.alpha>0.1){
				this.alpha-=0.1;
			} else {
				this.alpha = 1;
			}
			squareView.rotateShapes();
		}
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------

		/**
		 *	Initialises this object instance.
		 */
		private function init() : void
		{			
		   squareView = new RotatingSquareView();
		   addChild(squareView);
		   this.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
	}
	
}
