<!DOCTYPE html>
<html lang="en">
<head>
    <title>Exercises</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="library/css/styles.css" media="screen" />

    <script src="library/scripts/jquery-min.js" type="text/javascript"></script>
	<script src="library/scripts/addressLookup.js" type="text/javascript"></script>
</head>

<cfoutput>

	<body>
		<div id="content">
			<section id="contact">
				<hgroup>
					<h1>Contact Data</h1>
					<h2>Please complete the form below</h2>
				</hgroup>
				<form name="contactForm" id="contactForm"> 
					<label for="name" id="nameLabel">Name</label>    
					<input tabindex="1" id="name" name="name" type="text" title="full name" /> 
					
					<label for="email" id="emailLabel">Email</label>  
					<input tabindex="2" id="email" name="email" type="text" placeholder="name@domain.com" title="name@domain.com"  onblur="validateEmailAddress($(this).val());"/>
					<div class="clear"></div>
					
					
					<label for="dobDay" id="dateOfBirthLabel">Date Of Birth</label> 
					<select class="columnInput" name="dobDay" id="dobDay">
						<cfloop from="1" to="31" index="day">
							<option value="#day#">#day#</option>
						</cfloop>
					</select>
					<select class="columnInput" name="dobMonth" id="dobMonth">
						<cfloop from="1" to="12" index="month">
							<option value="#month#">#MonthAsString(month)#</option>
						</cfloop>
					</select>
					<select class="columnInput" name="dobYear" id="dobYear">
						<cfloop from="#Year(now())#" to="1916" index="year" step="-1">
							<option value="#year#">#year#</option>
						</cfloop>
					</select>
					<div class="clear"></div>
					
					<label for="name" id="houseNumberLabel">House Number</label>    
					<input tabindex="4" id="houseNumber" name="houseNumber" type="text" required title="House number" />
					<div class="clear"></div>
					
					<label for="name" id="address1Label" class="address">Address 1</label>    
					<input tabindex="8" class="address" id="address1" name="address1" type="text" title="Address 1" />
					<div class="clear"></div>
					
					<label for="name" id="address2Label" class="address">Address 2</label>    
					<input tabindex="9" class="address" id="address2" name="address2" type="text" title="Address 2" />
					<div class="clear"></div>
					
					<label for="name" id="cityLabel" class="address">City</label>    
					<input tabindex="10" class="address" id="city" name="city" type="text" title="City" />
					<div class="clear"></div>
					
					<label for="name" id="postcodeLabel" class="columnLabel">Postcode</label>    
					<input tabindex="6" class="columnInput" id="postcode" name="postcode" type="text" required title="Address Postcode" onblur="formatPostcode($(this).val());" />
					<div class="clear"></div>
					
					<p id="errorMessage" style="display:none;"></p>
					
					<input tabindex="7" class="linkButton" id="lookupAddress" name="lookupAddress" type="button" value="Lookup Address" /> 
					<input tabindex="11" class="linkButton" style="display:none;" id="clearForm" name="clearForm" type="button" value="Clear" />
					<div class="clear"></div>
				</form>
			</section>
		</div>
	</body>
</cfoutput>
</html>