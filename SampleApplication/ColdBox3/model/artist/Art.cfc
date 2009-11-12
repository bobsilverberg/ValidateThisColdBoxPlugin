/**
* I am a Art Persisted Entity
* @output false
* @table ART
* @persistent true
*/
component
{
	// identifier
	property name="ArtID" fieldtype="id" generator="native" ; 
		
	// properties
	property name="ArtName" ;
	property name="Description" ;
	property name="Price" ;
	property name="LargeImage" ;
	property name="IsSold" ;
	
	property name="Artist" fieldtype="many-to-one" fkcolumn="ArtistID" cfc="Artist";	
}