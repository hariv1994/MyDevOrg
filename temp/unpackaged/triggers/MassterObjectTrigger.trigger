// Create a DetailObject record after succesful insertion of the Master Object. 
// Fields to Map on DetailObject - Field1,Field2 and Field3
// Use Apex best practices and builky code
// Note: Same fields exist on both objects
trigger MassterObjectTrigger on MasterObject__c (before insert, after insert,
                                                 before update, after update,
                                                 before delete, after delete) {
                                                 
     if(Trigger.isBefore) {
        if(Trigger.isInsert) {
        
              for(MasterObject__c msObj : Trigger.New) {
              
              }
            
        }
        else if(Trigger.isUpdate) {
        
              for(MasterObject__c msObj : Trigger.New) {
              
              }
           
        }
        else if(Trigger.isDelete) {

        }
    }

    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
        
              
        }
           
        if(Trigger.isUpdate) {
        
        
              for(MasterObject__c msObj : Trigger.New) {
              
              }
            
        }
        else if(Trigger.isDelete) {

        }
    }      

}