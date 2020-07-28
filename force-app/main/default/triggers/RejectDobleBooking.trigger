trigger RejectDobleBooking on Session_Speaker__c (before insert, before update) {
	
	List<Id> speakerIds = new List<Id>();
	Map<Id, DateTime> requested_bookings = new Map<Id,DateTime>();
	
	for(Session_Speaker__c newItem : Trigger.new){
		requested_bookings.put(newItem.Session__c,null);
		speakerIds.add(newItem.Speaker__c);
	}
	
	List<Session__c> related_sessions = [select Id,Session_Date__c from Session__c where Id in :requested_bookings.keySet()];
	for(Session__c related_session : related_sessions){
		requested_bookings.put(related_session.Id,related_session.Session_Date__c);
	}
	
	// Debug 
	for(Id d : requested_bookings.keySet()){	
		DateTime dt = requested_bookings.get(d);
		system.debug('Match with current object Date :' + dt);
	}
	
	List<Session_Speaker__c> related_speakers = [select Id, Speaker__c,Session__r.Session_Date__c from Session_Speaker__c where Speaker__c in :speakerIds];
	
	for(Session_Speaker__c requested_session_speaker : Trigger.new){
		DateTime booking_time = requested_bookings.get(requested_session_speaker.Session__c);
		for (Session_Speaker__c related_speaker : related_speakers){
			if (related_speaker.Speaker__c == requested_session_speaker.Speaker__c &&
				related_speaker.Session__r.Session_Date__c == booking_time){
				requested_session_speaker.addError('The speaker is already booked at that time');			
			}
		}
	}
    
}