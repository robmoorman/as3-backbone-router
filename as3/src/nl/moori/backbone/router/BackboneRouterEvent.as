package nl.moori.backbone.router
{
	import flash.events.Event;

	/**
	 *
	 *  
	 * @author r.moorman
	 */
	public class BackboneRouterEvent extends Event
	{
		/**
		 * 
		 */
		public static const INITIALIZED: String = "initialized";
		
		/**
		 * 
		 */
		public static const STATE_CHANGED: String = "stateChanged";
		
		/**
		 * 
		 */
		public function get state(): State {
			return _state;
		}
		
		private var _state: State;
		
		/**
		 * 
		 * 
		 * @param type
		 * @param state
		 * @param bubbles
		 * @param cancelable
		 */
		public function BackboneRouterEvent( type: String, state: State = null, bubbles: Boolean = false, cancelable: Boolean = false )
		{
			super( type, bubbles, cancelable );
			
			_state = state;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			return new BackboneRouterEvent( type, state, bubbles, cancelable );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function toString():String
		{
			return "[BackboneRouterEvent: type='" + type + "']";
		}
	}
}

