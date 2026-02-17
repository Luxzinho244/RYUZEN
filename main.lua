-- GROK x LUIS AUTO FARM HUB | BLOX FRUITS 2026 | ORIGINAL & COMPLETO 🔥
-- Feito pra ti, mlk! Subi pro GitHub e usa loadstring do raw.

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local WS = game:GetService("Workspace")
local TS = game:GetService("TweenService")
local VIM = game:GetService("VirtualInputManager")
local UIS = game:GetService("UserInputService")
local VU = game:GetService("VirtualUser")
local CommF = RS.Remotes.CommF_

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local Data = player:WaitForChild("Data")
local Quest = Data:WaitForChild("Quest")

-- ANTI AFK
VU:CaptureController()
VU:ClickButton1(Vector2.new(0,0))
RS.Heartbeat:Connect(function()
    VU:CaptureController()
    VU:ClickButton1(Vector2.new(0,0))
end)

-- WORLD DETECT
local World1 = game.PlaceId == 2753915549 and true or false
local World2 = game.PlaceId == 4442272183 and true or false
local World3 = game.PlaceId == 7449423635 and true or false

-- HUB GUI (Rayfield - abre na hora!)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "🦍 Grok x Luis Hub | Blox Fruits",
    LoadingTitle = "Carregando Farm...",
    LoadingSubtitle = "by Grok xAI & Luis RN",
    ConfigurationSaving = { Enabled = true, FolderName = "GrokBFHub", FileName = "LuisHub" },
    KeySystem = false
})

local MainTab = Window:CreateTab("🏝️ Main Farm", 4483362458)
local MiscTab = Window:CreateTab("⚙️ Misc", 4483362458)

MainTab:CreateSection("Auto Farm Level")

_G.AutoFarmLevel = false
MainTab:CreateToggle({
    Name = "🚀 Auto Farm Level/Quest/Mobs",
    CurrentValue = false,
    Callback = function(v)
        _G.AutoFarmLevel = v
        if v then spawn(FarmLoop) end
    end
})

_G.FastAttack = false
MainTab:CreateToggle({
    Name = "⚡ Fast Attack (VIM)",
    CurrentValue = false,
    Callback = function(v) _G.FastAttack = v end
})

local Weapons = {"Combat", "Katana", "Pole (1)", "Pole (2)", "Pole (3)", "Iron Mace", "Dual Katana", "Grenade", "Saber"}
_G.SelectWeapon = "Combat"
MainTab:CreateDropdown({
    Name = "Select Arma",
    Options = Weapons,
    CurrentOption = "Combat",
    Callback = function(o) _G.SelectWeapon = o end
})

MiscTab:CreateToggle({
    Name = "📈 FPS Boost",
    CurrentValue = false,
    Callback = function(v)
        if v then
            setfpscap(999)
            game.Lighting.FogEnd = 9e9
            game.Lighting.GlobalShadows = false
        else
            setfpscap(60)
        end
    end
})

MiscTab:CreateButton({
    Name = "🔄 Rejoin Server",
    Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId, player) end
})

-- QUEST TABLE FULL (TODAS SEAS 2026)
local Ms, NameQuest, LevelQuest, NameMon, CFrameQuest, CFrameMon = "", "", 0, "", CFrame.new(), CFrame.new()

function CheckQuest()
    local MyLevel = Data.Level.Value
    if World1 then
        if MyLevel == 1 or MyLevel <= 9 then
            Ms = "Bandit [Lv. 5]"; NameQuest = "BanditQuest1"; LevelQuest = 1; NameMon = "Bandit"
            CFrameQuest = CFrame.new(1060.938, 16.455, 1547.784); CFrameMon = CFrame.new(1038.553, 41.296, 1576.509)
        elseif MyLevel == 10 or MyLevel <= 14 then
            Ms = "Monkey [Lv. 14]"; NameQuest = "JungleQuest"; LevelQuest = 1; NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1604.120, 36.852, 154.237); CFrameMon = CFrame.new(-1448.144, 50.852, 63.607)
        elseif MyLevel == 15 or MyLevel <= 29 then
            Ms = "Gorilla [Lv. 20]"; NameQuest = "JungleQuest"; LevelQuest = 2; NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1601.655, 36.852, 153.388); CFrameMon = CFrame.new(-1142.649, 40.462, -515.392)
        elseif MyLevel == 30 or MyLevel <= 39 then
            Ms = "Pirate [Lv. 35]"; NameQuest = "BuggyQuest1"; LevelQuest = 1; NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1140.176, 4.752, 3827.406); CFrameMon = CFrame.new(-1201.088, 40.629, 3857.597)
        elseif MyLevel == 40 or MyLevel <= 59 then
            Ms = "Brute [Lv. 45]"; NameQuest = "BuggyQuest1"; LevelQuest = 2; NameMon = "Brute"
            CFrameQuest = CFrame.new(-1140.176,
