package
{

import core.IsoBox;
import core.IsoPoint;
import core.IsoScene;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.MouseEvent;

public class Main extends Sprite
{
    private var world:IsoScene;
    public function Main()
    {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        world = new IsoScene();
        world.x = stage.stageWidth / 2;
        world.y = 100;
        addChild(world);

        for(var i:int = 0; i < 20; i++)
        {
            for(var j:int = 0; j < 20; j++)
            {
                var tile:IsoBox = new IsoBox(20, 0xcccccc,0);
                tile.isoPosition = new IsoPoint(i * 20, 0, j * 20);
                world.add2Scene(tile);
            }
        }
        stage.addEventListener(MouseEvent.CLICK, onWorldClick);
    }

    private function onWorldClick(event:MouseEvent):void
    {
        if(event.target is IsoBox)
        {
            var box:IsoBox = event.target as IsoBox;
            box.isoHeight +=5;
        }
    }

}
}
