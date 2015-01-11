/**
 * Created by Crazy Horse on 11.01.2015.
 */
package ui
{
import flash.events.MouseEvent;

import landscape.LandscapeModel;

public class UIController
{
    private var view:UIView;
    private var model:LandscapeModel;
//    private var storageService:IStorageService;
    public function UIController(view:UIView, model:LandscapeModel/*, storage:IStorageService*/)
    {
        this.view = view;
        this.model = model;

        registerHandlers();
    }

    private function registerHandlers():void
    {
        view.landScape0Btn.addEventListener(MouseEvent.CLICK, btn0clickHandler);
        view.landScape1Btn.addEventListener(MouseEvent.CLICK, btn1clickHandler);
        view.landScape2Btn.addEventListener(MouseEvent.CLICK, btn2clickHandler);
    }

    private function btn0clickHandler(event:MouseEvent):void
    {
        model.changeCurrentLandscape(0);
    }

    private function btn1clickHandler(event:MouseEvent):void
    {
        model.changeCurrentLandscape(1);
    }

    private function btn2clickHandler(event:MouseEvent):void
    {
        model.changeCurrentLandscape(2);
    }
}
}
