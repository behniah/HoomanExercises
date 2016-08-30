<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Pivot Arrays Test</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  </head>
  <body>
    <div class="container">
		<cfoutput>
			<!--- Instantiate object needed --->
			<cfset variables.arrayUtilsObj = CreateObject("component", "HoomanExercises.PivotIndexExercise.library.com.arrayUtils") />
			<h1>Pivot Arrays Tests</h1>
			<hr/>

			<h2>Testing Array 1 of input: "1,3,5,6,8,10,12,9,11"</h2>
			<hr>
			<cfset variables.arrayList = "1,3,5,6,8,10,12,9,11" />
			<cfset variables.myTestArray = ListToArray(variables.arrayList) />
	
			<!--- Now call function to inspect array --->
			<cfset variables.returnResult = variables.arrayUtilsObj.checkArrayForPivotIndex(variables.myTestArray) />
			
			
			<cfif variables.returnResult.pivotIndex EQ 0>
			 	<h3>
					The array you entered with values: "#variables.arrayList#" does <em>not</em> have a Pivot index.
				</h3>
				
			<cfelse>
				<h3>
					The array you entered with values: "#variables.arrayList#" <em>does</em> have a pivot index:
					<ul>
						<li>Index : #variables.returnResult.pivotIndex#</li>
						<li>Index Value: #variables.returnResult.pivotIndexValue#</li>
						<li>Pivot Value: #variables.returnResult.pivotValue#</li>
					</ul>
				</h3>
			</cfif>
			
			<p>--------------------------------------------------------------------------------------------------------------------------</p>
			
			<h2>Testing Array 2 of input: "1,3,5,10,8,1,1,9,8"</h2>
			<hr>
			<cfset variables.arrayList2 = "1,3,5,10,8,1,1,9,8" />
			<cfset variables.myTestArray2 = ListToArray(variables.arrayList2) />
	
			<!--- Now call function to inspect array --->
			<cfset variables.returnResult2 = variables.arrayUtilsObj.checkArrayForPivotIndex(variables.myTestArray2) />
			
			
			<cfif variables.returnResult2.pivotIndex EQ 0>
			 	<h3>
					The array you entered does <em>not</em> have a Pivot index.
				</h3>
				
			<cfelse>
				<h3>
					The array you entered <em>does</em> have a pivot index:
					<ul>
						<li>Index : #variables.returnResult2.pivotIndex#</li>
						<li>Index Value: #variables.returnResult2.pivotIndexValue#</li>
						<li>Pivot Value: #variables.returnResult2.pivotValue#</li>
					</ul>
				</h3>
			</cfif>
			
			<p>--------------------------------------------------------------------------------------------------------------------------</p>
			
			<h2>Testing Array 3 of input: "5,9,7,17,6,5,4,6"</h2>
			<hr>
			<cfset variables.arrayList3 = "5,9,7,17,6,5,4,6" />
			<cfset variables.myTestArray3 = ListToArray(variables.arrayList3) />

			<!--- Now call function to inspect array --->
			<cfset variables.returnResult3 = variables.arrayUtilsObj.checkArrayForPivotIndex(variables.myTestArray3) />
			
			
			<cfif variables.returnResult3.pivotIndex EQ 0>
			 	<h3>
					The array you entered does <em>not</em> have a Pivot index.
				</h3>
				
			<cfelse>
				<h3>
					The array you entered <em>does</em> have a pivot index:
					<ul>
						<li>Index : #variables.returnResult3.pivotIndex#</li>
						<li>Index Value: #variables.returnResult3.pivotIndexValue#</li>
						<li>Pivot Value: #variables.returnResult3.pivotValue#</li>
					</ul>
				</h3>
			</cfif>
		</cfoutput>
    </div>
  </body>
</html>