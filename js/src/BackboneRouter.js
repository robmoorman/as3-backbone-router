var BackboneRouter = {
	
	/**
	 * The ids of the flash objects as an <code>Array</code>.
	 */
	ids: null,
	
	/**
	 *
	 *
	 * @param ids
	 */
	initialize: function( ids )
	{
		// set the ids of the flash objects
		BackboneRouter.ids = ( typeof ids == "string" ) ? [ ids ] : ids;
	}
	
};