@isTest
private class DailyLeadProcessorTest {

	public static String CRON_EXP = '0 47 11 1/1 * ? *';
	
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

		Test.startTest();
			String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
		Test.stopTest();
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}