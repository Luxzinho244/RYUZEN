--// Ryuzen Hub | Premium Build v3

if game.CoreGui:FindFirstChild("RyuzenHub") then
    game.CoreGui.RyuzenHub:Destroy()
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

-- ===== BLUR =====
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting
TweenService:Create(blur, TweenInfo.new(0.4), {Size = 18}):Play()

-- ===== GUI =====
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "RyuzenHub"
gui.ResetOnSpawn = false

-- ===== OPEN BUTTON =====
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

-- ===== MAIN =====
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,560,0,360)
main.Position = UDim2.new(0.5,-280,0.5,-180)
main.BackgroundColor3 = Color3.fromRGB(14,14,14)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,26)

-- ===== SHADOW =====
local shadow = Instance.new("ImageLabel", main)
shadow.Size = UDim2.new(1,40,1,40)
shadow.Position = UDim2.new(0,-20,0,-20)
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(120,0,0)
shadow.ImageTransparency = 0.6
shadow.BackgroundTransparency = 1
shadow.ZIndex = 0

-- ===== TOP =====
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,48)
top.BackgroundColor3 = Color3.fromRGB(120,0,0)
top.BorderSizePixel = 0
Instance.new("UICorner", top).CornerRadius = UDim.new(0,26)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,0,1,0)
title.Text = "🩸 R Y U Z E N  •  PREMIUM"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- ===== MENU =====
local menu = Instance.new("Frame", main)
menu.Size = UDim2.new(0,170,1,-48)
menu.Position = UDim2.new(0,0,0,48)
menu.BackgroundColor3 = Color3.fromRGB(18,18,18)
menu.BorderSizePixel = 0
Instance.new("UICorner", menu).CornerRadius = UDim.new(0,22)

-- ===== CONTENT =====
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,170,0,48)
content.Size = UDim2.new(1,-170,1,-48)
content.BackgroundTransparency = 1

-- ===== UTILS =====
local function clear()
    for _,v in pairs(content:GetChildren()) do
        v:Destroy()
    end
end

-- ===== TAB BUTTON =====
local function tab(text,y,callback)
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
    b.MouseButton1Click:Connect(callback)
end

-- ===== TOGGLE =====
local function toggle(text,y,func)
    local h = Instance.new("Frame", content)
    h.Size = UDim2.new(0,330,0,46)
    h.Position = UDim2.new(0,20,0,y)
    h.BackgroundTransparency = 1

    local l = Instance.new("TextLabel", h)
    l.Size = UDim2.new(0.65,0,1,0)
    l.Text = text
    l.TextColor3 = Color3.new(1,1,1)
    l.Font = Enum.Font.Gotham
    l.TextSize = 14
    l.BackgroundTransparency = 1

    local t = Instance.new("Frame", h)
    t.Size = UDim2.new(0,56,0,26)
    t.Position = UDim2.new(1,-66,0.5,-13)
    t.BackgroundColor3 = Color3.fromRGB(90,0,0)
    t.BorderSizePixel = 0
    Instance.new("UICorner", t).CornerRadius = UDim.new(1,0)

    local b = Instance.new("Frame", t)
    b.Size = UDim2.new(0,22,0,22)
    b.Position = UDim2.new(0,2,0.5,-11)
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
        TweenService:Create(t, TweenInfo.new(0.25), {
            BackgroundColor3 = state and Color3.fromRGB(0,180,0) or Color3.fromRGB(90,0,0)
        }):Play()
        TweenService:Create(b, TweenInfo.new(0.25), {
            Position = state and UDim2.new(1,-24,0.5,-11) or UDim2.new(0,2,0.5,-11)
        }):Play()
        func(state)
    end)
end

-- ===== FEATURES =====
local infJump, noclip, noFall = false,false,false

UIS.JumpRequest:Connect(function()
    if infJump then
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip and player.Character then
        for _,v in pairs(player.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- ===== TABS =====
tab("🏠 Home",10,function()
    clear()
end)

tab("⚡ Universal",60,function()
    clear()

    toggle("Speed Safe",0,function(v)
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then h.WalkSpeed = v and 30 or 16 end
    end)

    toggle("Jump Safe",55,function(v)
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then h.JumpPower = v and 80 or 50 end
    end)

    toggle("Infinite Jump",110,function(v)
        infJump = v
    end)

    toggle("No Fall Damage",165,function(v)
        noFall = v
    end)
end)

tab("👤 Player",120,function()
    clear()

    toggle("No Ragdoll",0,function(v)
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then
            h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, not v)
            h:SetStateEnabled(Enum.HumanoidStateType.FallingDown, not v)
        end
    end)

    toggle("Noclip",55,function(v)
        noclip = v
    end)
end)

tab("❌ Close",180,function()
    TweenService:Create(blur, TweenInfo.new(0.3), {Size = 0}):Play()
    main.Visible = false
end)

open.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)
