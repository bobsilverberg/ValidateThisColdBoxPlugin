<cfcomponent extends="model.abstract.AbstractService" singleton="true" hint="I am a facade for the form package. Note the singleton attribute which is used by ColdBox">

	<!---
	-------------------------------------------------------------------------
	dependancy injection
	-------------------------------------------------------------------------
	--->
	<cfproperty name="MailService" type="coldbox:plugin:MailService" scope="instance">

	<!---
	------------------------------------------------------------
	constructor
	------------------------------------------------------------
	--->

	<cfset instance = {}>

	<cffunction name="init" returntype="FormService" output="false">
		<cfscript>
		super.init();
		return this;
		</cfscript>
	</cffunction>

	<!---
	---------------------------------------------------------------------------
	public
	---------------------------------------------------------------------------
	--->

	<cffunction name="getEnquiryRequiredFields" returntype="struct" output="false" hint="returns a struct of required properties">
		<cfscript>
		/// path from model root
		return getRequiredFields( 'form/Enquiry' );
		</cfscript>
	</cffunction>
	
	<cffunction name="newEnquiry" returntype="Enquiry" output="false" hint="returns an new Enquiry">
		<cfscript>
		return new model.form.Enquiry();
		</cfscript>
	</cffunction>
	
	<cffunction name="sendEnquiry" returntype="ValidateThis.util.Result" output="false" hint="returns an new Enquiry">
		<cfargument name="params" type="struct" required="true" hint="I am typically the form collection">
		<cfscript>
		var ValidatorResult = "";
		var Enquiry = newEnquiry();
		var Email = instance.MailService.newMail();
		
		// populate model from request collection
		instance.BeanFactory.populateModel( Enquiry );
		
		ValidatorResult = instance.ValidateThis.validate( theObject=Enquiry, objectType="form/Enquiry" );

		if ( ValidatorResult.getIsSuccess() )
		{
			email.setTo( "john.whish@crisp-ebusiness.com" );
			email.setFrom( "john.whish@crisp-ebusiness.com" );
			email.setSubject( "Enquiry send with the new ColdBox MailService" );
			email.setType( "html" );
			email.setBody( "<em>Hello!</em>" );
			
			// send it
			instance.MailService.send( email );
		}
		
		return ValidatorResult;
		</cfscript>
	</cffunction>
	
</cfcomponent>
