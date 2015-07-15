$(document).ready(function() {
	$("#read").click(function () {
		var myString = 'ovde ce ici string';
		$.post("http://localhost:4567/", { myString: myString });

		if ($('[name="speed1"]').is(':checked')){ var mySpeed = "200"; };
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

	});
});


