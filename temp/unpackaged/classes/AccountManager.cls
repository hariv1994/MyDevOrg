@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

	@HttpGet
	global static Account getAccount() {
		RestRequest request = RestContext.request;
		String accountId = request.requestURI.substringBetween('/Accounts/','/contacts');

		Account account = [select Id,Name,(select Id,Name FROM Contacts) 
							FROM Account
							Where Id = :accountId];

		return account;
	}
	
}