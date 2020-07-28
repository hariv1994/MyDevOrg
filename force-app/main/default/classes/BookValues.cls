public with sharing class BookValues {

    public String testPickValue {get;set;}
    
    //public List<String> pickValues {get;set;}
    
    public List<SelectOption> getPickValues(){
       /* List<Book__c> books = [select States__c from Book__c];
        List<String> bookStates = new List<String>();
        for(Book__c book : books) {
           bookStates.add(book.States__c);
        }
        return bookStates;*/
        
        List<SelectOption> books = new List<SelectOption>();
        books.add(new SelectOption('','TN'));
        books.add(new SelectOption('','VA'));
        books.add(new SelectOption('','TX'));
        books.add(new SelectOption('','MA'));
        
        return books;
    }


    public BookValues(ApexPages.StandardController stdController){
        System.debug('Pick List Value' + testPickValue);
    }
}