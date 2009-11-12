<cfcomponent output="false">
<!--- APPLICATION CFC PROPERTIES --->
<cfset this.name = "UnitTestSuite" & hash(getCurrentTemplatePath())> 
<cfset this.sessionManagement = true>
<cfset this.sessionTimeout = createTimeSpan(0,0,30,0)>
<cfset this.setClientCookies = true>
</cfcomponent>