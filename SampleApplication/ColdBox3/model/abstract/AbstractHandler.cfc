/**
* I am an abstract handler
*/
component extends="coldbox.system.EventHandler"
{

	/**
	* I am a dynamic finder. Useful for dynamically creating getters for instance variables.
	* For example: 
	*	getFooService will call getModel( "FooService ")
	*	getFooPlugin will call getPlugin( "Foo" )
	*/
	public any function onMissingMethod( required string MissingMethodName, required struct MissingMethodArguments )
	{
		var methodtype = Left( arguments.MissingMethodName, 3 );
		var requested = Replace( arguments.MissingMethodName, methodtype, "" );
		var result = "";
		
		switch ( methodtype )
		{
			case "get":
				if ( StructKeyExists( instance, requested ) )
				{
					// defined with cfproperty so just return value
					result = instance[ requested ];
				}
				else
				{
					// not defined with cfproperty
					if ( ReFindNoCase( "service$", requested ) != 0 )
					{
						// requesting a service object so get it from the model
						result = getModel( requested );
					}
					else if ( ReFindNoCase( "plugin$", requested ) != 0 )
					{
						// requesting a plugin object so get it from the plugins
						result = getPlugin( requested, StructCount( arguments.MissingMethodArguments ) != 0 );
					}
					else
					{
						throw( type='AbstractHandler.onMissingMethod', message='Unknown variable #requested#', detail='The onMissingMethod can not find a value to return' );
					}
				}					
				break;
			default:
				throw( type='AbstractHandler.onMissingMethod', message='Unknown method #arguments.MissingMethodName#', detail='The method #arguments.MissingMethodName# does not exist' );
		}
		return result;
	}
}
