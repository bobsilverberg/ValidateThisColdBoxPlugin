<cfoutput>
<h1>Enquiry</h1>

<cfif rc.ValidationResult.hasErrors()>
	<div class="messagebox">
		The following problems were found with your form submission:
		<ul>
			<cfloop array="#rc.ValidationResult.getFailures()#" index="failure">
				<li>#failure.Message#</li>
			</cfloop>
		</ul>
	</div>
</cfif>

<form action="#Event.BuildLink( 'enquiry.send' )#" method="post">
	<table>
		<tr>
			<th>Firstname <cfif StructKeyExists( rc.RequiredFields, "firstname" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="firstname" id="firstname" value="#HtmlEditFormat( rc.Enquiry.getFirstname() )#" /> <cfif rc.ValidationResult.hasErrors( "firstname" )>Error!</cfif></td>
		</tr>
		<tr>
			<th>Surname <cfif StructKeyExists( rc.RequiredFields, "lastname" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="lastname" id="lastname" value="#HtmlEditFormat( rc.Enquiry.getLastname() )#" /> <cfif rc.ValidationResult.hasErrors( "lastname" )>Error!</cfif></td>
		</tr>
		<tr>
			<th>Email <cfif StructKeyExists( rc.RequiredFields, "email" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="email" id="email" value="#HtmlEditFormat( rc.Enquiry.getEmail() )#" /> <cfif rc.ValidationResult.hasErrors( "email" )>Error!</cfif></td>
		</tr>
		<tr>
			<th>Message <cfif StructKeyExists( rc.RequiredFields, "message" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="message" id="message" value="#HtmlEditFormat( rc.Enquiry.getMessage() )#" /> <cfif rc.ValidationResult.hasErrors( "message" )>Error!</cfif></td>
		</tr>
		<tr>
			<th>&nbsp;</th>
			<td>
				<input type="submit" name="send" id="send" value="send" />
			</td>
		</tr>
	</table>
</form>

</cfoutput>