@isTest
private class AnimalLocatorTest {
	
	@isTest static void test_method_one() {
		Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

		String animalName = AnimalLocator.getAnimalNameById(1);
		system.debug('Animal Name --' + animalName);
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}