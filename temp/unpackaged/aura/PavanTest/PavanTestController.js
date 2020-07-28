({
	handleClick : function(component, event, helper) {
		console.log("In my controller method 2");
        
        var self = this;
        var mousemoved = false;
        var mouseMoveHandler = function(event) {
            console.log("mouse move");
            mousemoved = true;
        }
        document.addEventListener("mousemove", mouseMoveHandler);
        
        var timeleft = 10;
        var downloadtimer = setInterval(function() {
            timeleft = timeleft - 1;
            console.log(timeleft);
            if(mousemoved == true) {
                timeleft = 10;
                mousemoved = false;
            }
            if(timeleft <= 0) {
                clearInterval(downloadtimer);
            }
        },1000);
        
        /*var action = component.get("c.getClick");
        action.setParams({});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
                alert(JSON.stringify(response.getReturnValue()));
            }
            else {
                alert("Error. Please verify");
            }
        });
        $A.enqueueAction(action);*/

	}
})