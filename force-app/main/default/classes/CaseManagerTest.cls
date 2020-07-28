@isTest
private class CaseManagerTest
{
	@isTest
	static void itShould()
	{
		Id  recordId = createTestRecord();
		RestRequest request =  new RestRequest();
		request.requestURI = 'https://na46.salesforce.com/' + recordId;
		request.httpMethod = 'GET';
		RestContext.request = request;

		Case thisCase = CaseManager.getCaseById();

	}

	static Id createTestRecord() {
		Case thisCase = new case(
			 Subject='Test record',
            Status='New',
            Origin='Phone',
            Priority='Medium');

		insert thisCase;
		return thisCase.Id;
	}
}