--// Ryuzen Hub V2 | Stable & Clean

if game.CoreGui:FindFirstChild("RyuzenHub") then
    game.CoreGui.RyuzenHub:Destroy()
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "RyuzenHub"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- OPEN BUTTON
local open = Instance.new("TextButton", gui)
open.Size = UDim2.new(0,140,0,38)
open.Position = UDim2.new(0,20,0.5,-19)
open.Text = "RYUZEN"
open.Font = Enum.Font.GothamBold
open.TextSize = 14
open.BackgroundColor3 = Color3.fromRGB(120,0,0)
open.TextColor3 = Color3.new(1,1,1)
open.BorderSizePixel = 0
open.Active = true
open.Draggable = true

Instance.new("UICorner", open).CornerRadius = UDim.new(0,18)

-- MAIN
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,520,0,340)
main.Position = UDim2.new(0.5,-260,0.5,-170)
main.BackgroundColor3 = Color3.fromRGB(16,16,16)
main.Visible = true
main.Active = true
main.Draggable = true
main.BorderSizePixel = 0

Instance.new("UICorner", main).CornerRadius = UDim.new(0,20)

-- TOP
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,44)
top.BackgroundColor3 = Color3.fromRGB(120,0,0)
top.BorderSizePixel = 0
Instance.new("UICorner", top).CornerRadius = UDim.new(0,20)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,0,1,0)
title.Text = "🩸 R Y U Z E N  H U B"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- MENU
local menu = Instance.new("Frame", main)
menu.Size = UDim2.new(0,150,1,-44)
menu.Position = UDim2.new(0,0,0,44)
menu.BackgroundColor3 = Color3.fromRGB(20,20,20)
menu.BorderSizePixel = 0
Instance.new("UICorner", menu).CornerRadius = UDim.new(0,18)

-- CONTENT
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,150,0,44)
content.Size = UDim2.new(1,-150,1,-44)
content.BackgroundTransparency = 1

-- CLEAR
local function clear()
    for _,v in pairs(content:GetChildren()) do
        v:Destroy()
    end
end

-- TAB BUTTON
local function createTab(text, y, callback)
    local btn = Instance.new("TextButton", menu)
    btn.Size = UDim2.new(1,-20,0,40)
    btn.Position = UDim2.new(0,10,0,y)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(35,0,0)
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,16)

    btn.MouseButton1Click:Connect(callback)
end

-- TOGGLE
local function createToggle(text, y, func)
    local holder = Instance.new("Frame", content)
    holder.Size = UDim2.new(0,300,0,44)
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
    toggle.Size = UDim2.new(0,54,0,26)
    toggle.Position = UDim2.new(1,-64,0.5,-13)
    toggle.BackgroundColor3 = Color3.fromRGB(90,0,0)
    toggle.BorderSizePixel = 0
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

    local ball = Instance.new("Frame", toggle)
    ball.Size = UDim2.new(0,22,0,22)
    ball.Position = UDim2.new(0,2,0.5,-11)
    ball.BackgroundColor3 = Color3.new(1,1,1)
    ball.BorderSizePixel = 0
    Instance.new("UICorner", ball).CornerRadius = UDim.new(1,0)

    local button = Instance.new("TextButton", toggle)
    button.Size = UDim2.new(1,0,1,0)
    button.Text = ""
    button.BackgroundTransparency = 1

    local state = false

    button.MouseButton1Click:Connect(function()
        state = not state

        TweenService:Create(toggle, TweenInfo.new(0.2), {
            BackgroundColor3 = state and Color3.fromRGB(0,170,0) or Color3.fromRGB(90,0,0)
        }):Play()

        TweenService:Create(ball, TweenInfo.new(0.2), {
            Position = state and UDim2.new(1,-24,0.5,-11) or UDim2.new(0,2,0.5,-11)
        }):Play()

        func(state)
    end)
end

-- TABS
createTab("🏠 Menu",10,function()
    clear()
end)

createTab("⚡ Universal",60,function()
    clear()

    createToggle("Speed Safe",0,function(v)
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then h.WalkSpeed = v and 28 or 16 end
    end)

    createToggle("Jump Safe",50,function(v)
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then h.JumpPower = v and 75 or 50 end
    end)

    createToggle("Infinite Jump",100,function(v)
        _G.infJump = v
    end)
end)

createTab("👤 Player",110,function()
    clear()

    createToggle("No Ragdoll",0,function(v)
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then
            h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, not v)
            h:SetStateEnabled(Enum.HumanoidStateType.FallingDown, not v)
        end
    end)
end)

createTab("❌ Fechar",160,function()
    main.Visible = false
end)

-- INFINITE JUMP
game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.infJump then
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

open.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)
