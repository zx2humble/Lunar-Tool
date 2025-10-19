local isWorking = false

local WorkingExecutors = {"Wave",}

-- Safely runs the function identifyexecutor() so nothing crashes --
-- if the boolean returns false the name will return null or nil which means that the name wont print --
local bool, Name = pcall(identifyexecutor)
if not bool then
    Name = nil
end

for _, exec in ipairs(WorkingExecutors) do 
    if Name == tostring(exec) then
        isWorking = true
    end
end

if isWorking then
    print(Name .. " Executor Is Verified!")
end

local runSUNCTest = not isWorking

-- Will run if the Executor name is not verified --
if runSUNCTest == true then
    getgenv().sUNCDebug = {
        ["printcheckpoints"] = false,
        ["delaybetweentests"] = 0,
        ["printtesttimetaken"] = false,
    }


    pcall(function()
        loadstring(game:HttpGet("https://script.sunc.su/"))()
    end)
end