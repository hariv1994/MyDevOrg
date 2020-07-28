trigger SendConfirmationEmail on Session_Speaker__c (after insert) {
 
 List<Id> sessionSpeakerId = new List<Id>();
 for(Session_Speaker__c newitem : Trigger.new) {
 	sessionSpeakerId.add(newitem.Id);
 }   
 
 for(Id i : sessionSpeakerId){
 	system.debug('Session Speaker Ids : ' + i);
 }
 
 List<Session_Speaker__c> sessionSpeakers = [select Session__r.Name,
 													Session__r.Session_Date__c,
 													Speaker__r.First_Name__c,
 													Speaker__r.Last_Name__c,
 													Speaker__r.Email__c
 							from Session_Speaker__c where Id in :sessionSpeakerId];
 							
 for (Session_Speaker__c ss : sessionSpeakers){
 	system.debug('Email for the speaker(s) :' + ss.Speaker__r.Email__c);
 }
 							
 if (sessionSpeakers.size() > 0){
 	Session_Speaker__c sessionSpeaker = sessionSpeakers[0];
 	if (sessionSpeaker.Speaker__r.Email__c != null){
 		String email = sessionSpeaker.Speaker__r.Email__c;
 		String subject = 'Speaker confirmation'; 
 		String body = 'Dear ' + sessionSpeaker.Speaker__r.First_Name__c + ',\nYour session "' +
 						sessionSpeaker.Session__r.Name + '" on ' + sessionSpeaker.Session__r.Session_Date__c + ' is confirmed.\n\n' +
 						'Thanks for speaking at the conference!';
		EmailManager.sendMail(email,subject,body);						
 						
 	}
 }
 
}