global class DailyLeadProcessor implements Schedulable {
	global void execute(SchedulableContext sc) {
		List<Lead> leads = [select Id,Name,LeadSource
							FROM Lead
							Where LeadSource = null];

		for(Lead lead : leads) {
			lead.LeadSource = 'Dreamforce';
		}

		update leads;

		system.debug('Lead Test -->' + leads.size());
	}
}