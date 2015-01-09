/**
 * Created by Crazy Horse on 09.01.2015.
 */
package isoCore
{
import flash.display.Sprite;
import flash.geom.Point;
import flash.geom.Rectangle;

public class IsoObject extends Sprite
{

    protected var _isoPosition:IsoPoint;
    protected var _size:Number;

    public function IsoObject(size:Number)
    {
        _size = size;
        _isoPosition = new IsoPoint();
        updateScreenPosition();
    }

    protected function updateScreenPosition():void
    {
        var screenPos:Point = IsoUtils.isoToScreen(_isoPosition);
        super.x = screenPos.x;
        super.y = screenPos.y;
    }

    public function set isoX(value:Number):void
    {
        _isoPosition.x = value;
        updateScreenPosition();
    }

    public function get isoX():Number
    {
        return _isoPosition.x;
    }

    public function set isoY(value:Number):void
    {
        _isoPosition.y = value;
        updateScreenPosition();
    }

    public function get isoY():Number
    {
        return _isoPosition.y;
    }

    public function set isoZ(value:Number):void
    {
        _isoPosition.z = value;
        updateScreenPosition();
    }

    public function get isoZ():Number
    {
        return _isoPosition.z;
    }

    public function set isoPosition(value:IsoPoint):void
    {
        _isoPosition = value;
        updateScreenPosition();
    }

    public function get isoPosition():IsoPoint
    {
        return _isoPosition;
    }

    public function get depth():Number
    {
        return (_isoPosition.x + _isoPosition.z) * .866 - _isoPosition.y * .707;
    }
    public function get size():Number
    {
        return _size;
    }

    public function get bounds():Rectangle
    {
        return new Rectangle(isoX - size / 2, isoZ - size / 2, size, size);
    }
}
}
