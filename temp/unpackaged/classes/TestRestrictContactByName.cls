@isTest
private class TestRestrictContactByName
{
	@isTest
	static void itShould()
	{
		Contact con = new Contact(
			FirstName='Sarat',
			LastName='INVALIDNAME');
		

		Test.startTest();
         	insert con;  
		Test.stopTest();
	}
}