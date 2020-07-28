public with sharing class SpeakerControllerExtension {
	
	private Speaker__c speaker;
	private ApexPages.StandardController stdController;
	public blob picture{get;set;}
	public String errorMessage {get;set;}
	
	public SpeakerControllerExtension(ApexPages.StandardController stdController) {
		this.speaker = (Speaker__c)stdController.getRecord();
		this.stdController = stdController;
	}
	
	public PageReference save() {
		errorMessage = '';
		try {
				upsert speaker;
				if (picture <> null) {
					Attachment attachment = new Attachment();
					attachment.body = picture;
					attachment.name = 'Speaker_' + speaker.Id + '.png';
					attachment.id = speaker.id;
					attachment.ContentType = 'application/png';
					insert attachment;
					speaker.Picture_Path__c = '/servlet/servlet.FileDownload?file=' + attachment.Id;
					update speaker;
				}
			return new ApexPages.StandardController(speaker).view();
		} catch (System.Exception ex) {
			errorMessage = ex.getMessage();
			return null;
		} 
	}
}