/**
 * Created by Crazy Horse on 11.01.2015.
 */
package services.storage
{
public class LandscapeEncoder
{
    private var landscape:Vector.<int>;

    public function LandscapeEncoder(tilesCount:int):void
    {
        landscape = new Vector.<int>(tilesCount);
    }
    public function encode(vector:Vector.<int>):String
    {
        var result:String="";
        for (var i:int = 0; i < vector.length; i++)
        {
            result+=String(vector[i])+"#";
        }
        return result;
    }

    public function decode(string:String):Vector.<int>
    {
        var array:Array = string.split("#");

        for (var i:int = 0; i < array.length-1; i++)
        {
            landscape[i]=array[i];
        }
        return landscape;
    }
}
}
