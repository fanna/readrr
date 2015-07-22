$(document).ready(function() {
    $("#execute").click(function () {

	var myString =  $('#final_array').text();
	var res = myString.split(" ");
	var arrayLength = res.length;
	for (var i = 0; i < arrayLength; i++) {
	    var myFinalString = res[i];
	    console.log(myFinalString);
	    $.post("http://localhost:4567/", { myFinalString: myFinalString });

	    /*if ($('[name="speed1"]').is(':checked')){ var mySpeed = "200"; };
	    if ($('[name="speed2"]').is(':checked')){ var mySpeed = "250"; };
	    if ($('[name="speed3"]').is(':checked')){ var mySpeed = "300"; };

	   $.post("http://localhost:4567/", { mySpeed: mySpeed });
	    //TODO: fix color statements
	    if ($('#toggle-one').bootstrapToggle('on')) {
		var myColor = "classic";
	    };

	    if ($('#toggle-two').bootstrapToggle('on')) {
		var myColor = "gay_clr";
	    };

	    if ($('#toggle-three').bootstrapToggle('on')) {
		var myColor = "repub_clr";
	    };

	    $.post("http://localhost:4567/", { myColor: myColor });
	*/

	}
    });

});


