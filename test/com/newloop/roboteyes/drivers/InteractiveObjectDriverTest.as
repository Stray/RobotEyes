package com.newloop.roboteyes.drivers {

	import asunit.framework.TestCase;
	
	import flash.display.InteractiveObject;
	import flash.display.Sprite;

	public class InteractiveObjectDriverTest extends TestCase {
		private var instance:InteractiveObjectDriver;
		
		private var testObject:InteractiveObject;

		public function InteractiveObjectDriverTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
		   	testObject = new Sprite();
			instance = new InteractiveObjectDriver(testObject);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is InteractiveObjectDriver", instance is InteractiveObjectDriver);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
	}
}