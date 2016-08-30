$(document).ready(function(){
	
	function isNumeric(n) {
		return !isNaN(parseFloat(n)) && isFinite(n);
	}
 
	$('#submitForm').click(function () {
		var userValues = $('#arrayList').val();
		var i = 0;
		
		if(userValues == ''){
			alert("Please enter some comma separated values for your array");
			return false;
		}
		else
		{
			//Check there are some comma separated values
			if (userValues.indexOf(',') > -1) 
			{ 
				var arrayOfValues = userValues.split(',');
				if(arrayOfValues.length < 3)
				{
					alert("Please enter at least 3 values for a valid Pivot array");
					return false;
					
				}
				else
				{
					//Check that all the values are numeric
					for (i=0; i < arrayOfValues.length; i++)
					{
						if(!isNumeric(arrayOfValues[i]))
						{
							alert("Only numeric values are allowed for Pivot arrays");
							return false;
						}
					}
					document.arrayForm.submit();
				}
			}
			else
			{
				alert("Please enter some comma separated values for your array");
				return false;
			}
		}
		
	});
}); 
