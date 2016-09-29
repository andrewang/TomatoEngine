--[[

    首页 
    
--]]

HomePage = class("HomePage", function() return BaseLayer.create() end)

function HomePage.create()
    local layer = HomePage.new()
    layer:initView()
    
    return layer   
end

function HomePage:ctor()
    self._type = "HomePage"
end

function HomePage:initView()
    local bg = cc.Sprite:create("myRes/bg_1.png")
    bg:setPosition(self:getContentSize().width/2, self:getContentSize().height/2)
    self:addChild(bg, 0) 
    
    --旋转选择角色
--    local layer = RotateView.create()
--    layer:setPosition(0, self:getContentSize().height/2-layer:getContentSize().height/2)
--    self:addChild(layer)
--    
--    for i=1, 6 do
--        local sp = cc.Sprite:create("myRes/taizi.png")
--        layer:pushBackCustomItem(sp)
--    end
 
    --鼠标悬停
--    local sp9 = ccui.Scale9Sprite:create("common/bar_back.png")
--    sp9:setPosition(self:getContentSize().width-sp9:getContentSize().width/2, self:getContentSize().height/2)
--    self:addChild(sp9)
--    
--    local function callback(tag)
--        Toast3.create(tag)
--    end
--    
--    local listbar = ListBar.create(cc.c3b(255,255,255), "common/bar_front.png")
--    --listbar:setDirection(2)
--    listbar:pushBackCustomItem("电影")
--    listbar:pushBackCustomItem("娱乐")
--    listbar:pushBackCustomItem("动漫")
--    listbar:pushBackCustomItem("时尚")
--    listbar:pushBackCustomItem("鬼畜")
--    listbar:pushBackCustomItem("科技")
--    listbar:pushBackCustomItem("直播")
--    listbar:registerScriptHandler(callback)
--    sp9:addChild(listbar)  
--    sp9:setContentSize(listbar:getContentSize())
    
    --截图
--    local layer = CapTure.create()
--    layer:addto(nil, 10)
end







