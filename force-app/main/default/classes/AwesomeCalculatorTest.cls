@isTest
private class AwesomeCalculatorTest {
	
	@isTest static void test_method_one() {
		Test.setMock(WebServiceMock.class, new CalculatorCalloutMock());

		Double x = 4;
		Double y = 7;

		Double result = AwesomeCalculator.add(x,y);
		system.debug('Result -> ' + result);
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}