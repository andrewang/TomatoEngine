
--以log的模式打印
local _print = print
--打印表
function printTable(tab,index)
    index = index or 0
    local cur = ""
    for k= 1,index do
        cur = cur .."    "
    end
    for i,v in pairs(tab) do
        if type(v) == "table" then
            _print(cur..i.." = ")
            _print(cur.."{")
            printTable(v,index+1)
            _print(cur.."}")
        else
            if type(v) == "boolean" then
                if v then
                    v = "true"
                else
                    v = "false"
                end
            end

            if type(v) == "function" then
                v = tostring(v)
            end

            if i ~= "ifDataIn" then
                _print(cur..i.." = ".. v)
            end
        end
    end
end

-------------------------
--@function: 通过string类型的type得到layer的对象
function getOneLayerFromType(type)   
    for k, v in pairs(GAME_GLOBAL_LAYERS) do
        if k and v and k._type==type then
            return k
        end
    end    
end

--shader:变灰
function setSpriteGray(sprite)
    if sprite == nil then
        return
    end
    local state = cc.GLProgramState:getOrCreateWithGLProgramName("Gray")
    if state == nil then
        --lewislualog("create new shader")
        local glprogram = cc.GLProgram:createWithFilenames("shader/Gray.vsh", "shader/Gray.fsh")
        cc.GLProgramCache:getInstance():addGLProgram(glprogram, "Gray")
        state = cc.GLProgramState:getOrCreateWithGLProgram(glprogram)
    end
    sprite:setGLProgramState(state)
end

--shader:正常
function setSpriteNormal(sprite)
    if sprite == nil then
        return
    end
    --ShaderPositionTextureColorAlphaTest_NoMV --ShaderPositionTextureColor_noMVP
    local glprogram = cc.GLProgramCache:getInstance():getGLProgram("ShaderPositionTextureColor_noMVP")
    local state = cc.GLProgramState:getOrCreateWithGLProgram(glprogram)
    sprite:setGLProgramState(state)
end

--shader:ice
function setSpriteIce(sprite)
    if sprite == nil then
        return
    end
    local state = cc.GLProgramState:getOrCreateWithGLProgramName("Ice")
    if state == nil then
        local glprogram = cc.GLProgram:createWithFilenames("shader/Ice.vsh", "shader/Ice.fsh")
        cc.GLProgramCache:getInstance():addGLProgram(glprogram, "Ice")
        state = cc.GLProgramState:getOrCreateWithGLProgram(glprogram)
    end
    sprite:setGLProgramState(state)
end



