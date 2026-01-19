--// Ryuzen Hub | Clean Version

if game.CoreGui:FindFirstChild("RyuzenHub") then
    game.CoreGui.RyuzenHub:Destroy()
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "RyuzenHub"
gui.ResetOnSpawn = false

-- Botão abrir
local open = Instance.new("TextButton", gui)
open.Size = UDim2.new(0,130,0,36)
open.Position = UDim2.new(0,20,0.5,-18)
open.Text = "RYUZEN"
open.Font = Enum.Font.GothamBold
open.TextSize = 14
open.BackgroundColor3 = Color3.fromRGB(120,0,0)
open.TextColor3 = Color3.new(1,1,1)
open.BorderSizePixel = 0
open.Active = true
open.Draggable = true

-- Main
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,500,0,320)
main.Position = UDim2.new(0.5,-250,0.5,-160)
main.BackgroundColor3 = Color3.fromRGB(18,18,18)
main.Visible = true
main.Active = true
main.Draggable = true
main.BorderSizePixel = 0

-- Top
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,42)
top.BackgroundColor3 = Color3.fromRGB(110,0,0)
top.BorderSizePixel = 0

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,0,1,0)
title.Text = "RYUZEN HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- Content
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,140,0,42)
content.Size = UDim2.new(1,-140,1,-42)
content.BackgroundTransparency = 1

-- Menu
local menu = Instance.new("Frame", main)
menu.Size = UDim2.new(0,140,1,-42)
menu.Position = UDim2.new(0,0,0,42)
menu.BackgroundColor3 = Color3.fromRGB(22,22,22)

-- Clear
local function clear()
    for _,v in pairs(content:GetChildren()) do
        v:Destroy()
    end
end

-- Toggle Function
local function createToggle(text, y, callback)
    local holder = Instance.new("Frame", content)
    holder.Size = UDim2.new(0,260,0,40)
    holder.Position = UDim2.new(0,20,0,y)
    holder.BackgroundTransparency = 1

    local label = Instance.new("TextLabel", holder)
    label.Size = UDim2.new(0.6,0,1,0)
    label.Text = text
    label.TextColor3 = Color3.new(1,1,1)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.BackgroundTransparency = 1

    local toggle = Instance.new("Frame", holder)
    toggle.Size = UDim2.new(0,50,0,22)
    toggle.Position = UDim2.new(1,-60,0.5,-11)
    toggle.BackgroundColor3 = Color3.fromRGB(80,0,0)
    toggle.BorderSizePixel = 0
    toggle.ClipsDescendants = true

    local ball = Instance.new("Frame", toggle)
    ball.Size = UDim2.new(0,20,0,20)
    ball.Position = UDim2.new(0,1,0.5,-10)
    ball.BackgroundColor3 = Color3.new(1,1,1)
    ball.BorderSizePixel = 0

    local on = false

    toggle.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            on = not on
            TweenService:Create(toggle, TweenInfo.new(0.2),
                {BackgroundColor3 = on and Color3.fromRGB(0,170,0) or Color3.fromRGB(80,0,0)}
            ):Play()
            TweenService:Create(ball, TweenInfo.new(0.2),
                {Position = on and UDim2.new(1,-21,0.5,-10) or UDim2.new(0,1,0.5,-10)}
            ):Play()
            callback(on)
        end
    end)
end

-- Tabs
local function tab(name, y, func)
    local b = Instance.new("TextButton", menu)
    b.Size = UDim2.new(1,0,0,40)
    b.Position = UDim2.new(0,0,0,y)
    b.Text = name
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(30,0,0)
    b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(func)
end

-- MENU
tab("🏠 Menu",0,function()
    clear()
end)

-- UNIVERSAL
tab("⚡ Universal",40,function()
    clear()

    createToggle("Speed Safe",0,function(v)
        local hum = player.Character and player.Character:FindFirstChild("Humanoid")
        if hum then
            hum.WalkSpeed = v and 32 or 16
        end
    end)

    createToggle("Jump Safe",50,function(v)
        local hum = player.Character and player.Character:FindFirstChild("Humanoid")
        if hum then
            hum.UseJumpPower = true
            hum.JumpPower = v and 80 or 50
        end
    end)
end)

-- PLAYER
tab("👤 Player",80,function()
    clear()

    createToggle("No Ragdoll",0,function(v)
        local hum = player.Character and player.Character:FindFirstChild("Humanoid")
        if hum then
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, not v)
            hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, not v)
        end
    end)
end)

-- FECHAR
tab("❌ Fechar",120,function()
    main.Visible = false
end)

open.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)
