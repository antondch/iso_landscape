/**
 * Created by Crazy Horse on 10.01.2015.
 */
package isoCore
{
public class IsoBox extends IsoTile
{
    public function IsoBox(size:Number, color:uint, height:Number)
    {
        super(size, color, height);
    }

    override public function set isoHeight(height:Number):void
    {
        super.isoHeight = height;
        draw();
    }

    override protected function draw():void
    {
        graphics.clear();
        var red:int = _color >> 16;
        var green:int = _color >> 8 & 0xff;
        var blue:int = _color & 0xff;

        var leftShadow:uint = (red * .5) << 16 |
                (green * .5) << 8 |
                (blue * .5);
        var rightShadow:uint = (red * .75) << 16 |
                (green * .75) << 8 |
                (blue * .75);

        var h:Number = _height * IsoUtils.Y_CALCULATED;

        if (1)//(_height >= 0)
        {
            graphics.beginFill(_color);
            graphics.lineStyle(0, 0, .5);
            graphics.moveTo(-_size, -h);
            graphics.lineTo(0, -_size * .5 - h);
            graphics.lineTo(_size, -h);
            graphics.lineTo(0, _size * .5 - h);
            graphics.lineTo(-_size, -h);
            graphics.endFill();

            graphics.beginFill(leftShadow);
            graphics.lineStyle(0, 0, .5);
            graphics.moveTo(-_size, -h);
            graphics.lineTo(0, _size * .5 - h);
            graphics.lineTo(0, _size * .5);
            graphics.lineTo(-_size, 0);
            graphics.lineTo(-_size, -h);
            graphics.endFill();

            graphics.beginFill(rightShadow);
            graphics.lineStyle(0, 0, .5);
            graphics.moveTo(_size, -h);
            graphics.lineTo(0, _size * .5 - h);
            graphics.lineTo(0, _size * .5);
            graphics.lineTo(_size, 0);
            graphics.lineTo(_size, -h);
            graphics.endFill();
//        } else
//        {
//            graphics.beginFill(_color);
//            graphics.lineStyle(0, 0, .5);
//            graphics.moveTo(-_size, -h);
//            graphics.lineTo(0, -_size * .5 - h);
//            graphics.lineTo(_size, -h);
//            graphics.lineTo(0, _size * .5 - h);
//            graphics.lineTo(-_size, -h);
//            graphics.endFill();
//
//            graphics.beginFill(rightShadow);
//            graphics.lineStyle(0, 0, .5);
//            graphics.moveTo(-_size, -h);
//            graphics.lineTo(0, -_size * .5 - h);
//            graphics.lineTo(0, -_size*0.5 );
//            graphics.lineTo(-_size, 0);
//            graphics.lineTo(-_size, -h);
//            graphics.endFill();
//
//            graphics.beginFill(leftShadow);
//            graphics.lineStyle(0, 0, .5);
//            graphics.moveTo(_size, -h);
//            graphics.lineTo(0, -_size * .5 - h);
//            graphics.lineTo(0, -_size * .5);
//            graphics.lineTo(_size, 0);
//            graphics.lineTo(_size, -h);
//            graphics.endFill();
//        }

        }
    }
}
}
