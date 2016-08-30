$(document).ready(function(){

	$('#lookupAddress').click(function () {
		var houseNumber = $('#houseNumber').val();
		var postcode = $('#postcode').val();
		
		if(houseNumber != '' && postcode != '')
		{
			$.ajax({
				url: 'library/com/addressLookup.cfc?method=doAddressLookup',
				type: 'POST',
				data: {
					houseNumber: houseNumber
					, postcode: postcode
				},
				dataType: 'JSON',
				success: function (result) {
					if(result.length > 0)
					{
						for (var i = 0; i < result.length; i++) {
							//Populate hidden fields
							$('#address1').val(result[i].address1);
							$('#address2').val(result[i].address2);
							$('#city').val(result[i].city);
						}
						
						//Display address fields
						$('.address').show();
						
						//Change buttons available
						$('#lookupAddress').hide();
						$('#clearForm').show();
						
						//Hide error message if there from previous lookup
						$('#errorMessage').hide()

					}
					else
					{
						$('#errorMessage').show().html('Sorry, no match for those details found').css({"color": "blue", "font-size":"20px"});
						$('#clearForm').show();
					}
						
					
				}
			});
		}
		else
		{
			alert("You must enter a house number and a valid postcode to continue");
		}
		
	});
	
	//Reset form when clear button is clicked
	$('#clearForm').click(function () {
		$(this).closest('form').find("input[type=text], email").val("");
		
		//Hide error message and clear button
		$('#errorMessage').hide()
		$('#clearForm').hide();
		
		//Hide address fields
		$('.address').hide();
		//Show lookup address button
		$('#lookupAddress').show();
	});
		
}); 


function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
    return pattern.test(emailAddress);
};


function validateEmailAddress(emailAddress) {
    if(emailAddress != '' && !isValidEmailAddress(emailAddress)) 
    { 
        alert(emailAddress + ' is not a valid email address');
    }
};

// Remove spaces from postcode for consistency in user entries
function formatPostcode(postcode)
{
	var formattedPostcode = postcode.replace(/\s/g, '');
	$('#postcode').val(formattedPostcode);
}
