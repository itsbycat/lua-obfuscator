local input = io.open("script.lua", "rb")
local read_script = input:read("*a")
input:close()

local encoded = read_script:gsub(".", function(i) return "\\" .. i:byte() end) or read_script .. "\""
local output = io.open("output.lua", "w+")

output:write(string.format("loadstring('%s')()", encoded))
output:close()

print("done")
