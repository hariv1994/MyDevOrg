global with sharing class StudentDetailExt {

    public static Id recordId;
    transient global String selectedYearPDF {get; set;}
    transient global String testVariable {get; set;}
    public Student__c student {get; set;}
    public List<Exam__c> selectedYear = new List<Exam__c>();
    public List<Exam__c> firstYearISemReg {get; set;}
    public List<Exam__c> firstYearIISemReg {get; set;}
    public List<Exam__c> secondYearISemReg {get; set;}
    public List<Exam__c> secondYearIISemReg {get; set;}
    public List<Exam__c> thirdYearISemReg {get; set;}
    public List<Exam__c> thirdYearIISemReg {get; set;}
    public List<Exam__c> fourthYearISemReg {get; set;}
    public List<Exam__c> fourthYearIISemReg {get; set;}

    public List<Exam__c> firstYearISemSup {get; set;}
    public List<Exam__c> firstYearIISemSup {get; set;}
    public List<Exam__c> secondYearISemSup {get; set;}
    public List<Exam__c> secondYearIISemSup {get; set;}
    public List<Exam__c> thirdYearISemSup {get; set;}
    public List<Exam__c> thirdYearIISemSup {get; set;}
    public List<Exam__c> fourthYearISemSup {get; set;}
    public List<Exam__c> fourthYearIISemSup {get; set;}

    public StudentDetailExt(ApexPages.StandardController standradController) {
        recordId = ApexPages.currentPage().getParameters().get('id');
        //student = new Student__c();
        system.debug('Record ID ' + recordId);
        List<Exam__c> allExams = [select Id,Name,Branch__c,Marks__c,Course__c,External__c,
                                    Semester__c,StudentYear__c,RecordType.DeveloperName,
                                    Course__r.CourseName__c,toLabel(ExamType__c)
                                    from Exam__c 
                                    where Exam__c =: recordId];
        getFirstYearResults(allExams);
        IyrRegReport();
        getReports();
    }

    public void getFirstYearResults(List<Exam__c> allExams) {
        firstYearISemReg = new List<Exam__c>();
        firstYearIISemReg = new List<Exam__c>();
        secondYearISemReg = new List<Exam__c>();
        secondYearIISemReg = new List<Exam__c>();
        thirdYearISemReg = new List<Exam__c>();
        thirdYearIISemReg = new List<Exam__c>();
        fourthYearISemReg = new List<Exam__c>();
        fourthYearIISemReg = new List<Exam__c>();
        
        firstYearISemSup = new List<Exam__c>();
        firstYearIISemSup = new List<Exam__c>();
        secondYearISemSup = new List<Exam__c>();
        secondYearIISemSup = new List<Exam__c>();
        thirdYearISemSup = new List<Exam__c>();
        thirdYearIISemSup = new List<Exam__c>();
        fourthYearISemSup = new List<Exam__c>();
        fourthYearIISemSup = new List<Exam__c>();

        for(Exam__c exam : allExams) {
            if(exam.StudentYear__c.equals('1Year') && exam.Semester__c.equals('ISem') 
                && exam.ExamType__c.contains('Reg')){
                firstYearISemReg.add(exam);
            }
            if(exam.StudentYear__c.equals('1Year') && exam.Semester__c.equals('ISem') 
                && exam.ExamType__c.contains('Sup')){
                firstYearISemSup.add(exam);
            }
            if(exam.StudentYear__c.equals('1Year') && exam.Semester__c.equals('IISem') 
                && exam.ExamType__c.contains('Reg')){
                firstYearIISemReg.add(exam);
            }
            if(exam.StudentYear__c.equals('1Year') && exam.Semester__c.equals('IISem') 
                && exam.ExamType__c.contains('Sup')){
                firstYearIISemSup.add(exam);
            }
            if(exam.StudentYear__c.equals('2Year') && exam.Semester__c.equals('ISem') 
                && exam.ExamType__c.contains('Reg')){
                secondYearISemReg.add(exam);
            }
            if(exam.StudentYear__c.equals('2Year') && exam.Semester__c.equals('ISem') 
                && exam.ExamType__c.contains('Sup')){
                secondYearISemSup.add(exam);
            }
            if(exam.StudentYear__c.equals('2Year') && exam.Semester__c.equals('IISem') 
                && exam.ExamType__c.contains('Reg')){
                secondYearIISemReg.add(exam);
            }
            if(exam.StudentYear__c.equals('2Year') && exam.Semester__c.equals('IISem') 
                && exam.ExamType__c.contains('Sup')){
                secondYearIISemSup.add(exam);
            }
            if (exam.Branch__c != 'MBA' || exam.Branch__c != 'MCA') {
                if(exam.StudentYear__c.equals('3Year') && exam.Semester__c.equals('ISem') 
                    && exam.ExamType__c.contains('Reg')){
                    thirdYearISemReg.add(exam);
                }
                if(exam.StudentYear__c.equals('3Year') && exam.Semester__c.equals('ISem') 
                    && exam.ExamType__c.contains('Sup')){
                    thirdYearISemSup.add(exam);
                }
                if(exam.StudentYear__c.equals('3Year') && exam.Semester__c.equals('IISem') 
                    && exam.ExamType__c.contains('Reg')){
                    thirdYearIISemReg.add(exam);
                }
                if(exam.StudentYear__c.equals('3Year') && exam.Semester__c.equals('IISem') 
                    && exam.ExamType__c.contains('Sup')){
                    thirdYearIISemSup.add(exam);
                }
                if(exam.StudentYear__c.equals('4Year') && exam.Semester__c.equals('ISem') 
                    && exam.ExamType__c.contains('Reg')){
                    fourthYearISemReg.add(exam);
                }
                if(exam.StudentYear__c.equals('4Year') && exam.Semester__c.equals('ISem') 
                    && exam.ExamType__c.contains('Sup')){
                    fourthYearISemSup.add(exam);
                }
                if(exam.StudentYear__c.equals('4Year') && exam.Semester__c.equals('IISem') 
                    && exam.ExamType__c.contains('Reg')){
                    fourthYearIISemReg.add(exam);
                }
                if(exam.StudentYear__c.equals('4Year') && exam.Semester__c.equals('IISem') 
                    && exam.ExamType__c.contains('Sup')){
                    fourthYearIISemSup.add(exam);
                }
            }           
        }
    }

    public List<SelectOption> getReports() {
    	
    	List<SelectOption> options = new List<SelectOption>();
    	Schema.DescribeFieldResult fieldResult = Student__c.Report__c.getDescribe();
    	List<Schema.PicklistEntry> reports = fieldResult.getPicklistValues();
  	
    	for(Schema.PicklistEntry student : reports) {
    		options.add(new SelectOption(student.getLabel(),student.getValue()));
    	}
    	return options;
    }

    public void IyrRegReport(){

    	//String test = student.Report__c;
    	//system.debug('Test ' + test);
    
        Map<String,String> codeMap = new Map<String,String>();
        system.debug('Value of pick list is ' + selectedYearPDF + testVariable);
        
        /*codeMap.put('11Reg',firstYearISemReg);
        codeMap.put('11Reg',firstYearIISemReg);
        codeMap.put('11Reg',secondYearISemReg);
        codeMap.put('11Reg',secondYearIISemReg);
        codeMap.put('11Reg',thirdYearISemReg);
        codeMap.put('11Reg',thirdYearIISemReg);*/
        if (selectedYearPDF == 'firstYearFirstSem') {
            selectedYear = firstYearISemReg;
        }

       /* PageReference pageRef = Page.FirstYearPDF;
        pageRef.getParameters().put('id',recordId);
        return pageRef;*/
    }
}