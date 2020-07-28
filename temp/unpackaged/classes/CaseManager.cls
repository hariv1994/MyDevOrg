@RestResource(urlMapping='/Cases/*')
global with sharing class CaseManager {
	
	@HttpGet
	global static Case getCaseById() {
		RestRequest request = RestContext.request;
		String caseId = request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);
		Case result = [select CaseNumber,Subject,Status,Origin,Priority
						FROM Case
						where Id = :caseId];

		return result;
	}

	@HttpPost
	global static Id createCase(String subject, String status, String origin, String priority) {
		Case thisCase = new Case(
			Subject = subject,
			Status = status,
			Origin = origin,
			Priority = priority);

		insert thisCase;
		return thisCase.Id;
	}

	@HttpDelete
	global static void deleteCase() {
		RestRequest request = RestContext.request;

		Id caseId = request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);

		Case thisCase = [select Id 
							FROM Case
							where Id = :caseId];

		delete thisCase;
	}

	@HttpPut
	global static Id upsertCase(String subject, String status, String origin, String priority,
								String id) {
		Case thisCase;
		if(Id != null) {
			thisCase = new Case(
				Id = id,
				Subject = subject,
				Status = status,
				Origin = origin,
				Priority = priority);			
		}
		else {
			thisCase = new Case(				
				Subject = subject,
				Status = status,
				Origin = origin,
				Priority = priority);
		}

		upsert thisCase;
		return thisCase.Id;
	}

	@HttpPatch
	global static Id updateCaseFields() {
		RestRequest request = RestContext.request;

		String caseId = request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);

		Case thisCase = [select Id 
							FROM Case
							where Id = :caseId];

		Map<String,Object> params = (Map<String,Object>)JSON.deserializeUntyped(request.requestBody.toString());

		for(String fieldName : params.keySet()) {
			thisCase.put(fieldName,params.get(fieldName));
		}

		update thisCase;
		return thisCase.Id;
	}


}