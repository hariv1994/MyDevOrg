public class MyHelloWorld {

public static void applyDiscount(Book__c book) {
	
	String objType = Trigger.New[0].getSObjectType().getDescribe().getName();
	system.debug('objType is '+ objType);
        List<Book__c> bkList = new List<Book__C>();
        bkList = [select price__c from Book__C];
        for ( book__c bk : bkList ){
            bk.Price__c *= 0.9;
        }
    }
}