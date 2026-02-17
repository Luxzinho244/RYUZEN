-- GROK AUTO FARM BLOX FRUITS | CRIADO POR xAI & LUIS (2026) | ORIGINAL 100%
-- Muda _G.SelectTool = "TeuSwordAqui" (ex: "Combat", "Katana", "Pole", "Iron Mace")

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local data = player:WaitForChild("Data")

local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")
local RSR = game:GetService("ReplicatedStorage")
local VIM = game:GetService("VirtualInputManager")
local CommF = RSR.Remotes.CommF_

_G.AutoFarm = false
_G.FastAttack = false
_G.SelectTool = "Combat"  -- MUDA AQUI PRA TUA ARMA/FRUTA!

-- TWEEN FUNCTION
local function TweenTo(cf, speed)
    speed = speed or 0.8
    local ti = TweenInfo.new(speed, Enum.EasingStyle.Linear)
    local tw = TS:Create(hrp, ti, {CFrame = cf})
    tw:Play()
    tw.Completed:Wait()
end

-- EQUIP TOOL
local function EquipTool(toolname)
    toolname = toolname or _G.SelectTool
    local tool = player.Backpack:FindFirstChild(toolname) or char:FindFirstChild(toolname)
    if tool and tool:IsA("Tool") then
        tool.Parent = char
    end
end

-- CHECK QUEST (FULL TABLE - TODAS SEAS!)
local Ms, QuestName, QuestNumber, NameMon, CFrameQuest, CFrameMon
local function CheckQuest()
    local lvl = data.Level.Value
    if lvl <= 9 then
        Ms = "Bandit [Lv. 5]"; NameMon = "Bandit"; QuestName = "BanditQuest1"; QuestNumber = 1
        CFrameQuest = CFrame.new(1060.938, 16.455, 1547.784)
        CFrameMon = CFrame.new(1038.553, 41.296, 1576.509)
    elseif lvl <= 14 then
        Ms = "Monkey [Lv. 14]"; NameMon = "Monkey"; QuestName = "JungleQuest"; QuestNumber = 1
        CFrameQuest = CFrame.new(-1604.120, 36.852, 154.237)
        CFrameMon = CFrame.new(-1448.144, 50.851, 63.607)
    elseif lvl <= 29 then
        Ms = "Gorilla [Lv. 20]"; NameMon = "Gorilla"; QuestName = "JungleQuest"; QuestNumber = 2
        CFrameQuest = CFrame.new(-1601.655, 36.852, 153.388)
        CFrameMon = CFrame.new(-1142.648, 40.462, -515.392)
    elseif lvl <= 39 then
        Ms = "Pirate [Lv. 35]"; NameMon = "Pirate"; QuestName = "BuggyQuest1"; QuestNumber = 1
        CFrameQuest = CFrame.new(-1140.176, 4.752, 3827.405)
        CFrameMon = CFrame.new(-1201.088, 40.628, 3857.596)
    elseif lvl <= 59 then
        Ms = "Brute [Lv. 45]"; NameMon = "Brute"; QuestName = "BuggyQuest1"; QuestNumber = 2
        CFrameQuest = CFrame.new(-1140.176, 4.752, 3827.405)
        CFrameMon = CFrame.new(-1387.532, 24.592, 4100.957)
    elseif lvl <= 74 then
        Ms = "Desert Bandit [Lv. 60]"; NameMon = "Desert Bandit"; QuestName = "DesertQuest"; QuestNumber = 1
        CFrameQuest = CFrame.new(896.517, 6.438, 4390.149)
        CFrameMon = CFrame.new(984.998, 16.109, 4417.910)
    elseif lvl <= 89 then
        Ms = "Desert Officer [Lv. 70]"; NameMon = "Desert Officer"; QuestName = "DesertQuest"; QuestNumber = 2
        CFrameQuest = CFrame.new(896.517, 6.438, 4390.149)
        CFrameMon = CFrame.new(1547.151, 14.452, 4381.800)
    elseif lvl <= 99 then
        Ms = "Snow Bandit [Lv. 90]"; NameMon = "Snow Bandits"; QuestName = "SnowQuest"; QuestNumber = 1
        CFrameQuest = CFrame.new(1386.807, 87.272, -1298.357)
        CFrameMon = CFrame.new(1356.302, 105.768, -1328.241)
    elseif lvl <= 119 then
        Ms = "Snowman [Lv. 100]"; NameMon = "Snowman"; QuestName = "SnowQuest"; QuestNumber = 2
        CFrameQuest = CFrame.new(1386.807, 87.272, -1298.357)
        CFrameMon = CFrame.new(1218.795, 138.011, -1488.026)
    elseif lvl <= 149 then
        Ms = "Chief Petty Officer [Lv. 120]"; NameMon = "Chief Petty Officer"; QuestName = "MarineQuest2"; QuestNumber = 1
        CFrameQuest = CFrame.new(-5035.496, 28.677, 4324.184)
        CFrameMon = CFrame.new(-4931.155, 65.793, 4121.839)
    elseif lvl <= 174 then
        Ms = "Sky Bandit [Lv. 150]"; NameMon = "Sky Bandit"; QuestName = "SkyQuest"; QuestNumber = 1
        CFrameQuest = CFrame.new(-4841.834, 717.669, -2623.964)
        CFrameMon = CFrame.new(-4970.742, 294.544, -2890.113)
    elseif lvl <= 224 then
        Ms = "Dark Master [Lv. 175]"; NameMon = "Dark Master"; QuestName = "SkyQuest"; QuestNumber = 2
        CFrameQuest = CFrame.new(-4841.834, 717.669, -2623.964)
        CFrameMon = CFrame.new(-5220.585, 430.693, -2278.174)
    elseif lvl <= 274 then
        Ms = "Toga Warrior [Lv. 225]"; NameMon = "Toga Warrior"; QuestName = "ColosseumQuest"; QuestNumber = 1
        CFrameQuest = CFrame.new(-1576.117, 7.389, -2983.307)
        CFrameMon = CFrame.new(-1779.975, 44.607, -2736.354)
    elseif lvl <= 299 then
        Ms = "Gladiator [Lv. 275]"; NameMon = "Gladiator"; QuestName = "ColosseumQuest"; QuestNumber = 2
        CFrameQuest = CFrame.new(-1576.117, 7.389, -2983.307)
        CFrameMon = CFrame.new(-1274.759, 58.189, -3188.163)
    elseif lvl <= 329 then
        Ms = "Military Soldier [Lv. 300]"; NameMon = "Military Soldier"; QuestName = "MagmaQuest"; QuestNumber = 1
        CFrameQuest = CFrame.new(-5316.558, 12.237, 8517.299)
        CFrameMon = CFrame.new(-5363.011, 41.505, 8548.472)
    elseif lvl <= 374 then
        Ms = "Military Spy [Lv. 330]"; NameMon = "Military Spy"; QuestName = "MagmaQuest"; QuestNumber = 2
        CFrameQuest = CFrame.new(-5316.558, 12.237, 8517.299)
        CFrameMon = CFrame.new(-5787.990, 120.864, 8762.252)
    elseif lvl <= 399 then
        Ms = "Fishman Warrior [Lv. 375]"; NameMon = "Fishman Warrior"; QuestName = "FishmanQuest"; QuestNumber = 1
        CFrameQuest = CFrame.new(61122.562, 18.471, 1568.165)
        CFrameMon = CFrame.new(61163.851, 5.307, 1819.784)
    elseif lvl <= 449 then
        Ms = "Fishman Commando [
