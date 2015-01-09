package
{

import core.IsoBox;
import core.IsoPoint;
import core.IsoTile;
import core.IsoUtils;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.MouseEvent;
import flash.geom.Point;

public class Main extends Sprite
{
    private var world:Sprite;
    public function Main()
    {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        world = new Sprite();
        world.x = stage.stageWidth / 2;
        world.y = 100;
        addChild(world);

        for (var i:int = 0; i < 20; i++)
        {
            for (var j:int = 0; j < 20; j++)
            {
                var tile:IsoTile = new IsoTile(20, 0xcccccc);
                tile.isoPosition = new IsoPoint(i * 20, 0, j * 20);
                world.addChild(tile);
            }
        }

        world.addEventListener(MouseEvent.CLICK, onWorldClick);
    }

    private function onWorldClick(event:MouseEvent):void
    {
        var box:IsoBox = new IsoBox(20, 0xd3d3d3, 20);
        var pos:IsoPoint = IsoUtils.screenToIso(new Point(world.mouseX, world.mouseY));
        pos.x = Math.round(pos.x / 20) * 20;
        pos.y = Math.round(pos.y / 20) * 20;
        pos.z = Math.round(pos.z / 20) * 20;
        box.isoPosition = pos;
        world.addChild(box);
    }

}
}
