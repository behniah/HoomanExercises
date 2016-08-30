<cfparam name="form.arrayList" type="string" default="" />

<cfif Len(trim(form.arrayList))>
	<cfset variables.myTestArray = ListToArray(form.arrayList) />
	
	<cfset variables.arrayUtilsObj = CreateObject("component", "HoomanExercises.PivotIndexExercise.library.com.arrayUtils") />
	<!--- Now call function to inspect array --->
	<cfset variables.returnResult = variables.arrayUtilsObj.checkArrayForPivotIndex(variables.myTestArray) />
	
</cfif>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Exercises</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="library/css/styles.css" media="screen" />
</head>
<cfoutput>
	<body>
	    <div id="content">
			<section id="contact">
				<hgroup>
					<h1>Pivot Array</h1>
				</hgroup>
				<cfif Len(trim(form.arrayList))>
				
					<cfif variables.returnResult.pivotIndex EQ 0>
					 	<p>
							The array you entered with values: "#form.arrayList#" does <em>not</em> have a Pivot index.
						</p>
						
					<cfelse>
						<p>
							The array you entered with values: "#form.arrayList#" <em>does</em> have a pivot index:
							<ul>
								<li>Index : #variables.returnResult.pivotIndex#</li>
								<li>Index Value: #variables.returnResult.pivotIndexValue#</li>
								<li>Pivot Value: #variables.returnResult.pivotValue#</li>
							</ul>
						</p>
					</cfif>
				</cfif>
	       </section>
	    </div>
	</body>
</cfoutput>
</html>