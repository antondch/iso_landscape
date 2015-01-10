/**
 * Created by Crazy Horse on 10.01.2015.
 */
package landscape
{
import flash.events.Event;
import flash.events.EventDispatcher;

public class LandscapeModel extends EventDispatcher
{
    private var landscapes:Vector.<Vector.<int>>;
    private var _currentLandscape:Vector.<int>;
    private var tilesCount:int;
    private var maxHeight:int;
    private var minHeight:int;
    private var zeroHeight:int;
    private var _landScapeChangedEvent:Event = new Event(LANDSCAPE_CHANGED_EVENT);
    private static var instance:LandscapeModel;

    public static const LANDSCAPE_CHANGED_EVENT:String = "landscape_changed_event";


    public function LandscapeModel(tilesCount:int, maxHeight:int, minHeight:int, zeroHeight:int):void
    {
        if (!instance)
        {
            this.tilesCount = tilesCount;
            this.maxHeight = maxHeight;
            this.minHeight = minHeight;
            this.zeroHeight = zeroHeight;
            landscapes = new Vector.<Vector.<int>>();
            instance = this;
            changeCurrentLandscape(0);
        } else
        {
            throw new Error("This is a singletone class. Use getInstance static method.");
        }
    }

    public static function getInstance():LandscapeModel
    {
        if (instance)
        {
            return instance;
        } else
        {
            throw new Error("This class must be initialized with constructor, before getInstance() method can be used. Use LandscapeModel constructor.");
        }
    }

    public function changeCurrentLandscape(id:int):void
    {
        if (id > landscapes.length)
        {
            throw new ArgumentError(this + ": illegal landscape id");
        }
        if (id == landscapes.length)
        {
            landscapes[id] = new Vector.<int>(tilesCount);
            _currentLandscape = landscapes[id];
            for (var i:int = tilesCount - 1; i >= 0; i--)
            {
                _currentLandscape[i] = zeroHeight;
            }
        } else
        {
            _currentLandscape = landscapes[id];
        }
        dispatchEvent(_landScapeChangedEvent);
    }

    public function getHeight(boxPosition:int):int
    {
        return _currentLandscape[boxPosition];
    }

    public function setHeight(boxPosition:int, height:int):void
    {
        _currentLandscape[boxPosition] = height;
//        changeCurrentLandscape(0);//test
    }

}
}
