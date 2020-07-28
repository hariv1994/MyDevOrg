public class ContactListController {

    private String sortOrder = 'LastName';
    
    
    public List<contact> getCtrls() {
        String query = 'Select Id,FirstName,LastName,Title,Email from Contact order by ' + sortOrder + ' Asc'; 
    	List<Contact> ctrls = Database.query(query);
        
        return ctrls;
    }
    
    public void sortByLastName() {
        this.sortOrder = 'LastName';
    }
    
    public void sortByFirstName() {
        this.sortOrder = 'FirstName';
    }
    
}