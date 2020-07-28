public class AddPrimaryContact implements Queueable {

	private Contact contact;
	private String state;

	public AddPrimaryContact(Contact contact, String state) {
		this.contact = contact;
		this.state = state;
	}


	public void execute(QueueableContext context) {
        List<Account> acccounts = [select Id,Name,BillingState 
        					FROM Account 
        					Where BillingState = :state limit 200];

        List<Contact> contacts = new List<Contact>();

        for(Account account : acccounts) {
        	Contact con = contact.clone();
        	contacts.add(con);
        }

        insert contacts;
	}
}