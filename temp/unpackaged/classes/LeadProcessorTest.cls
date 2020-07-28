@isTest
private class LeadProcessorTest {
	
	@isTest static void test_method_one() {

		List<Lead> leads = new List<Lead>();
		for(Integer i=1; i<=300; i++) {
			Lead lead = new Lead(
				LastName = 'Test - ' + i,
				Company = 'Company - ' + i,
				Status = 'Open - Not Contacted');

			leads.add(lead);
		}

		insert leads;

		system.debug('Leads Size - ' + leads.size());

		Test.startTest();
		LeadProcessor lp = new LeadProcessor();
		Id batchId = Database.executeBatch(lp,200);
		//System.abortJob(batchID);
		Test.stopTest();
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}