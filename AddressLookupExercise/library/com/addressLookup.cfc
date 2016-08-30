<cfcomponent displayname="addressLookup" output="false" hint="functions to manage lookup of an address">

	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->

	<!--- Setup private variables for class --->
	<cfscript>
		
		// Query to hold valid addresses in CF memory
		variables.qryAddressLookups = querynew("addressID, house_number, address1, address2, city, postcode", "integer, integer, varchar, varchar, varchar, varchar");
		
		//Add first address
		queryAddRow(variables.qryAddressLookups);
		querySetCell(variables.qryAddressLookups, "addressID", 1, 1);
		querySetCell(variables.qryAddressLookups, "house_number", 8, 1);
		querySetCell(variables.qryAddressLookups, "address1", "Denham Green Close", 1);
		querySetCell(variables.qryAddressLookups, "address2", "Denham", 1);
		querySetCell(variables.qryAddressLookups, "city", "Uxbridge", 1);
		querySetCell(variables.qryAddressLookups, "postcode", "UB95NB", 1);
		
		//Add second address
		queryAddRow(variables.qryAddressLookups);
		querySetCell(variables.qryAddressLookups, "addressID", 2, 2);
		querySetCell(variables.qryAddressLookups, "house_number", 20, 2);
		querySetCell(variables.qryAddressLookups, "address1", "Bishopswood Road", 2);
		querySetCell(variables.qryAddressLookups, "address2", "Highgate", 2);
		querySetCell(variables.qryAddressLookups, "city", "London", 2);
		querySetCell(variables.qryAddressLookups, "postcode", "N64NY", 2);
		
		//Add third address
		queryAddRow(variables.qryAddressLookups);
		querySetCell(variables.qryAddressLookups, "addressID", 3, 3);
		querySetCell(variables.qryAddressLookups, "house_number", 7, 3);
		querySetCell(variables.qryAddressLookups, "address1", "Buckle Court", 3);
		querySetCell(variables.qryAddressLookups, "address2", "1 Ruddock Close", 3);
		querySetCell(variables.qryAddressLookups, "city", "Edgware", 3);
		querySetCell(variables.qryAddressLookups, "postcode", "HA80SG", 3);
	
	</cfscript>
	
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------>
	<!--- CONSTRUCTOR ------------------------------------------------------------------------------------------------------------------------------------------------------>
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------>
	<cffunction name="init" access="public" output="false" returntype="addressLookup" hint="Pseudo-constructor">

		<cfscript>
			//struct that holds all private instance data in the variables scope
			instance = StructNew();
			return this;
		</cfscript>

	</cffunction>

	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<cffunction name="getInstance" access="public" returntype="struct">
		<cfreturn instance>
	</cffunction>

	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<cffunction name="doAddressLookup" access="remote" output="false" returntype="any" returnformat="json" displayname="Returns query with address matching house number and postcode entered">
		<cfargument name="houseNumber" 	type="numeric" 	required="true" default="0" />
		<cfargument name="postcode"		type="string" 	required="true" default="" />

		<cfset var local= {} /><!--- Backward compatibility for CF versions prior to 10 --->
		<cfset var returnValue = {} />
		
		<cfset local.qryAddressLookup = queryNew('') />
		
		<cfquery name="local.qryAddressLookup" dbtype="query">
					SELECT 		address1
								, address2
								, city
								, postcode
					FROM 		variables.qryAddressLookups
					WHERE		house_number = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.houseNumber#" />
								AND postcode = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.postcode#" />
		</cfquery>

		<cfset returnValue = queryToJSONArray(local.qryAddressLookup) />
		
		<cfreturn returnValue />

	</cffunction>
	
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<cffunction name="queryToJSONArray" access="private" output="false" hint="Converts a query to a JSON-friendly array of structs">
		<cfargument name="query" 		type="query" required="true" />
		<cfargument name="lowercase" 	type="boolean" default="true" />

		<cfset var result = [] />
		<cfset var temp = {} />
		<cfset var cols = arguments.query.columnList />

		<cfif arguments.lowercase>
			<cfset cols = lCase(cols) />
		</cfif>

		<cfloop query="arguments.query">
			<cfset temp = {} />
			<cfloop list="#cols#" index="col">
				<cfset temp[col] = arguments.query[col][arguments.query.currentRow] />
			</cfloop>
			<cfset arrayappend(result, temp) />
		</cfloop>

		<cfreturn result />
	</cffunction>

	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->

</cfcomponent>
