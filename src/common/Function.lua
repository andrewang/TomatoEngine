
--以log的模式打印
local _print = print
function printLog(...)
    if EC_LUA_DEBUG >= 3 then
        local arg = {...}
        local sLog = "LOG:"
        for i,v in pairs(arg) do
            sLog = sLog .. tostring(v) .. "\t"
        end

        _print(sLog)
    end
end

--以警告的模式打印
function printWarn(...)
    if EC_LUA_DEBUG >= 2 then
        local arg = {...}
        local sLog = "WARN:"
        for i,v in pairs(arg) do
            sLog = sLog .. tostring(v) .. "\t"
        end
        _print(sLog)
    end
end

--以错误的模式打印
function printError(...)
    if EC_LUA_DEBUG >= 1 then
        local arg = {...}
        local sLog = "ERROR:"
        for i,v in pairs(arg) do
            sLog = sLog .. tostring(v) .. "\t"
        end
        _print(sLog)
    end
end

--打印表
function printTable(tab,index)
    if EC_LUA_DEBUG >= 1 then
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
end

--重写print 函数 为不可用
--function print()
--    error("USE 'printLog/printWarn/printError/printTable' INSTEAD OF print function",2)
--end