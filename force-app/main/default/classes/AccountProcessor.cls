public with sharing class AccountProcessor {

	@future
	public static void countContacts(Id accountId){
		AggregateResult[] childContactsList = [select Count(Id) childContacts, AccountId 
									FROM contact 
									Where AccountId = :accountId group by AccountId];

		List<Account> accounts = [select Id,Name,Number_of_Contacts__c
								FROM Account
								where Id = :accountId];

		Map<Id,decimal> accountNoofContacts = new Map<Id,Decimal>();

		for(AggregateResult resultSet : childContactsList) {
			accountNoofContacts.put((Id)resultSet.get('AccountId'),(decimal)resultSet.get('childContacts'));
		}

		system.debug('Number of Contacts Size --> ' + accountNoofContacts.size());

		for(Id test : accountNoofContacts.keySet()) {
			system.debug('Number of Contacts --> ' + accountNoofContacts.get(test));
		}

		for(Account account : accounts) {
			if(accountNoofContacts.containsKey(account.Id)) {
				account.Number_of_Contacts__c = accountNoofContacts.get(account.Id);
			}
		}

		update accounts;
		
	}

}