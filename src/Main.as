package
{

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import landscape.LandscapeConfig;
import landscape.LandscapeController;

import landscape.LandscapeModel;
import landscape.LandscapeView;

import ui.UIController;

import ui.UIView;

[SWF(width=1000, height=1000)]
public class Main extends Sprite
{
    private var ui:UIView;
    private var mainContainer:Sprite;

    public function Main()
    {
        mainContainer = new Sprite();
        mainContainer.y = 150;
        addChild(mainContainer);

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;


        var config:LandscapeConfig = new LandscapeConfig();
        var landscapeModel:LandscapeModel = new LandscapeModel(config.ROWS_COUNT*config.COLUMNS_COUNT,config.MAX_HEiGHT,config.MIN_HEiGHT,config.ZERO_HEIGHT);

        //prepare empty landscapes.
        for (var i:int = 0; i < config.LANDSCAPES_COUNT; i++)
        {
            landscapeModel.changeCurrentLandscape(i);
        }
        landscapeModel.changeCurrentLandscape(0);

        var landscapeView:LandscapeView = new LandscapeView();
        var landscapeController:LandscapeController = new LandscapeController(landscapeView,landscapeModel,config);

        ui = new UIView();
        var uiController:UIController = new UIController(ui, landscapeModel);

        mainContainer.addChild(ui);
        mainContainer.addChild(landscapeView);

        //todo: remove this trash
        landscapeView.x = 280;
        landscapeView.y = 210;
        //***********************

    }




}
}
