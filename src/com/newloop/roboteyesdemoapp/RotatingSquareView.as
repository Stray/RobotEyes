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
	public class RotatingSquareView extends Sprite {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function RotatingSquareView(){
			super();
			init();
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var mcSquare:Sprite;
		
		private var mcPentagon:Sprite;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
        
		public function rotateShapes():void{
			rotateSquare();
			rotatePentagon();
		}
		
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------

		/**
		 *	Initialises this object instance.
		 */
		private function init() : void
		{			
			mcSquare = new roboteyesDemoAppSkin.SquareViewSkin();
			mcSquare.alpha = 0.8;
			addChild(mcSquare);
			
			mcPentagon = new roboteyesDemoAppSkin.PentagonViewSkin();
			addChild(mcPentagon);
		}
		
		private function rotateSquare():void{
			mcSquare.rotation += 20;
		}
		
		private function rotatePentagon():void{
			mcPentagon.rotation -= 20;
		}
		
	}
	
}
