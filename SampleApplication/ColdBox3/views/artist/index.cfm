<cfoutput>
<h1>User List</h1>

<cfif flash.exists( "message" )>
<div class="messagebox">#flash.get( "message" )#</div>
</cfif>

<p><a href="#Event.BuildLink( 'artist.maintain' )#">Add</a></p>

<table>
	<thead>
		<tr>
			<th>Whom</th>
			<th>Has Art?</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
<cfloop array="#rc.artists#" index="Artist">
		<tr>
			<th>#Artist.getFullname()#</a></th>
			<th>#Artist.hasArt()#</a></th>
			<td>
				<a href="#Event.BuildLink( 'artist.maintain' & ".artistid." & Artist.getArtistID() )#">Edit</a> | 
				<a href="#Event.BuildLink( 'artist.delete' & ".artistid." & Artist.getArtistID() )#">Delete</a>
			</td>
		</tr>
</cfloop>
	</tbody>
</table>

</cfoutput>
