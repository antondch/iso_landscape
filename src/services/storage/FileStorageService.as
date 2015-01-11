/**
 * Created by Crazy Horse on 11.01.2015.
 */
package services.storage
{
import flash.display.Loader;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.FileFilter;
import flash.net.FileReference;

import logger.Logger;

public class FileStorageService extends EventDispatcher implements IStorageService
{
    public function save(data:String):void
    {
        var saveFile:FileReference = new FileReference();
        saveFile.addEventListener(Event.COMPLETE, saveCompleteHandler);
        saveFile.addEventListener(IOErrorEvent.IO_ERROR, saveIOErrorHandler);
        saveFile.save(data, "landscape.txt");
    }

    private function saveCompleteHandler(event:Event):void
    {
        Logger.log(this, "file saved");
        dispatchEvent(new DataEvent(DataEvent.SAVE_COMPLETE, this + "file saving complete"));
    }

    private function saveIOErrorHandler(event:IOErrorEvent):void
    {
        Logger.log(this, "file saving error");
        dispatchEvent(new DataEvent(DataEvent.ERROR, this + "file saving io error"));
    }

    public function load():void
    {
        var imageFileTypes:FileFilter = new FileFilter("Landscapes (*.lsc)", "*.lsc");
        var loadFile:FileReference = new FileReference();
        loadFile.browse([imageFileTypes]);
        loadFile.addEventListener(Event.SELECT, selectFile);
    }

    public function selectFile(event:Event):void
    {
        var loadFile:FileReference = FileReference(event.target);
        loadFile.removeEventListener(Event.SELECT, selectFile);
        loadFile.addEventListener(Event.COMPLETE, loadCompleteHandler);
        loadFile.addEventListener(IOErrorEvent.IO_ERROR, loadIOErrorHandler);
        loadFile.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
        loadFile.load();
    }


    private function loadCompleteHandler(event:Event):void
    {
        var loader:Loader = new Loader();
        var fileRef:FileReference = FileReference(event.target);
        var landscape:String = fileRef.data.readUTFBytes(fileRef.data.length);
        dispatchEvent(new DataEvent(DataEvent.LOAD_COMPLETE, landscape, this + "file open complete"));
    }

    private function loadIOErrorHandler(event:IOErrorEvent):void
    {
        dispatchEvent(new DataEvent(DataEvent.ERROR, this + "file open io error"));
    }

    private function onSecurityError(event:SecurityErrorEvent):void
    {
        dispatchEvent(new DataEvent(DataEvent.ERROR, this + "file open security error"));
    }
}
}
