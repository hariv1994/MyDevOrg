trigger HelloWorldTrigger on Book__c (before insert, before update) {
        Book__C[] book = Trigger.new;
        //MyHelloWorld.applyDiscount(book);
}