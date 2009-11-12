<cfcomponent hint="I am an abstract entity" extends="model.abstract.BaseComponent" output="false">
	<!---
	========================================================================================
	Purpose: Abstract Entity
	Created By: John Whish
	---------------------------------------------------------------------------------------
	Repository path:	$HeadURL$
	Last committed: 	$Revision$
	Last changed by:	$Author$
	Last changed date:	$Date$
	========================================================================================
	--->

	<cffunction name="init" access="public" returntype="component" hint="I return this" output="false">
		<cfscript>
		return this;
		</cfscript>
	</cffunction>
	
	<!---
	=======================================================================================
	Public
	=======================================================================================
	--->
	<cffunction name="getEntityName" access="public" returntype="string" hint="I return a non-persisted object" output="false">
		<cfscript>
		return ORMGetSessionFactory().getClassMetadata( getClassName() ).getEntityName();
		</cfscript>
	</cffunction>
	
	<!---
	=======================================================================================
	Private
	=======================================================================================
	--->
</cfcomponent>