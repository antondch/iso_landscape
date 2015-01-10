/**
 * Created by Crazy Horse on 11.01.2015.
 */
package landscape
{
import flash.events.Event;
import flash.events.MouseEvent;

import isoCore.IsoBox;
import isoCore.IsoPoint;

public class LandscapeController
{
    private var view:LandscapeView;
    private var model:LandscapeModel;
    private var config:LandscapeConfig;
    private var mouseHoldY:Number;
    private var currentBox:IsoBox;

    public function LandscapeController(view:LandscapeView, model:LandscapeModel, config:LandscapeConfig)
    {
        this.view = view;
        this.model = model;
        this.config = config;
        drawTiles(config.ROWS_COUNT, config.COLUMNS_COUNT);
        model.addEventListener(LandscapeModel.LANDSCAPE_CHANGED_EVENT, changeLandscapeView);
    }

    private function changeLandscapeView(event:Event = null):void
    {
        for (var i:int = 0; i < config.ROWS_COUNT; i++)
        {
            for (var j:int = 0; j < config.COLUMNS_COUNT; j++)
            {
                view.getBox(i + j).isoHeight = model.getHeight(i + j);
            }
        }
    }

    private function drawTiles(rows:int, columns:int):void
    {
        for (var i:int = 0; i < rows; i++)
        {
            for (var j:int = 0; j < columns; j++)
            {
                var tile:IsoBox = new IsoBox(config.BOX_SIZE, config.TILES_COLOR, config.ZERO_HEIGHT);
                tile.place.x = j;
                tile.place.y = i;
                tile.isoPosition = new IsoPoint(i * config.BOX_SIZE, 0, j * config.BOX_SIZE);
                tile.isoHeight = model.getHeight(i + j);
                view.add2Scene(tile);
            }
        }
        view.addEventListener(MouseEvent.MOUSE_DOWN, registerResizeHandlers);
    }

    private function registerResizeHandlers(event:MouseEvent):void
    {
        if (event.target is IsoBox)
        {
            currentBox = event.target as IsoBox;
            mouseHoldY = view.stage.mouseY;
            view.addEventListener(MouseEvent.MOUSE_UP, uregisterResizeHandlers);
            view.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);

        }
    }

    private function uregisterResizeHandlers(event:MouseEvent):void
    {
        view.removeEventListener(MouseEvent.MOUSE_UP, uregisterResizeHandlers);
        view.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        model.setHeight(view.getBoxPosition(currentBox), currentBox.isoHeight);
    }

    private function mouseMoveHandler(event:MouseEvent):void
    {
        if (currentBox.isoHeight + mouseHoldY - view.stage.mouseY > config.MAX_HEiGHT)
        {
            currentBox.isoHeight = config.MAX_HEiGHT;
        } else if (currentBox.isoHeight + mouseHoldY - view.stage.mouseY < config.MIN_HEiGHT)
        {
            currentBox.isoHeight = config.MIN_HEiGHT;

        } else
        {
            currentBox.isoHeight += mouseHoldY - view.stage.mouseY;
        }
        mouseHoldY = view.stage.mouseY;
    }

}
}
