/**
 * Created by Crazy Horse on 10.01.2015.
 */
package ui
{
import flash.display.Sprite;
import flash.text.TextField;

public class DisplayMenu extends Sprite
{
    private var landScape0Btn:TextButton;
    private var landScape1Btn:TextButton;
    private var landScape2Btn:TextButton;

    private var importBtn:TextButton;
    private var exportBtn:TextButton;

    private var currentHeightTF:TextField;

    public function DisplayMenu()
    {
        draw();
    }

    public function draw():void
    {
        graphics.lineStyle(0.5);
        graphics.moveTo(80,0);
        graphics.lineTo(80,300);
        graphics.moveTo(50,50);
        graphics.lineTo(80,50);
        var tf:TextField = new TextField();
        tf.text = "100";
        tf.x=50;
        tf.y=30;
        addChild(tf);
        graphics.moveTo(50,100);
        graphics.lineTo(80,100);
        var tf:TextField = new TextField();
        tf.text = "50";
        tf.x=50;
        tf.y=80;
        addChild(tf);
        graphics.moveTo(50,150);
        graphics.lineTo(80,150);
        var tf:TextField = new TextField();
        tf.text = "0";
        tf.x=50;
        tf.y=120;
        addChild(tf);
        graphics.moveTo(50,200);
        graphics.lineTo(80,200);
        var tf:TextField = new TextField();
        tf.text = "-50";
        tf.x=50;
        tf.y=170;
        addChild(tf);
        graphics.moveTo(50,250);
        graphics.lineTo(80,250);
        var tf:TextField = new TextField();
        tf.text = "100";
        tf.x=50;
        tf.y=220;
        addChild(tf);

        landScape0Btn = new TextButton("Набор высот №1");
        landScape0Btn.x = 30;
        landScape0Btn.y = 450;
        addChild(landScape0Btn);

        landScape1Btn = new TextButton("Набор высот №2");
        landScape1Btn.x = 140;
        landScape1Btn.y = 450;
        addChild(landScape1Btn);

        landScape2Btn = new TextButton("Набор высот №3");
        landScape2Btn.x = 250;
        landScape2Btn.y = 450;
        addChild(landScape2Btn);
    }
}
}
