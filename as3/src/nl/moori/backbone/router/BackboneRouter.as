package nl.moori.backbone.router
{
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.external.ExternalInterface;

	public class BackboneRouter
	{
		/**
		 * 
		 */
		[Event( name="initialized", type="nl.moori.backbone.router.BackboneRouterEvent" )]
		
		/**
		 * 
		 */
		[Event( name="stateChanged", type="nl.moori.backbone.router.BackboneRouterEvent" )]
		
		private static var _eventDispatcher: EventDispatcher = new EventDispatcher;
		private static var _initializer: Boolean = initialize();
		private static var _state: State;
		
		/**
		 * @constructor
		 */
		public function BackboneRouter()
		{
			throw new IllegalOperationError( "BackboneRouter can't be instantiated!" );
		}
		
		/**
		 * 
		 * 
		 * @param type
		 * @param listener
		 * @param useCapture
		 * @param priority
		 * @param useWeakReference
		 */
		public static function addEventListener( type: String, listener: Function, useCapture: Boolean = false, priority: int = 0, useWeakReference: Boolean = false ): void
		{
			_eventDispatcher.addEventListener( type, listener, useCapture, priority, useWeakReference );
		}
		
		/**
		 * 
		 * 
		 * @param event
		 * @return 
		 */
		public static function dispatchEvent( event: Event ): Boolean
		{
			return _eventDispatcher.dispatchEvent( event );
		}
		
		/**
		 * 
		 * 
		 * @param type
		 * @return 
		 */
		public static function hasEventListener( type: String ): Boolean
		{
			return _eventDispatcher.hasEventListener( type );
		}
		
		/**
		 * 
		 * 
		 * @param type
		 * @param listener
		 * @param useCapture
		 */
		public static function removeEventListener( type: String, listener: Function, useCapture: Boolean = false ): void
		{
			_eventDispatcher.removeEventListener( type, listener, useCapture );
		}
		
		/**
		 * 
		 * 
		 * @return 
		 */
		public static function willTrigger( type: String ): Boolean
		{
			return _eventDispatcher.willTrigger( type );
		}
		
		/**
		 * 
		 * 
		 * @return 
		 */
		private static function initialize(): Boolean
		{
			if( ExternalInterface.available ) {
				ExternalInterface.addCallback( "getState", onGetState );
				ExternalInterface.addCallback( "setState", onSetState );
			}
			else {
				throw new IllegalOperationError( "BackboneRouter is not allowed to communicate with the ExternalInterface!" );
			}
			
			return true;
		}
		
		/**
		 * 
		 * 
		 * @return 
		 */
		private static function onGetState(): Object
		{
			return _state.state;
		}
		
		/**
		 * 
		 * 
		 * @param path
		 * @param query
		 * @param state
		 */
		private static function onSetState( path: String, query: String, state: Object = null ): void
		{
			_state = new State( path, query, state );
			
			_eventDispatcher.dispatchEvent( new BackboneRouterEvent( BackboneRouterEvent.STATE_CHANGED, _state ));
		}
	}
}

