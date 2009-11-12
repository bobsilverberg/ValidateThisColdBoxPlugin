component extends="model.abstract.AbstractService" singleton="true"
{
	/*
	---------------------------------------------------------------------------
	constructor
	---------------------------------------------------------------------------
	*/
	ArtistService function init()
	{
		super.init();
		return this;
	}

	/*
	---------------------------------------------------------------------------
	public
	---------------------------------------------------------------------------
	*/
	
	/**
	* returns an Artist by id, if the id is not found a new Artist is returned
	* @param1 the unique id
	*/
	Artist function getArtistById( required id )
	{
		return getById( 'Artist', arguments.id );
	}
	
	/**
	* returns a struct of required properties
	*/
	struct function getArtistRequiredFields()
	{
		return getRequiredFields( 'Artist' );
	}

	/**
	* returns an array of artists
	*/	
	array function getArtists()
	{
		return findByfilter( 'Artist', {}, "lastname,firstname" );
	}

	/**
	* delete an artist by id
	* @param1 the unique id
	*/	
	boolean function deleteArtistById( required id )
	{
		return deleteById( 'Artist', arguments.id );
	}
	
}
