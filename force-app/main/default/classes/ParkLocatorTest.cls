@isTest
private class ParkLocatorTest {
  
  @isTest static void test_method_one() {
    Test.setMock(WebServiceMock.class, new ParkServiceMock());

    String countryName = 'India';

    String[] result = ParkLocator.country(countryName);
    system.debug('Result -> ' + result);
  }    
  
}