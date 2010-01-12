package com.newloop.roboteyes.core {

	import asunit.framework.TestCase;
	
	import robotEyesDemoApp;
	                       
	public class RobotEyesTest extends TestCase {
		private var robotEyes:RobotEyes;

		public function RobotEyesTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			robotEyes = new RobotEyes(robotEyesDemoApp);
		}

		override protected function tearDown():void {
			super.tearDown();
			robotEyes = null;
		}

		public function testInstantiated():void {
			assertTrue("robotEyes is RobotEyes", robotEyes is RobotEyes);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
	}
}