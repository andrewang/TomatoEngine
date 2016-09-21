--[[
    --按钮
    可添加精灵子节点，label,变灰
--]]

UIButton = class("UIButton", function() return cc.Node:create() end)

function UIButton.create(norSp, text, textSize)
    local obj = UIButton.new()
    obj:initBt(norSp, text, textSize)
    
    return obj
end

function UIButton:ctor()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self._spChildren = {}
end

function UIButton:initBt(norSp, text, textSize)
    local bt = ccui.Button:create(norSp)
    self:setContentSize(bt:getContentSize())
    bt:setPosition(bt:getContentSize().width/2, bt:getContentSize().height/2)
    self:addChild(bt)
    self._bt = bt
    self._sp = bt:getVirtualRenderer():getSprite()
    
    if text then
        bt:setTitleText(text)
        bt:setTitleFontSize(textSize or 24)
    end
 
end

function UIButton:setLabelText(text, textSize)
    self._bt:getTitleRenderer():setString(text)
    self._bt:getTitleRenderer():setSystemFontSize(textSize or 24)
end

function UIButton:getButton()
    return self._bt
end

function UIButton:addSprite(path, posx, posy)
    local x, y = posx or self._bt:getContentSize().width/2, posy or self._bt:getContentSize().height/2
    
    local sp = cc.Sprite:create(path)
    sp:setPosition(x, y)
    self._sp:addChild(sp)
    self._spChildren[#self._spChildren+1] = sp
end

function UIButton:addLabel(text, posx, posy)
    local x, y = posx or self._bt:getContentSize().width/2, posy or self._bt:getContentSize().height/2
    
    local label = cc.Label:createWithSystemFont(text, "Arial", 24)
    label:setPosition(x, y)
    self._sp:addChild(label)
    self._spChildren[#self._spChildren+1] = label
end

function UIButton:setIsEnabled(isEnabled)
    self._bt:setEnabled(isEnabled)
    
    if not isEnabled then
        setSpriteGray(self._sp)
        for i,v in pairs(self._spChildren) do
            setSpriteGray(v)
        end
    else
        setSpriteNormal(self._sp)
        for i,v in pairs(self._spChildren) do
            setSpriteNormal(v)
        end
    end
end

function UIButton:addTouchEventListener(callback)
    self._bt:addTouchEventListener(callback)
end




