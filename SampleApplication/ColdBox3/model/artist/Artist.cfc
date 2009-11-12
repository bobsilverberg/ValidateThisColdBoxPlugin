/**
* I am a Artist Persisted Entity
* @output false
* @table ARTISTS
* @persistent true
*/
component
{	
	// identifier
	property name="ArtistID" fieldtype="id" generator="increment"; 
	
	// properties
	property name="Firstname";
	property name="Lastname";
	property name="Address";
	property name="City";
	property name="State";
	property name="PostalCode";
	property name="Email";
	property name="Phone";
	property name="Fax";
	property name="Password" column="ThePassword";
	
	/* one artist can have many... */

	/* return an array of Art objects */
	property name="Art" fieldtype="one-to-many" cfc="Art" fkcolumn="ArtistID" type="array" orderby="Price Asc";
	
	/* if we wanted to return a struct of Art objects we'd use this syntax */
	// property name="Art" fieldtype="one-to-many" cfc="Art" fkcolumn="ArtistID" type="struct" structkeycolumn="ArtID" orderby="Price Asc";

	/**
	* I return the number of itemd of art associated with this Artist
	* @output false
	*/
	public numeric function getArtCount()
	{
		if ( this.hasArt() )
		{
			return ArrayLen( this.getArt() ); 
		}
		else 
		{
			return 0;
		}
	}
	
	/**
	* I return the number of items sold for this artist
	* @output false
	*/
	public numeric function getSoldItemsCount()
	{
		return ORMExecuteQuery( 
			"SELECT COUNT(*) FROM Art as ArtEntity WHERE ArtEntity.Artist.ArtistID=:ArtistID AND ArtEntity.IsSold=:IsSold", 
			{ ArtistID=this.getArtistID(), IsSold=True }
			, True );
	}
	
	/**
	* I return the number of itemd of art associated with this Artist
	* @output false
	*/
	public string function getFullname()
	{
		return this.getFirstName() & " " & this.getLastname();
	}

}