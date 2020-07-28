public with sharing class AnimalLocator {
	/*public AnimalLocator() {
		
	}*/

	public static String getAnimalNameById(Integer animalId) {

		Http http = new Http();
		HttpRequest httpRequest = new HttpRequest();
		httpRequest.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+animalId);
		httpRequest.setMethod('GET');
		HttpResponse httpResponse = http.send(httpRequest);

		String animalName = null;

		if(httpResponse.getStatusCode() == 200) {
			JSONParser parser = JSON.createParser(httpResponse.getBody());
			while(parser.nextToken() != null) {
				if(parser.getCurrentName() == 'name') {
					animalName = parser.getText();
				}
			}			
		}		
		return animalName;
	}
}