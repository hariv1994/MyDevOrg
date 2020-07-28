@istest
private class HelloWorldTestClass {
static testMethod void testapplyDiscount() {
		// Set up test data 
		Book__c bk = new Book__C();
		bk.Name = 'Software Testing';
		bk.Price__c = 20;
		
		/*Book__c bk1 = [select price__c from Book__C where name='Software Engineering'];
		system.debug(bk1.price__C);
		System.assertEquals(null, bk1.price__c);*/
		
		insert bk;
		
		Book__c bks = [select price__c from Book__C where name='Software Testing'];
		system.debug(bks.price__C);
		System.assertEquals(18.00, bks.price__c);
		
		delete bk;
		Book__c bks1 = [select price__c from Book__C where name='Software Testing'];
		system.debug(bks1.price__C);
		//System.assertEquals(null, bks1.price__c);
		
		
        /*List<Book__c> bks = [select price__c from Book__c where name='Software Engineering'];
        system.debug('*****bks'+bks);
            for ( Book__c b : bks ){
                System.assertEquals(22.5, b.Price__c);
            }*/
    }
}