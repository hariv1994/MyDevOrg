@isTest
public with sharing class ProjectRESTServiceTest {

@isTest static void test_method_one() {
  
  Opportunity opp = new Opportunity();
  opp.Name = 'Some opp Name';
  opp.StageName = 'Prospecting';
  opp.CloseDate = System.Today() + 100;
  
  insert opp;
   
  Test.startTest();
  
  Date startDate = System.today();
  Date endDate = System.today() + 100;
  Double amount = 50.00;
  String oppId = opp.Id;
  
  RestRequest req = new RestRequest();
  RestResponse res = new RestResponse();
  
  req.RequestURI = '/services/apexrest/project';
  req.httpMethod = 'POST';
  //req.RequestBody = Blob.Valueof(jsonReq);
  
  RestContext.request = req;
  ProjectRESTService.postProjectData('Ref7','Some Project 1',oppId,startDate,endDate,amount,'New');
  
  Project__c proj = new Project__c();
  proj.Name = 'Ref8';
  proj.ProjectRef__c = 'Some Project 1';
  proj.Start_Date__c = System.today();
  proj.End_Date__c = System.today() + 20;
  proj.Opportunity__c = opp.Id;
  proj.Billable_Amount__c = 50.00;
  proj.Status__c = 'Update';
  
  insert proj;
  
  ProjectRESTService.postProjectData(proj.Name,proj.ProjectRef__c,proj.Opportunity__c,proj.Start_Date__c,
                                      proj.End_Date__c,amount,proj.Status__c);
 
}

}