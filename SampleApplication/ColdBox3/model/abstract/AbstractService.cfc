/**
Abstract Service
*/
component
{

	/*
	---------------------------------------------------------------------------
	autowire
	---------------------------------------------------------------------------
	*/
	property name="BeanFactory" type="coldbox:plugin:BeanFactory" scope="instance";
	property name="ValidateThis" type="coldbox:myplugin:ValidateThisCBPlugin" scope="instance";


	/*
	---------------------------------------------------------------------------
	instance variables
	---------------------------------------------------------------------------
	*/
	instance = {};

	/*
	---------------------------------------------------------------------------
	constructor
	---------------------------------------------------------------------------
	*/
	any function init()
	{
		return this;
	}

	/*
	---------------------------------------------------------------------------
	public  methods
	---------------------------------------------------------------------------
	*/

	
	
	/**
	* validates, then inserts or updates a persisted entity (if valid)
	*/	
	ValidateThis.util.Result function save( required entity )
	{
		var ValidatorResult = "";
		
		transaction
		{
			instance.BeanFactory.populateModel( arguments.entity );
			ValidatorResult = instance.ValidateThis.validate( theObject=arguments.entity );
			
			if ( ValidatorResult.getIsSuccess() )
			{
				// Save entity and commit transaction
				EntitySave( arguments.entity );
				transactionCommit();
			}
			else
			{
				// rollback setter calls
				transactionRollback();
			}
		}
		
		return ValidatorResult;
	}
	
	/**
	* deletes a persisted entity
	*/	
	void function delete( required entity )
	{
		transaction
		{
			EntityDelete( arguments.entity );
		}
	}
	
	/**
	* returns a new validation result
	*/	
	ValidateThis.util.Result function newValidationResult()
	{
		return instance.ValidateThis.newResult();
	}
	
	
	/*
	---------------------------------------------------------------------------
	private methods
	---------------------------------------------------------------------------
	*/
	
	/**
	* helper method to delete an entity by id
	*/
	private boolean function deleteById( required entityname, required id )
	{
		var deleted = false;
		transaction{
			var entity = EntityLoadByPK( arguments.entityname, arguments.id );
			if ( !IsNull( entity ) )
			{
				EntityDelete( entity );
				deleted = true;
			}
		}
		
		return deleted;
	}
	
	/**
	* returns an array of entities matching the filter
	*/
	private array function findByfilter( required entityname, filter=StructNew(), sortorder="", options=StructNew() )
	{
		return EntityLoad( arguments.entityname, arguments.filter, arguments.sortorder, arguments.options );
	}
		
	/**
	* retrieves an entity by name and id
	*/	
	private any function getById( required entityname, id="" )
	{
		var result = "";
		if ( Len( arguments.id ) != 0 )
		{
			// id passed so retrieve
			result = EntityLoadByPK( arguments.entityname, arguments.id );
			if ( IsNull( result ) ) 
			{
				// not found
				result = new( arguments.entityname );
			}
		}
		else
		{
			result = new( arguments.entityname );
		}
		return result;
	}
	
	
	/**
	* return a struct of required fields for the named entity
	*/	
	private struct function getRequiredFields( required entityname )
	{
		return instance.ValidateThis.getRequiredFields( objectType=arguments.entityname );
	}
	
	/**
	* returns a new persisted entity
	*/	
	private any function new( required entityname )
	{
		return EntityNew( arguments.entityname );
	}
	
}