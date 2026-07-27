require("lua/startup")
require("monitors")
local modules = {
	windows = "default",
	animations = "default",
	cursor = "default",
	rules = "default",
	input = "default",
	misc = "default",
}
for i, v in pairs(modules) do
	require("lua/" .. i .. "/" .. v)
end
