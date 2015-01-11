/**
 * Created by Crazy Horse on 11.01.2015.
 */
package landscape
{
import isoCore.IsoBox;
import isoCore.IsoObject;
import isoCore.IsoScene;

public class LandscapeView extends IsoScene
{
    private var boxStorage:Vector.<IsoBox> = new Vector.<IsoBox>();

    override public function add2Scene(child:IsoObject):IsoObject
    {
        boxStorage.push(super.add2Scene(child));
        return child;
    }

    public function getBox(position:int):IsoBox
    {
        var result:IsoBox;
        result = boxStorage[position];
        return result;
    }

    public function getBoxPosition(box:IsoBox):int
    {
        return boxStorage.indexOf(box);
    }
}
}
