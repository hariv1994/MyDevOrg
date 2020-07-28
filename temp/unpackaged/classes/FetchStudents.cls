public with sharing class FetchStudents {

    public String htNo {get; set;}
    public String name {get; set;}
    public List<Student__c> student {get; set;}    
                
    public void getStuByHtNo() {
        student = new List<Student__c>();        
        student = [SELECT Id,Active__c,Address__c,Email__c,FirstName__c,
                     ID__c,LastName__c,MiddleName__c,Phone__c,Remarks__c,
                     Branch__c,Batch__c 
                     FROM Student__c where ID__c = :htNo];
                     
        if(student.size() == 0){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,
                            'No Records found for the Hall ticket Number. Please verify the number'));
        }
    }

    public void getStuByName() {
        student = new List<Student__c>();

        String searchName = '*'+name+ '*';
        String query = 'Find \' ' +  searchName + 
                        ' \' Returning Student__c(FirstName__c,LastName__c,ID__c,Phone__c,Email__c,Branch__c,Batch__c)'; 

        List<List<SObject>> searchList = search.query(query);       

        student = (List<Student__c>)searchList[0];

        if(student.size() == 0){
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,
                            'No records found with the name'));
        }
    }

    public PageReference viewStudent() {
         string myParam = apexpages.currentpage().getparameters().get('studentID');

         system.debug('Test Value - ' + myParam);

         //PageReference pageRef = new PageReference('/'+myParam);
         PageReference pageRef = Page.StudentDetail;
         pageRef.getParameters().put('id',myParam);
         pageRef.setRedirect(true); 

         return pageRef;     
    }

     public PageReference editStudent() {
         string myParam = apexpages.currentpage().getparameters().get('studentID');

         system.debug('Test Value - ' + myParam);

         PageReference pageRef = new PageReference('/'+myParam+'/e');
         pageRef.setRedirect(true); 

         return pageRef;     
    }
}