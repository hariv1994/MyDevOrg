public with sharing class AngularVFController {
	
	public static String getContacts() {
		return JSON.serialize([select Id,FirstName,Lastname,email
								from contact]);
	}
}