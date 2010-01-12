/* AS3
	Copyright 2010 Newloop.
*/
package {
	
	import flash.display.Sprite;
	
	import com.newloop.roboteyesdemoapp.TestTextView;
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  10.01.2010
	 */
	public class robotEyesDemoApp extends Sprite {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function robotEyesDemoApp(){
			trace("initialising: robotEyesDemoApp ");
			super();
			init();
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

		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
        
		private function init():void{
			addChild(new TestTextView());
		}

		//--------------------------------------
		//  UNIT TESTS
		//--------------------------------------
		
	}
	
}
