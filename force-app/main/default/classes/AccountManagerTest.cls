@isTest
private class AccountManagerTest {
	
	@isTest static void test_method_one() {
		Id  recordId = createTestRecord();
		RestRequest request =  new RestRequest();
		request.requestURI = 'https://na46.salesforce.com/Accounts/' + recordId + '/contacts';
		request.httpMethod = 'GET';
		RestContext.request = request;

		Account acc = AccountManager.getAccount();
		system.assert(acc != null);
		system.assertEquals('Test record',acc.Name);
	}
	
	static Id createTestRecord() {
		Account thisAccount = new Account(
			Name='Test record');

		insert thisAccount;
		return thisAccount.Id;
	}
	
}