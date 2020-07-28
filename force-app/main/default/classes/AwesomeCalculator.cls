public with sharing class AwesomeCalculator {
	public AwesomeCalculator() {
		
	}

	public static Double add(Double x, double y){
		calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
		return calculator.doAdd(x,y);
	}
}