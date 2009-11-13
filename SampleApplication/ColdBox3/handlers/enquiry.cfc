<cfcomponent extends="model.abstract.AbstractHandler" hint="the enquiry handler">

	<!---
	-------------------------------------------------------------------------
	dependancy injection
	-------------------------------------------------------------------------
	--->
	<cfproperty name="FormService" type="model:FormService" scope="instance">
	
	<!---
	-------------------------------------------------------------------------
	public handlers
	-------------------------------------------------------------------------
	--->
	

	<cffunction name="index" returntype="void" output="false" hint="I am the default event">
		<cfargument name="event" required="true">
		<cfscript>
		var rc = arguments.Event.getCollection();

		rc.Enquiry = instance.FormService.newEnquiry();
		
		// need an empty validation result object for display
		rc.ValidationResult = instance.FormService.newValidationResult();
		
		// get required fields
		rc.RequiredFields = instance.FormService.getEnquiryRequiredFields();
		
		// set view
		arguments.Event.setView( "enquiry/index" );
		</cfscript>
	</cffunction>

	<cffunction name="send" returntype="void" output="false" hint="I send an enquiry">
		<cfargument name="event" required="true">
		<cfscript>

		var rc = arguments.Event.getCollection();

		var SendResult = instance.FormService.sendEnquiry( rc );
		
		if ( SendResult.getIsSuccess() )
		{
			flash.put( "message", "Enquiry sent" );
			setNextEvent( "artist.index" );
		}
		else
		{
			rc.ValidationResult = SendResult;
			rc.Enquiry = rc.ValidationResult.getTheObject();
			rc.RequiredFields = instance.FormService.getEnquiryRequiredFields();
			
			arguments.Event.setView( "enquiry/index" );
		}
		</cfscript>
	</cffunction>

</cfcomponent>
