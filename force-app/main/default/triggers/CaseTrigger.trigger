// Change the status of all incoming cases to closed. 
trigger CaseTrigger on Case (before insert, after insert, before update, after update,
                             before delete, after delete) {
                             
     if(Trigger.isBefore) {
         if(Trigger.isInsert) {
             System.debug('Before Insert Trigger ---> ');
             System.debug('Profile Name -- ' + SingletonUtility.getSingletonUtility().getUserProfile());
         }
         if(Trigger.isUpdate) {             
             System.debug('Before Update Trigger ---> ');
             System.debug('Profile Name -- ' + SingletonUtility.getSingletonUtility().getUserProfile());
         }
     }
     if(Trigger.isAfter) {
         if(Trigger.isInsert) {
             System.debug('After Insert Trigger ---> ');
             System.debug('Profile Name -- ' + SingletonUtility.getSingletonUtility().getUserProfile());
         } 
         if(Trigger.isUpdate) {
                 System.debug('After Update Trigger ---> ');
                 System.debug('Profile Name -- ' + SingletonUtility.getSingletonUtility().getUserProfile());
                 List<Case> casesList = new List<Case>();
                 List<Case> oldcaseList = [Select Id,Reason from case where Id IN :Trigger.New];
                 for(Case c : oldcaseList) {
                     if(c.Reason.equals('Installation')) {
                         c.Reason = 'Feedback';
                         casesList.add(c);
                     }
                 }
                 
                 update casesList;
         }                 
     }
}