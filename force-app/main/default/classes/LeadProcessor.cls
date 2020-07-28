global class LeadProcessor implements Database.Batchable<sObject> {
	
	
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		system.debug('Batch Job Called !!!');
		String query = 'Select Id,Name,LeadSource from Lead LIMIT 200';
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<Lead> leads) {

   		system.debug('Inside Execute Method');

   		for(Lead lead : leads ) {
   			lead.LeadSource = 'Dreamforce';
   		}

   		update leads;

   		for(Lead lead : leads) {
   			system.debug('Lead Source --> ' + lead.LeadSource);
   		}
	
	}
	
	global void finish(Database.BatchableContext BC) {
		
	}
	
}