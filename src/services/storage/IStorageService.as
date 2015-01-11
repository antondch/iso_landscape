/**
 * Created by Crazy Horse on 11.01.2015.
 */
package services.storage
{
import flash.events.IEventDispatcher;

public interface IStorageService extends IEventDispatcher
{
    function save(data:String):void;
    function load():void;
}
}
