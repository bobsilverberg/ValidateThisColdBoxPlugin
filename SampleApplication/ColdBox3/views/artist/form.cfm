<cfoutput>
<h1>User Maintain</h1>

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

<form action="#Event.BuildLink( 'artist.save' )#" method="post">
	<table>
		<tr>
			<th>Firstname <cfif StructKeyExists( rc.RequiredFields, "firstname" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="firstname" id="firstname" value="#HtmlEditFormat( rc.Artist.getFirstname() )#" /> <cfif rc.ValidationResult.hasErrors( "firstname" )>Error!</cfif></td>
		</tr>
		<tr>
			<th>Surname <cfif StructKeyExists( rc.RequiredFields, "lastname" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="lastname" id="lastname" value="#HtmlEditFormat( rc.Artist.getLastname() )#" /> <cfif rc.ValidationResult.hasErrors( "lastname" )>Error!</cfif></td>
		</tr>
		<tr>
			<th>Address <cfif StructKeyExists( rc.RequiredFields, "address" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="address" id="address" value="#HtmlEditFormat( rc.Artist.getAddress() )#" /> <cfif rc.ValidationResult.hasErrors( "address" )>Error!</cfif></td>
		</tr>
		<tr>
			<th>City <cfif StructKeyExists( rc.RequiredFields, "city" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="city" id="city" value="#HtmlEditFormat( rc.Artist.getCity() )#" /> <cfif rc.ValidationResult.hasErrors( "city" )>Error!</cfif></td>
		</tr>
		<tr>
			<th>State <cfif StructKeyExists( rc.RequiredFields, "state" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="state" id="state" value="#HtmlEditFormat( rc.Artist.getState() )#" /> <cfif rc.ValidationResult.hasErrors( "state" )>Error!</cfif></td>
		</tr>
		<tr>
			<th>PostalCode <cfif StructKeyExists( rc.RequiredFields, "postalcode" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="postalcode" id="postalcode" value="#HtmlEditFormat( rc.Artist.getPostalCode() )#" /> <cfif rc.ValidationResult.hasErrors( "postalcode" )>Error!</cfif></td>
		</tr>
		<tr>
			<th>Email <cfif StructKeyExists( rc.RequiredFields, "email" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="email" id="email" value="#HtmlEditFormat( rc.Artist.getEmail() )#" /> <cfif rc.ValidationResult.hasErrors( "email" )>Error!</cfif></td>
		</tr>
		<tr>
			<th>Phone <cfif StructKeyExists( rc.RequiredFields, "phone" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="phone" id="phone" value="#HtmlEditFormat( rc.Artist.getPhone() )#" /> <cfif rc.ValidationResult.hasErrors( "phone" )>Error!</cfif></td>
		</tr>
		<tr>
			<th <cfif rc.ValidationResult.hasErrors( "fax" )>Error!</cfif>>Fax <cfif StructKeyExists( rc.RequiredFields, "fax" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="fax" id="fax" value="#HtmlEditFormat( rc.Artist.getFax() )#" /></td>
		</tr>
		<tr>
			<th>Password <cfif StructKeyExists( rc.RequiredFields, "password" )><span class="required">*</span></cfif></th>
			<td><input type="text" name="password" id="password" value="#HtmlEditFormat( rc.Artist.getPassword() )#" /> <cfif rc.ValidationResult.hasErrors( "password" )>Error!</cfif></td>
		</tr>
		<tr>
			<th>&nbsp;</th>
			<td>
				<input type="submit" name="save" id="save" value="save" />
				<input type="hidden" name="entityid" id="entityid" value="#HtmlEditFormat( rc.Artist.getArtistId() )#" />
			</td>
		</tr>
	</table>
</form>

</cfoutput>