public with sharing class RandomContactFactory {
	public RandomContactFactory() {
		
	}

	public static List<Contact> generateRandomContacts(Integer noOfContacts, String lastName) {

		if(noOfContacts <= 0) {
			return null;
		}

		List<Contact> contacts = new List<Contact>();

		for(Integer i=1;i<=noOfContacts;i++) {

			Contact con = new Contact();
			con.FirstName = 'Test Name ' + Math.round(Math.random()*1000);
			con.LastName = lastName;

			contacts.add(con);
		}
		
		return contacts;
	}
}