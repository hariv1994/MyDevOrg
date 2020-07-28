@isTest
private class TestVerifyDate
{
	@isTest
	static void testCheckDates()
	{
		Date date1 = Date.newInstance(2017, 07, 10);
		Date date2 = Date.newInstance(2017, 07, 20);
		Date date3 = Date.newInstance(2017, 09, 20);

		Date date4 = VerifyDate.CheckDates(date1,date2);
		Date date5 = VerifyDate.CheckDates(date1,date3);

	}
}