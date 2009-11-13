<cfcomponent output="false" hint="I am a non-persisted Enquiry object written with tags">
	
	<!---
	------------------------------------------------------------
	constructor
	------------------------------------------------------------
	--->

	<cfset instance = {}>

	<cffunction name="init" returntype="Enquiry" output="false">
		<cfscript>
		// set defaults
		setFirstname('');
		setLastname('');
		setEmail('');
		setMessage('');
		
		return this;
		</cfscript>
	</cffunction>

	<!---
	------------------------------------------------------------
	public
	------------------------------------------------------------
	--->

	<!--- getters --->
	<cffunction name="getEmail" returntype="string" output="false">
		<cfreturn instance.email>
	</cffunction>
	
	<cffunction name="getFirstname" returntype="string" output="false">
		<cfreturn instance.firstname>
	</cffunction>
	
	<cffunction name="getLastname" returntype="string" output="false">
		<cfreturn instance.lastname>
	</cffunction>

	<cffunction name="getMessage" returntype="string" output="false">
		<cfreturn instance.message>
	</cffunction>	

	<!--- setters --->
	
	<cffunction name="setEmail" returntype="void" output="false">
		<cfargument name="email" required="true">
		<cfset instance.email = arguments.email>
	</cffunction>
	
	<cffunction name="setFirstname" returntype="void" output="false">
		<cfargument name="firstname" required="true">
		<cfset instance.firstname = arguments.firstname>
	</cffunction>
	
	<cffunction name="setLastname" returntype="void" output="false">
		<cfargument name="lastname" required="true">
		<cfset instance.lastname = arguments.lastname>
	</cffunction>
	
	<cffunction name="setMessage" returntype="void" output="false">
		<cfargument name="message" required="true">
		<cfset instance.message = arguments.message>
	</cffunction>

</cfcomponent>

