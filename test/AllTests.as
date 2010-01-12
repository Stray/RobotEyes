package {
	/**
	 * This file has been automatically created using
	 * #!/usr/bin/ruby script/generate suite
	 * If you modify it and run this script, your
	 * modifications will be lost!
	 */

	import asunit.framework.TestSuite;
	import com.newloop.roboteyes.core.RobotEyesTest;
	import com.newloop.roboteyes.drivers.DisplayObjectDriverListTest;
	import com.newloop.roboteyes.drivers.DisplayObjectDriverTest;
	import com.newloop.roboteyes.drivers.InteractiveObjectDriverTest;
	import com.newloop.roboteyes.drivers.TextFieldDriverTest;

	public class AllTests extends TestSuite {

		public function AllTests() {
			addTest(new com.newloop.roboteyes.core.RobotEyesTest());
			addTest(new com.newloop.roboteyes.drivers.DisplayObjectDriverListTest());
			addTest(new com.newloop.roboteyes.drivers.DisplayObjectDriverTest());
			addTest(new com.newloop.roboteyes.drivers.InteractiveObjectDriverTest());
			addTest(new com.newloop.roboteyes.drivers.TextFieldDriverTest());
		}
	}
}
