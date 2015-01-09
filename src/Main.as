package
{

import isoCore.IsoBox;
import isoCore.IsoPoint;
import isoCore.IsoScene;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.MouseEvent;

public class Main extends Sprite
{
    private var world:IsoScene;
    private var mouseHoldY:Number;
    private var resizedBox:IsoBox;
    public static const MAX_HEiGHT:int = 300;
    public static const DEFAULT_HEIGHT:int = 150;
    public static const MIN_HEiGHT:int = 0;

    public function Main()
    {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        world = new IsoScene();
        world.x = stage.stageWidth / 2;
        world.y = 300;
        addChild(world);

        for (var i:int = 0; i < 10; i++)
        {
            for (var j:int = 0; j < 10; j++)
            {
                var tile:IsoBox = new IsoBox(20, 0xcccccc, DEFAULT_HEIGHT);
                tile.isoPosition = new IsoPoint(i * 20, 0, j * 20);
                world.add2Scene(tile);
            }
        }
        stage.addEventListener(MouseEvent.MOUSE_DOWN, registerResizeHandlers);
    }

    private function registerResizeHandlers(event:MouseEvent):void
    {
        if (event.target is IsoBox)
        {
            resizedBox = event.target as IsoBox;
            mouseHoldY = stage.mouseY;
            stage.addEventListener(MouseEvent.MOUSE_UP, uregisterResizeHandlers);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);

        }
    }

    private function uregisterResizeHandlers(event:MouseEvent):void
    {
        stage.removeEventListener(MouseEvent.MOUSE_UP, uregisterResizeHandlers);
        stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
    }

    private function mouseMoveHandler(event:MouseEvent):void
    {
        if (resizedBox.isoHeight + mouseHoldY - stage.mouseY > MAX_HEiGHT)
        {
            resizedBox.isoHeight = MAX_HEiGHT;
        } else if (resizedBox.isoHeight + mouseHoldY - stage.mouseY < MIN_HEiGHT)
        {
            resizedBox.isoHeight = MIN_HEiGHT;

        } else
        {
            resizedBox.isoHeight += mouseHoldY - stage.mouseY;
        }
        mouseHoldY = stage.mouseY;
    }
}
}
