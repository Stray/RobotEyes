package com.newloop.roboteyes.drivers {

	import asunit.framework.TestCase;
	
	import flash.text.TextField;
	
	public class TextFieldDriverTest extends TestCase {
		private var instance:TextFieldDriver;
		
		private var testText:TextField;

		public function TextFieldDriverTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			testText = new TextField();
			testText.multiline = true;
			testText.wordWrap = true;
			instance = new TextFieldDriver(testText);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is TextFieldDriver", instance is TextFieldDriver);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testEnterText():void{     
			instance.enterText("HelloWorld");
			assertTrue("Text has been entered correctly", (testText.text == "HelloWorld"));
		}
		
		public function testAppendText():void{
			instance.enterText("Hi ");
			instance.appendText("there");
			assertTrue("Text has been appended correctly", (testText.text == "Hi there"));
		}
		
		public function testCheckTestPassesCorrectly():void{
			testText.text = "HelloWorld";
			assertTrue("checkText passes when text matches", (instance.checkText("HelloWorld")));
		}
		
		public function testCheckTestFailsCorrectly():void{
			testText.text = "Hi there";
			assertFalse("checkText fails when text doesn't match", (instance.checkText("HelloWorld")));
		}
		
		public function testWordCountIsPassesCorrectly():void{
			testText.text = "Hello geek world";
			assertTrue("wordCountIs passes when word count matches", (instance.wordCountIs(3)));
		}
		
		public function testWordCountIsFailsCorrectly():void{
			testText.text = "Hello geek world";
			assertFalse("wordCountIs passes when word count matches", (instance.wordCountIs(4)));
		}
		
		public function testIsNumericPassesCorrectly():void{
			testText.text = "35";
			assertTrue("isNumeric passes correctly", (instance.isNumeric()));
		}
		
		public function testIsNumericFailsCorrectly():void{
			testText.text = "AB";
			assertFalse("isNumeric fails correctly", (instance.isNumeric()));
		}
		
		public function testContainsPassesCorrectly():void{
			testText.text = "The quick brown fox learned TDD";
			assertTrue("contains passes correctly", (instance.contains("brown")));
		}
		
		public function testContainsFailsCorrectly():void{
			testText.text = "The quick brown fox learned TDD";
			assertFalse("contains fails correctly", (instance.contains("green")));
		}
		
		public function testIsEmptyPassesCorrectly():void{
			testText.text = "";
			assertTrue("isEmpty passes correctly", (instance.isEmpty()));
		}
		
		public function testIsEmptyFailsCorrectly():void{
			testText.text = "  ";
			assertFalse("isEmpty fails correctly", (instance.isEmpty()));
		}
		
		public function testIsNotEmptyPassesCorrectly():void{
			testText.text = " ";
			assertTrue("isNotEmpty passes correctly", (instance.isNotEmpty()));
		}
		
		public function testIsNotEmptyFailsCorrectly():void{
			testText.text = "";
			assertFalse("isNotEmpty fails correctly", (instance.isNotEmpty()));
		}
		
		public function testIsBlankPassesCorrectly():void{
			testText.text = "  ";
			testText.appendText("\r");
			testText.appendText(" ");
			assertTrue("isBlank passes correctly", (instance.isBlank()));
		}
		
		public function testIsBlankFailsCorrectly():void{
			testText.text = "A";
			assertFalse("isBlank fails correctly", (instance.isBlank()));
		}
		
		public function testIsNotBlankPassesCorrectly():void{
			testText.text = "A";
			assertTrue("isNotBlank passes correctly", (instance.isNotBlank()));
		}
		
		public function testIsNotBlankFailsCorrectly():void{
			testText.text = "   ";
			testText.appendText("\r");
			testText.appendText(" ");
			assertFalse("isNotBlank fails correctly", (instance.isNotBlank()));
		}
		
		public function testTextIsPassesCorrectly():void{
			testText.text = "Ruby";
			assertTrue("textIs passes correctly", (instance.textIs("Ruby")));
		}
		
		public function testTextIsFailsCorrectly():void{
			testText.text = "Ruby";
			assertFalse("textIs fails correctly", (instance.textIs("Badger")));
		}
	}
}