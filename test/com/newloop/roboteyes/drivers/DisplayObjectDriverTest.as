package com.newloop.roboteyes.drivers {

	import asunit.framework.TestCase;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import com.newloop.roboteyes.errors.RobotEyesError;

	public class DisplayObjectDriverTest extends TestCase {
		private var instance:DisplayObjectDriver;
		
		private var testObject:DisplayObject;

		public function DisplayObjectDriverTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			testObject = new Sprite();
			instance = new DisplayObjectDriver(testObject);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DisplayObjectDriver", instance is DisplayObjectDriver);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testCheckPropertyHasValueOfThrowsError():void {
			assertThrows(RobotEyesError, function():void{
				instance.checkPropertyHasValueOf("text", "hi");
			})
		}
		
		public function testCheckPropertyHasValueOfPassesCorrectly():void{
			assertTrue("checkPropertyHasValueOf passes correctly", (instance.checkPropertyHasValueOf("alpha", 1)));
		}
		
		public function testCheckPropertyHasValueOfFailsCorrectly():void{
			assertFalse("checkPropertyHasValueOf fails correctly", (instance.checkPropertyHasValueOf("width", 10)));
		}
		                
		
	}
}