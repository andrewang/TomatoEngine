--[[

    初始图层
    
--]]

initLayer = class("initLayer", function() return PopupLayer.create() end)

function initLayer.create()
    local layer = initLayer.new()
    layer:initView()
    
    return layer   
end

function initLayer:ctor()
	
end

function initLayer:initView()
    
    local layerbg = cc.Sprite:create("myRes/jjc_bg_1.png")
    layerbg:setPosition(self:getContentSize().width/2, self:getContentSize().height/2)
    self:addChild(layerbg)
    layerbg:setScale(0.5)
    
    self:registerWithSafeArea(layerbg)
    
    --
    local function callback_rotation(sender, eventType)
        if eventType == ccui.TouchEventType.ended then 
            local layer = BaseLayer.create()
            self:addChild(layer)            
        end
    end
    
    local bt = ccui.Button:create("myRes/an_15.png")
    bt:setPosition(100, 100)
    self:addChild(bt)
    bt:addTouchEventListener(callback_rotation)
    
    local label = cc.Label:createWithSystemFont("进入基层", "Arial", 24)
    label:setPosition(bt:getContentSize().width/2, bt:getContentSize().height/2)
    bt:addChild(label)
    
    
    --关闭
    do
        local function callback_rotation(sender, eventType)
            if eventType == ccui.TouchEventType.ended then
                self:close()
            end
        end
    
        local bt = ccui.Button:create("myRes/an_15.png")
        bt:setPosition(self:getContentSize().width-100, 100)
        self:addChild(bt)
        bt:addTouchEventListener(callback_rotation)
        
        local label = cc.Label:createWithSystemFont("关闭", "Arial", 24)
        label:setPosition(bt:getContentSize().width/2, bt:getContentSize().height/2)
        bt:addChild(label)
    end
        
end

function initLayer:closeInitLayer()
    self:close()
end