--// Ryuzen Hub | Universal Base
--// Criado para evolução futura

if game.CoreGui:FindFirstChild("RyuzenHub") then
    game.CoreGui.RyuzenHub:Destroy()
end

-- Serviços
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "RyuzenHub"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Botão Abrir
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 120, 0, 35)
openBtn.Position = UDim2.new(0, 20, 0.5, -17)
openBtn.Text = "R Y U Z E N"
openBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openBtn.BorderSizePixel = 0
openBtn.Font = Enum.Font.GothamBold
openBtn.TextSize = 14
openBtn.Active = true
openBtn.Draggable = true

-- Janela Principal
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 480, 0, 300)
main.Position = UDim2.new(0.5, -240, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Visible = true
main.Active = true
main.Draggable = true

-- Top Bar
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1, 0, 0, 40)
top.BackgroundColor3 = Color3.fromRGB(90, 0, 0)
top.BorderSizePixel = 0

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1, 0, 1, 0)
title.Text = "🩸 R Y U Z E N   H U B"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16

-- Conteúdo
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0, 120, 0, 40)
content.Size = UDim2.new(1, -120, 1, -40)
content.BackgroundTransparency = 1

-- Menu Lateral
local menu = Instance.new("Frame", main)
menu.Size = UDim2.new(0, 120, 1, -40)
menu.Position = UDim2.new(0, 0, 0, 40)
menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

-- Função botão
local function createTab(text, yPos, callback)
    local btn = Instance.new("TextButton", menu)
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.BorderSizePixel = 0
    btn.MouseButton1Click:Connect(callback)
end

-- Limpar conteúdo
local function clear()
    for _,v in pairs(content:GetChildren()) do
        v:Destroy()
    end
end

-- Abas
createTab("🏠 Menu", 0, function()
    clear()
    local label = Instance.new("TextLabel", content)
    label.Size = UDim2.new(1,0,1,0)
    label.Text = "Bem-vindo ao Ryuzen Hub\n\nScript Universal em desenvolvimento."
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.TextWrapped = true
end)

createTab("⚡ Universal", 40, function()
    clear()
    local speed = Instance.new("TextButton", content)
    speed.Size = UDim2.new(0,200,0,40)
    speed.Position = UDim2.new(0,20,0,20)
    speed.Text = "Speed Boost"
    speed.BackgroundColor3 = Color3.fromRGB(120,0,0)
    speed.TextColor3 = Color3.fromRGB(255,255,255)
    speed.Font = Enum.Font.GothamBold
    speed.TextSize = 14
    speed.BorderSizePixel = 0

    speed.MouseButton1Click:Connect(function()
        player.Character.Humanoid.WalkSpeed = 50
    end)
end)

createTab("👤 Player", 80, function()
    clear()
    local jump = Instance.new("TextButton", content)
    jump.Size = UDim2.new(0,200,0,40)
    jump.Position = UDim2.new(0,20,0,20)
    jump.Text = "Jump Power"
    jump.BackgroundColor3 = Color3.fromRGB(120,0,0)
    jump.TextColor3 = Color3.fromRGB(255,255,255)
    jump.Font = Enum.Font.GothamBold
    jump.TextSize = 14
    jump.BorderSizePixel = 0

    jump.MouseButton1Click:Connect(function()
        player.Character.Humanoid.JumpPower = 100
    end)
end)

createTab("❌ Fechar", 120, function()
    main.Visible = false
end)

-- Abrir / Fechar
openBtn.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)
