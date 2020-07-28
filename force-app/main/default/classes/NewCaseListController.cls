public class NewCaseListController {
    
    public List<case> getNewCases() {
        String query = 'select Id,CaseNumber,SuppliedName from case where status = \'New\'';
        List<case> test = Database.query(query);
        return test;
    }

}