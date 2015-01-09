package
{

import core.IsoBox;
import core.IsoPoint;
import core.IsoScene;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.IEventDispatcher;
import flash.events.MouseEvent;

public class Main extends Sprite
{
    private var world:IsoScene;
    private var mouseHoldY:Number;
    private var resizedBox:IsoBox;

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
        stage.addEventListener(MouseEvent.MOUSE_DOWN, registerResizeHandlers);
    }

    private function registerResizeHandlers(event:MouseEvent):void
    {
        if(event.target is IsoBox)
        {
            resizedBox = event.target as IsoBox;
            mouseHoldY = stage.mouseY;
            stage.addEventListener(MouseEvent.MOUSE_UP, uregisterResizeHandlers);
            resizedBox.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);

        }
    }

    private function uregisterResizeHandlers(event:MouseEvent):void
    {
            stage.removeEventListener(MouseEvent.MOUSE_UP, uregisterResizeHandlers);
            resizedBox.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
    }

    private function mouseMoveHandler(event:MouseEvent):void
    {
        resizedBox.isoHeight+= mouseHoldY -stage.mouseY;
        mouseHoldY = stage.mouseY;
    }
}
}
