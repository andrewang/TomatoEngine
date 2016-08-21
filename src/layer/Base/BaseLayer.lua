--[[
    一个透明图层，并且屏蔽下层的消息，点击非图片区域会关闭此图层
--]]

BaseLayer = class("BaseLayer", function() return cc.Layer:create() end)

function BaseLayer.create()
    local layer = BaseLayer.new()
    layer:initView()
    
    return layer
end

function BaseLayer:ctor()
    self:setContentSize(cc.size(GAME_GLOBAL_SCREE_WIDTH, GAME_GLOBAL_SCREE_HEGHT))
    self:setAnchorPoint(cc.p(0, 0))
end

function BaseLayer:initView()
    
    --屏蔽下层消息
    local function onTouchBegan(touch, event)
        return true
    end
    
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    listener:registerScriptHandler(onTouchBegan, cc.Handler.EVENT_TOUCH_BEGAN)
    
    
    local dispa = self:getEventDispatcher()
    dispa:addEventListenerWithSceneGraphPriority(listener, self)
    
    --蒙版
    local layerbg = cc.Sprite:create("common/cm_opacity.png")
    layerbg:setScaleX(GAME_GLOBAL_SCREE_WIDTH/layerbg:getContentSize().width)
    layerbg:setScaleY(GAME_GLOBAL_SCREE_HEGHT/layerbg:getContentSize().height)
    layerbg:setPosition(self:getContentSize().width/2, self:getContentSize().height/2)
    self:addChild(layerbg)
  
end

function BaseLayer:close()
    self:removeFromParent()
end