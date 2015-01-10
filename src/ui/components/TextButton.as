/**
 * Created by Crazy Horse on 10.01.2015.
 */
package ui.components
{
import flash.display.DisplayObjectContainer;
import flash.display.Shape;
import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.text.TextField;

public class TextButton extends Sprite
{
    public function TextButton(text:String = "Text Button"):void
    {
        var textField:TextField = new TextField();
        textField.name = "textField";
        textField.mouseEnabled = false;

        var rectangleShape:Shape = new Shape();
        rectangleShape.graphics.beginFill(0xcccccc);
        rectangleShape.graphics.drawRect(0, 0, 100, 25);
        rectangleShape.graphics.endFill();

        var simpleButtonSprite:Sprite = new Sprite();
        simpleButtonSprite.name = "simpleButtonSprite";
        simpleButtonSprite.addChild(rectangleShape);
        simpleButtonSprite.addChild(textField);

        var simpleButton:SimpleButton = new SimpleButton();
        simpleButton.upState = simpleButtonSprite;
        simpleButton.overState = simpleButtonSprite;
        simpleButton.downState = simpleButtonSprite;
        simpleButton.hitTestState = simpleButtonSprite;
        addChild(simpleButton);

        var sbs:DisplayObjectContainer = DisplayObjectContainer(simpleButton.upState);
        var tf:TextField = TextField(sbs.getChildByName("textField"));
        tf.text = text;
    }
}
}
