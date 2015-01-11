/**
 * Created by Crazy Horse on 11.01.2015.
 */
package ui
{
import flash.events.MouseEvent;

import landscape.LandscapeModel;

import logger.Logger;

import services.storage.DataEvent;

import services.storage.IStorageService;

import services.storage.LandscapeEncoder;

public class UIController
{
    private var view:UIView;
    private var model:LandscapeModel;
    private var encoder:LandscapeEncoder;
    private var storageService:IStorageService;

    public function UIController(view:UIView, model:LandscapeModel, encoder:LandscapeEncoder, storageService:IStorageService)
    {
        this.view = view;
        this.model = model;
        this.encoder = encoder;
        this.storageService = storageService;
        registerHandlers();
    }

    private function registerHandlers():void
    {
        view.landScape0Btn.addEventListener(MouseEvent.CLICK, btn0clickHandler);
        view.landScape1Btn.addEventListener(MouseEvent.CLICK, btn1clickHandler);
        view.landScape2Btn.addEventListener(MouseEvent.CLICK, btn2clickHandler);

        view.exportBtn.addEventListener(MouseEvent.CLICK, exportClickHandler);
        view.importBtn.addEventListener(MouseEvent.CLICK, importClickHandler);

        storageService.addEventListener(DataEvent.SAVE_COMPLETE, storageService_saveCompleteHandler);
        storageService.addEventListener(DataEvent.LOAD_COMPLETE, storageService_loadCompleteHandler);
        storageService.addEventListener(DataEvent.ERROR, storageService_errorHandler);
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

    private function exportClickHandler(event:MouseEvent):void
    {
        storageService.save(encoder.encode(model.currentLandscape));
    }

    private function importClickHandler(event:MouseEvent):void
    {
        storageService.load();
    }

    private function storageService_loadCompleteHandler(event:DataEvent):void
    {
        Logger.log(this, "landscape load complete", event.message);
        var heights:Vector.<int> = encoder.decode(String(event.data));
        model.initCurrentLandscapeWithHeights(heights);
    }

    private function storageService_saveCompleteHandler(event:DataEvent):void
    {
        Logger.log(this, "landscape save complete", event.message);
    }

    private function storageService_errorHandler(event:DataEvent):void
    {
        Logger.log(this, "landscape save/load error", event.message);
    }
}
}
