<cfcomponent displayname="arrayUtils" output="false" hint="Utility functions to manage arrays">	
	
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------>
	<!--- CONSTRUCTOR ------------------------------------------------------------------------------------------------------------------------------------------------------>
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------>
	<cffunction name="init" access="public" output="false" returntype="arrayUtils" hint="Pseudo-constructor">

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
	<cffunction name="checkArrayForPivotIndex" access="public" output="false" returntype="struct" displayname="Inspects specified array for a pivot index">
		<cfargument name="arrayToInspect"	type="array" 	required="true" default="" />

		<cfset var local = {} /><!--- Backward compatibility for CF versions prior to 10 --->
		<cfset var result = {} /><!--- Structure to hold result --->
		
		<cfset local.pivotIndex = 0 />
		
		<!--- OUTER loop round array --->
		<cfloop from="1" to="#arrayLen(arguments.arrayToInspect)#" index="local.indexOuterLoop">
		
			<cfset local.sumArrayLeftSide = 0 />
			<cfset local.sumArrayRightSide = 0 />
			
			<cfset local.indexInnerLoopLeftEnd = local.indexOuterLoop - 1 />
			<cfset local.indexInnerLoopRightStart = local.indexOuterLoop + 1 />
			
			<!--- INNER loop in array but only LEFT side of current index --->
			<cfif local.indexOuterLoop GT 1>
				<cfloop from="1" to="#local.indexInnerLoopLeftEnd#" index="local.indexInnerLoopLeft">
					<cfset local.sumArrayLeftSide = local.sumArrayLeftSide + arguments.arrayToInspect[local.indexInnerLoopLeft] />
				</cfloop>
			</cfif>
			
			<!--- INNER loop in array but only RIGHT side of current index --->
			<cfif local.indexOuterLoop LT arrayLen(arguments.arrayToInspect)>
				<cfloop from="#local.indexInnerLoopRightStart#" to="#arrayLen(arguments.arrayToInspect)#" index="local.indexInnerLoopRight">
					<cfset local.sumArrayRightSide = local.sumArrayRightSide + arguments.arrayToInspect[local.indexInnerLoopRight] />
				</cfloop>
			</cfif>
			
			<!--- Now compare calculated values to possible "pivot" index (i.e. index of outer loop) --->
			<cfif local.sumArrayLeftSide EQ local.sumArrayRightSide>
				<cfset result.pivotIndex = local.indexOuterLoop />
				<cfset result.pivotIndexValue = arguments.arrayToInspect[local.indexOuterLoop] />
				<cfset result.pivotValue = local.sumArrayLeftSide />
				
				<!--- Found pivot index, no need to continue looping --->
				<cfbreak>
			<cfelse>
				<cfset result.pivotIndex = 0 />
				<cfset result.pivotIndexValue = 0 />
				<cfset result.pivotValue = 0 />
			</cfif>
		</cfloop>
	
		<cfreturn result/>

	</cffunction>

	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!--- ------------------------------------------------------------------------------------------------------------------------------------------------------------------->

</cfcomponent>
