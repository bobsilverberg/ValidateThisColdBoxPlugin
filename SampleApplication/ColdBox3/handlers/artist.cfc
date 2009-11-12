/**
* the artist handler
*/
component extends="model.abstract.AbstractHandler"
{

	/*
	-------------------------------------------------------------------------
	dependancy injection
	-------------------------------------------------------------------------
	*/
	property name="ArtistService" type="model:ArtistService" scope="instance";
	
	/*
	-------------------------------------------------------------------------
	public handlers
	-------------------------------------------------------------------------
	*/
	
	/**
	* I am the default event
	*/
	void function index( event ) 
	{
		var rc = event.getCollection();
		
		// get all artists as an array
		rc.artists = instance.ArtistService.getArtists();
		// set view
		arguments.Event.setView( "artist/index" );
	}
	
	/**
	* I delete artists
	*/
	void function delete( event ) 
	{
		var rc = event.getCollection();
		
		// delete the artist
		instance.ArtistService.deleteArtistById( rc.artistid );
		
		// save message to flash memory
		flash.put( "message", "Artist deleted" );
		
		// relocate
		setNextEvent( "artist.index" );
	}

	/**
	* I edit/add artists
	*/
	void function maintain( event ) 
	{
		var rc = arguments.Event.getCollection();
		
		// get artist by id. returns a new artist if id not found
		arguments.event.paramValue( "artistid", "" );
		rc.Artist = instance.ArtistService.getArtistById( rc.artistid );
		
		// need an empty validation result object for display
		rc.ValidationResult = instance.ArtistService.newValidationResult();
		
		// get required fields
		rc.RequiredFields = instance.ArtistService.getArtistRequiredFields();
				
		// set view
		arguments.Event.setView( "artist/form" );
	}

	/**
	* I save an artist
	*/
	void function save( event ) 
	{
		var rc = arguments.Event.getCollection();
		
		// note: using entityid instead of artistid so that populate() doesn't set the id to blank
		var rc.Artist = instance.ArtistService.getArtistById( rc.entityid );

		var SaveResult = instance.ArtistService.save( rc.Artist );
		
		if ( SaveResult.getIsSuccess() )
		{
			flash.put( "message", "Artist saved" );
			setNextEvent( "artist.index" );
		}
		else
		{
			rc.ValidationResult = SaveResult;
			rc.RequiredFields = instance.ArtistService.getArtistRequiredFields();
			
			arguments.Event.setView( "artist/form" );
		}
	
	}

}
