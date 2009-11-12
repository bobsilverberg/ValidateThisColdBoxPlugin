<cfoutput>
<h2><img src="includes/images/coldbox.png" class="middle" style="padding-right:10px" alt="ColdBox" /> #rc.welcomeMessage#</h2>

<div id="infobox">
<p>
    You are now running <strong>#getSetting("codename",1)# #getSetting("version",1)# (#getsetting("suffix",1)#)</strong>.
	Welcome to the next generation of ColdFusion applications.  You can now start building your application with ease, we already did the hard work
	for you.
</p>
<p>
	This is a sample application for <a href="http://www.silverwareconsulting.com/">Bob Silverberg's</a> <a href="http://www.validatethis.org/">ValidateThis!</a> validation framework using the ColdBox 3.0.0 Framework and ColdFusion 9 ORM.
</p>
<p>
	To find out more about ValidateThis! please visit <a href="http://www.validatethis.org/">http://www.validatethis.org/</a>
</p>
</div>

<table cellpadding="5" width="98%" align="center">
    <tr>
        <td valign="top">
            <h3>Start the demo</h3>
			<ul>
				<li><a href="#event.buildLink( 'artist' )#">Simple Form Validation</a></li>
			</ul>
        </td>
		<td valign="top" id="sidebar">
        	<h3>Docs Search</h3>
	    <ul class="links">
	        <li>
	            <h3>Links</h3>
	            <ul class="links">
	                <li>
	                    <a href="http://www.coldboxframework.com">ColdBox Site</a>
	                </li>
	                <li>
	                    <a href="http://www.validatethis.org/">Validate This Docs</a>
	                </li>
	            </ul>
	        </li>
			</ul>
		
		<div style="margin:auto;text-align:center">
			<img src="http://www.coldboxframework.com/includes/images/logos/poweredby.gif" alt="ColdBox" />
		</div>
    </td>
    </tr>
</table>
</cfoutput>