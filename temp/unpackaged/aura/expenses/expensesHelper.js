({
	createExpense : function(component,expense) {
		var cmpexpense = component.get("v.expenses");
        var newExpense = JSON.parse(JSON.stringify(expense));
        cmpexpense.push(newExpense);
        console.log(newExpense);
        component.set("v.expenses",cmpexpense);
	}
})