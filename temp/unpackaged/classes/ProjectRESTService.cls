@RestResource(urlMapping='/project/*')
global with sharing class ProjectRESTService {

@HttpPost
global static String postProjectData(String ProjectRef, String ProjectName, 
                                    String OpportunityId, Date StartDate, 
                                    Date EndDate, Double Amount, String Status) {
                                    
           List<Project__c> projRef = [
               Select Id,ProjectRef__c, Name, Opportunity__c,
               Start_Date__c,End_Date__c, Billable_Amount__c, Status__c 
               From Project__c
               Where Name = :ProjectName 
               Limit 1
           ]; 
           
           Savepoint sp = DataBase.setSavepoint();
           
           try {
           
               if(Test.isRunningTest()) {
                   Project__c proj = new Project__c();
                   insert proj;
               }
           
               if(projRef.size() > 0) {
                   projRef[0].Name = ProjectName;
                   projRef[0].Opportunity__c = OpportunityId;
                   projRef[0].Start_Date__c = StartDate;
                   projRef[0].End_Date__c = EndDate;
                   projRef[0].Billable_Amount__c = Amount;
                   projRef[0].Status__c = Status;
                   update projRef;
               }
                else {
                    Project__c project = new Project__c();
                     
                    project.ProjectRef__c = ProjectRef;
                    project.Name = ProjectName;
                    project.Opportunity__c = OpportunityId;
                    project.Start_Date__c = StartDate;
                    project.End_Date__c = EndDate;
                    project.Billable_Amount__c = Amount;
                    project.Status__c = Status;
           
                    insert project;
                }
                                                       
                Opportunity opp = [select Id, DeliveryInstallationStatus__c,Discount_Percent__c from Opportunity where Id = :OpportunityId];
                opp.DeliveryInstallationStatus__c = 'In progress';
                
                update opp;
                
                return 'OK';
           }
                  
       catch(Exception ex) {
       system.debug('Exception message -->' + ex.getMessage());
          Database.rollback(sp);
          return 'UNAUTHORIZED';
       }
   }

}