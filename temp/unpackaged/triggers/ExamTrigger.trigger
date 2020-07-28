trigger ExamTrigger on Exam__c (after insert,after update) {
    new ExamTriggerHelper().process();
}