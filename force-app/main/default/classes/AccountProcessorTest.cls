@isTest
private class AccountProcessorTest {
	
	@isTest static void test_method_one() {
		Account acc = new Account(
			Name='Test Sarat');

		insert acc;

		List<Contact> contacts = new List<Contact>();

		Contact con1 = new Contact(
			LastName = 'Test LastName1',
			AccountId = acc.Id);

		Contact con2 = new Contact(
			LastName = 'Test LastName2',
			AccountId = acc.Id);

		contacts.add(con1);
		contacts.add(con2);

		insert contacts;

		Test.startTest();
            AccountProcessor.countContacts(acc.Id);
		Test.stopTest();
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}