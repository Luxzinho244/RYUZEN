-- ⛩️ RYUZEN LOADER
if not game:IsLoaded() then
	game.Loaded:Wait()
end

local url = "https://raw.githubusercontent.com/Luxzinho244/RYUZEN/main/main.lua"

pcall(function()
	loadstring(game:HttpGet(url))()
end)
