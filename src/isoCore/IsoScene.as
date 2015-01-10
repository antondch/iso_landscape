/**
 * Created by Crazy Horse on 10.01.2015.
 */
package isoCore
{
import flash.display.Sprite;

public class IsoScene extends Sprite
{
    private var _objects:Array;
    private var _scene:Sprite;

    public function IsoScene()
    {
        _scene = new Sprite();
        addChild(_scene);

        _objects = new Array();
    }

    public function add2Scene(child:IsoObject):IsoObject
    {
        _scene.addChild(child);
        _objects.push(child);
        sort();
        return child;
    }

    public function sort():void
    {
        _objects.sortOn("depth", Array.NUMERIC);
        for (var i:int = 0; i < _objects.length; i++)
        {
            _scene.setChildIndex(_objects[i], i);
        }
    }

    public function get objects():Array
    {
        return _objects;
    }
}
}
