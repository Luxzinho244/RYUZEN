-- ⛩️ RYUZEN HUB | MENU COM ABAS
-- Dark + Red | Mobile + PC | Estável

if game.CoreGui:FindFirstChild("RyuzenHub") then
    game.CoreGui.RyuzenHub:Destroy()
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "RyuzenHub"
gui.ResetOnSpawn = false

-- OPEN BUTTON
local open = Instance.new("TextButton", gui)
open.Size = UDim2.new(0,150,0,40)
open.Position = UDim2.new(0,20,0.5,-20)
open.Text = "RYUZEN"
open.Font = Enum.Font.GothamBold
open.TextSize = 14
open.TextColor3 = Color3.new(1,1,1)
open.BackgroundColor3 = Color3.fromRGB(140,0,0)
open.BorderSizePixel = 0
open.Active = true
open.Draggable = true
Instance.new("UICorner", open).CornerRadius = UDim.new(1,0)

-- MAIN
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,560,0,360)
main.Position = UDim2.new(0.5,-280,0.5,-180)
main.BackgroundColor3 = Color3.fromRGB(15,15,15)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,24)

-- TOP
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,48)
top.BackgroundColor3 = Color3.fromRGB(120,0,0)
top.BorderSizePixel = 0
Instance.new("UICorner", top).CornerRadius = UDim.new(0,24)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,0,1,0)
title.Text = "⛩️ RYUZEN HUB | MENU COM ABAS"
title.Font = Enum.Font.GothamBold
title.TextSize = 15
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- MENU
local menu = Instance.new("Frame", main)
menu.Size = UDim2.new(0,170,1,-48)
menu.Position = UDim2.new(0,0,0,48)
menu.BackgroundColor3 = Color3.fromRGB(18,18,18)
menu.BorderSizePixel = 0
Instance.new("UICorner", menu).CornerRadius = UDim.new(0,20)

-- CONTENT
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,170,0,48)
content.Size = UDim2.new(1,-170,1,-48)
content.BackgroundTransparency = 1

-- UTILS
local function clear()
    for _,v in pairs(content:GetChildren()) do
        v:Destroy()
    end
end

-- CARD
local function createCard(titleText, y, height)
    local card = Instance.new("Frame", content)
    card.Size = UDim2.new(0,360,0,height)
    card.Position = UDim2.new(0,20,0,y)
    card.BackgroundColor3 = Color3.fromRGB(22,22,22)
    card.BorderSizePixel = 0
    Instance.new("UICorner", card).CornerRadius = UDim.new(0,18)

    local stroke = Instance.new("UIStroke", card)
    stroke.Color = Color3.fromRGB(120,0,0)
    stroke.Transparency = 0.5

    local t = Instance.new("TextLabel", card)
    t.Size = UDim2.new(1,-20,0,30)
    t.Position = UDim2.new(0,10,0,8)
    t.Text = titleText
    t.Font = Enum.Font.GothamBold
    t.TextSize = 14
    t.TextColor3 = Color3.new(1,1,1)
    t.BackgroundTransparency = 1

    return card
end

-- TOGGLE
local function toggle(text, parent, y, callback)
    local label = Instance.new("TextLabel", parent)
    label.Size = UDim2.new(0.6,0,0,30)
    label.Position = UDim2.new(0,15,0,y)
    label.Text = text
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextColor3 = Color3.new(1,1,1)
    label.BackgroundTransparency = 1

    local t = Instance.new("Frame", parent)
    t.Size = UDim2.new(0,52,0,24)
    t.Position = UDim2.new(1,-70,0,y+3)
    t.BackgroundColor3 = Color3.fromRGB(90,0,0)
    t.BorderSizePixel = 0
    Instance.new("UICorner", t).CornerRadius = UDim.new(1,0)

    local b = Instance.new("Frame", t)
    b.Size = UDim2.new(0,20,0,20)
    b.Position = UDim2.new(0,2,0.5,-10)
    b.BackgroundColor3 = Color3.new(1,1,1)
    b.BorderSizePixel = 0
    Instance.new("UICorner", b).CornerRadius = UDim.new(1,0)

    local btn = Instance.new("TextButton", t)
    btn.Size = UDim2.new(1,0,1,0)
    btn.Text = ""
    btn.BackgroundTransparency = 1

    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(t,TweenInfo.new(0.2),{
            BackgroundColor3 = state and Color3.fromRGB(0,170,0) or Color3.fromRGB(90,0,0)
        }):Play()
        TweenService:Create(b,TweenInfo.new(0.2),{
            Position = state and UDim2.new(1,-22,0.5,-10) or UDim2.new(0,2,0.5,-10)
        }):Play()
        callback(state)
    end)
end

-- TAB BUTTON
local function tab(text,y,func)
    local b = Instance.new("TextButton", menu)
    b.Size = UDim2.new(1,-20,0,42)
    b.Position = UDim2.new(0,10,0,y)
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(35,0,0)
    b.BorderSizePixel = 0
    Instance.new("UICorner", b).CornerRadius = UDim.new(1,0)
    b.MouseButton1Click:Connect(func)
end

-- FEATURES
local infJump, noclip = false,false

UIS.JumpRequest:Connect(function()
    if infJump then
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

RunService.Stepped:Connect(function()
    if noclip and player.Character then
        for _,v in pairs(player.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- HOME
tab("🏠 Menu",10,function()
    clear()
    local c = createCard("Informações",0,120)

    local info = Instance.new("TextLabel", c)
    info.Size = UDim2.new(1,-20,0,70)
    info.Position = UDim2.new(0,10,0,40)
    info.Text = "Status: Ativo\nVersão: Premium\nCompatível: Mobile + PC\nLoader: OK"
    info.TextWrapped = true
    info.TextYAlignment = Top
    info.Font = Enum.Font.Gotham
    info.TextSize = 13
    info.TextColor3 = Color3.fromRGB(200,200,200)
    info.BackgroundTransparency = 1
end)

-- UNIVERSAL
tab("⚡ Universal",60,function()
    clear()

    local move = createCard("Movimentação",0,150)

    toggle("Speed Safe",move,40,function(v)
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then h.WalkSpeed = v and 30 or 16 end
    end)

    toggle("Jump Safe",move,80,function(v)
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then h.JumpPower = v and 80 or 50 end
    end)

    local misc = createCard("Extras",170,130)

    toggle("Infinite Jump",misc,40,function(v)
        infJump = v
    end)

    toggle("Noclip",misc,80,function(v)
        noclip = v
    end)
end)

-- CLOSE
tab("❌ Fechar",120,function()
    main.Visible = false
end)

open.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)
