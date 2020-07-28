@isTest
private class AddPrimaryContactTest {
	
	@isTest static void test_method_one() {
		List<Account> accounts = new List<Account>();

		for(Integer i=1;i<51;i++) {
			Account acc = new Account();
			acc.Name = 'Test Account' + i;
			acc.BillingState = 'NY';

			accounts.add(acc);			
		}

		insert accounts;

		/*Contact con = new Contact(
						LastName = 'Test Sarat Contact');
		insert con;*/
		System.Test.startTest();
		Contact con = new Contact(
						LastName = 'Test Sarat Contact');
		insert con;
		AddPrimaryContact test = new AddPrimaryContact(con, 'NY');
		System.enqueueJob(test);
		System.Test.stopTest();
		
	}
	
	@isTest static void test_method_two() {
		List<Account> accounts = new List<Account>();

		for(Integer i=1;i<51;i++) {
			Account acc = new Account();
			acc.Name = 'Test Account' + i;
			acc.BillingState = 'CA';

			accounts.add(acc);			
		}

		insert accounts;

		Contact con = new Contact(
						LastName = 'Test Sarat Contact');

		AddPrimaryContact test = new AddPrimaryContact(con,'CA');
		System.Test.startTest();            
			System.enqueueJob(test);
		System.Test.stopTest();
	}
	
}