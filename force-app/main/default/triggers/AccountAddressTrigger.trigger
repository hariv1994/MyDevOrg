trigger AccountAddressTrigger on Account (before insert, before update) {

for(Account account : Trigger.new) {
	if(account.BillingPostalCode != null && account.Match_Billing_Address__c == true) {
		account.ShippingPostalCode = account.BillingPostalCode;
	}
}

}