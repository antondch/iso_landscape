/**
 * Created by Crazy Horse on 11.01.2015.
 */
package services.storage
{
import flash.events.Event;

public class DataEvent extends Event
{
    public static const SAVE_COMPLETE:String = "save_complete";
    public static const LOAD_COMPLETE:String = "load_complete";
    public static const ERROR:String = "error";
    public var message:String;
    public var data:String;

    public function DataEvent(type:String, message:String, data:String = null, bubbles:Boolean = false, cancelable:Boolean = false)
    {
        super(type, bubbles, cancelable);
        this.message = message;
        this.data = message;
    }

    override public function clone():Event
    {
        return new DataEvent(type, message, data, bubbles, cancelable);
    }
}
}
