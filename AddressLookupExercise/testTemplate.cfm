<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Address Lookup Test</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  </head>
  <body>
    <div class="container">
		<cfoutput>
			<!--- Instantiate object needed --->
			<cfset variables.arrayUtilsObj = CreateObject("component", "HoomanExercises.AddressLookupExercise.library.com.addressLookup") />
			<h1> Address Lookup Tests</h1>
			<hr />

			<h2>Testing address 1 - House Number: 20, Postcode: N6 4NY</h2>
			<hr>
			<cfset variables.houseNumber = 20 />
			<cfset variables.postcode = "N64NY" />
	
			<!--- Now call function to inspect array --->
			<cfset variables.returnResult = variables.arrayUtilsObj.doAddressLookup(houseNumber, postcode) />
			
			<cfif arrayLen(variables.returnResult) GT 0>
				<h3>Matching details found:</h3>
				<cfdump var="#variables.returnResult#" />
			<cfelse>
				<h3> No match found</h3>
			</cfif>
			
			<p>--------------------------------------------------------------------------------------------------------------------------</p>
			
			<h2>Testing address 2 - House Number: 12, Postcode: HP2 4FA</h2>
			<hr>
			<cfset variables.houseNumber2 = 12 />
			<cfset variables.postcode2 = "HP24FA" />
	
			<!--- Now call function to inspect array --->
			<cfset variables.returnResult2 = variables.arrayUtilsObj.doAddressLookup(houseNumber2, postcode2) />
			
			<cfif arrayLen(variables.returnResult2) GT 0>
				<h3>Matching details found:</h3>
				<cfdump var="#variables.returnResult2#" />
			<cfelse>
				<h3> No match found</h3>
			</cfif>
			
			<p>--------------------------------------------------------------------------------------------------------------------------</p>
			
			<h2>Testing address 3 - House Number: 8, Postcode: UB9 5NB</h2>
			<hr>
			<cfset variables.houseNumber3 = 8 />
			<cfset variables.postcode3 = "UB95NB" />
	
			<!--- Now call function to inspect array --->
			<cfset variables.returnResult3 = variables.arrayUtilsObj.doAddressLookup(houseNumber3, postcode3) />
			
			<cfif arrayLen(variables.returnResult3) GT 0>
				<h3>Matching details found:</h3>
				<cfdump var="#variables.returnResult3#" />
			<cfelse>
				<h3> No match found</h3>
			</cfif>
		</cfoutput>
    </div>
  </body>
</html>