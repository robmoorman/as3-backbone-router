package nl.moori.backbone.router
{
	import flash.net.URLVariables;

	public class State
	{
		/**
		 * 
		 */
		public function get path(): String {
			return _path;
		}
		
		/**
		 * 
		 */
		public function get query(): String {
			return _query;
		}
		
		/**
		 * 
		 */
		public function get state(): Object {
			return _state;
		}
		
		private var _path: String;
		private var _pathNames: Array;
		private var _query: String;
		private var _data: URLVariables;
		private var _state: Object;
		
		/**
		 * 
		 * 
		 * @param path
		 * @param query
		 * @param state
		 */
		public function State( path: String, query: String, state: Object = null )
		{
			_path = path;
			_pathNames = getPathNames( path );
			_query = query;
			_data = getData( query );
			_state = state || {};
		}
		
		/**
		 * 
		 * 
		 * @param path
		 * @return 
		 */
		private function getPathNames( path: String ): Array
		{
			_pathNames = [];
			
			for each( var value: Object in path.split( "/" )) {
				if( value && typeof value == "string" && ( value as String ).length ) {
					_pathNames.push( value.toString());
				}
			}
			
			return _pathNames;
		}
		
		/**
		 * 
		 * 
		 * @param query
		 * @return 
		 */
		private function getData( query: String ): URLVariables
		{
			return new URLVariables( query );
		}
		
		/**
		 * 
		 */
		public function toString(): String
		{
			return "[State: path='" + path + "', query='" + query + "']";
		}
	}
}