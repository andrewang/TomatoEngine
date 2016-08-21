--[[

    单例---

--]]

GLOBAL_INSTANCE_SCENE = nil

GameScene = class("GameScene",function()return cc.Scene:create()end)

function GameScene.create()
    local scene = GameScene.new()   
    GLOBAL_INSTANCE_SCENE = scene

    scene:initInformation()
       
    return scene
end

function GameScene:getInstanceGameScene()
    return GLOBAL_INSTANCE_SCENE
end

function GameScene:ctor()
    
end

function GameScene:initInformation()
    
    self:initRequire()
    
    local function callback_rotation(sender, eventType)
        if eventType == ccui.TouchEventType.ended then                 
            local layer = initLayer.create()
            GLOBAL_INSTANCE_SCENE:addChild(layer)
        end
    end

    local bt = ccui.Button:create("myRes/an_15.png")
    bt:setPosition(self:getContentSize().width/2, 100)
    self:addChild(bt)
    bt:addTouchEventListener(callback_rotation) 
    
    local label = cc.Label:createWithSystemFont("进入", "Arial", 26)
    label:setPosition(bt:getContentSize().width/2, bt:getContentSize().height/2)
    bt:addChild(label)
    
end

function GameScene:initRequire()
    
    require "common.common"
    require "layer.layer"
    
end




