local file = fs.open("startup.lua", "w")
    
local content = [[
    dofile("chest_monitor.lua")
]]

file.write(content)

file.close()