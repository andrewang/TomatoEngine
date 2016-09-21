--[[

    初始图层
    
--]]

MainUI = class("MainUI", function() return BaseLayer.create() end)

function MainUI.create()
    local layer = MainUI.new()
    layer:initView()
    
    return layer   
end

function MainUI:ctor()
    self._type = "MainUI"
    self._index = 0
    self._menuLayer = {}
end

function MainUI:initView()
    
    local downTitle = cc.Sprite:create("layer/init/zjm_xbg.png")
    downTitle:setPosition(downTitle:getContentSize().width/2, downTitle:getContentSize().height/2)
    self:addChild(downTitle, 10)
    
    --
    local function callback(tag, item)
        if tag ~= self._index then 
            if self._menuLayer[self._index] then
                self._menuLayer[self._index]:removeFromParent()
                self._menuLayer[self._index] = nil
            end
        end
        self._index = tag
        
        if tag == 1 then
            if not self._menuLayer[1] then
                local layer = HomePage.create()
                layer:addto(self)
                
                self._menuLayer[1] = layer
            end
        elseif tag == 2 then
            if not self._menuLayer[2] then
                local layer = cc.Layer:create()
                local bg = cc.Sprite:create("myRes/bg_2.png")
                bg:setPosition(layer:getContentSize().width/2, layer:getContentSize().height/2)
                layer:addChild(bg) 
                self:addChild(layer)
                self._menuLayer[2] = layer
            end
        elseif tag == 3 then
            if not self._menuLayer[3] then
                local layer = cc.Layer:create()
                local bg = cc.Sprite:create("myRes/bg_3.png")
                bg:setPosition(layer:getContentSize().width/2, layer:getContentSize().height/2)
                layer:addChild(bg) 
                self:addChild(layer)
                self._menuLayer[3] = layer
            end
        elseif tag == 4 then
            if not self._menuLayer[4] then
                local layer = cc.Layer:create()
                local bg = cc.Sprite:create("myRes/bg_4.png")
                bg:setPosition(layer:getContentSize().width/2, layer:getContentSize().height/2)
                layer:addChild(bg) 
                self:addChild(layer)
                self._menuLayer[4] = layer
            end
        elseif tag == 5 then
            if not self._menuLayer[5] then
                local layer = cc.Layer:create()
                local bg = cc.Sprite:create("myRes/bg_5.png")
                bg:setPosition(layer:getContentSize().width/2, layer:getContentSize().height/2)
                layer:addChild(bg) 
                self:addChild(layer)
                self._menuLayer[5] = layer
            end
        elseif tag == 6 then
            if not self._menuLayer[6] then
                local layer = cc.Layer:create()
                local bg = cc.Sprite:create("myRes/bg_6.png")
                bg:setPosition(layer:getContentSize().width/2, layer:getContentSize().height/2)
                layer:addChild(bg) 
                self:addChild(layer)
                self._menuLayer[6] = layer
            end
        end
    end

    local path = {"layer/init/dfw_sz_1.png","layer/init/dfw_sz_2.png",
        "layer/init/dfw_sz_3.png","layer/init/dfw_sz_4.png","layer/init/dfw_sz_5.png","layer/init/dfw_sz_6.png"}
    local tab = TabBar.create(path, "layer/init/dfw_sz_7.png", 1)
    tab:registerCallBack(callback)
    self:addChild(tab, 10)
    
    callback(1)
    
    --关闭
    local function callback_rotation(sender, eventType)
        if eventType == ccui.TouchEventType.ended then
            self:closeMainUI()
        end
    end

    local bt = UIButton.create("myRes/an_15.png")
    bt:setPosition(self:getContentSize().width-100, 1230)
    self:addChild(bt, 10)
    bt:addTouchEventListener(callback_rotation)
    bt:addSprite("string/str_gb.png")
    
    local function callback(sender, eventType)
        if eventType == ccui.TouchEventType.ended then         
            if self._bt then
                bt:setIsEnabled(true)
                self._bt = false
            else
                bt:setIsEnabled(false)
                self._bt = true
            end
        end
    end

    local we = UIButton.create("myRes/an_15.png")
    we:setPosition(200, 300)
    self:addChild(we, 10)
    we:addTouchEventListener(callback)
    
    
    --local function shot()
    --end
    
    local render = cc.RenderTexture:create(200,200)
    render:setVirtualViewport(cc.p(0, 0),cc.rect(0,0,200,200), cc.rect(0,0,100,100))
    render:begin()
    self:visit() --哪个节点去visit()，就渲染那个节点包括所有子节点，
    render:endToLua() --原本是end(),因为end是lua中的关键字，所以改成endToLua
    
    render:saveToFile("myPic.png", cc.IMAGE_FORMAT_PNG) --这个后面也有设置回调函数 —添加回调函数会报错
    
    local light = cc.AmbientLight:create(cc.c3b(0,255,0))--cc.PointLight:create(cc.vec3(50,50,50), cc.c3b(0,255,0), 50)
    light:setPosition3D(cc.vec3(200, 200, 50)) --setPosition(300,300)
    self:addChild(light, 100)
        
end

function MainUI:closeMainUI()
    self:close()
end