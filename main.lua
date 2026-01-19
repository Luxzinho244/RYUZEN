-- ⛩️ RYUZEN HUB | MENU COM ABAS
-- Dark + Red | Estilo Samurai/Masculino
-- By Coffee & Frost

if getgenv().RYUZEN_LOADED then return end
getgenv().RYUZEN_LOADED = true

-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- VARIÁVEIS GLOBAIS PARA FUNCIONALIDADES
local noclip = false
local flying = false
local speedHack = false
local speedValue = 50
local infJump = false
local antiAfk = false
local espEnabled = false
local rainbowMode = false
local aimbotEnabled = false

-- CONFIGURAÇÕES RYUZEN
local CONFIG = {
    Theme = {
        Primary = Color3.fromRGB(10, 10, 10),
        Secondary = Color3.fromRGB(20, 20, 20),
        Accent = Color3.fromRGB(180, 0, 0),
        Highlight = Color3.fromRGB(220, 0, 0),
        Danger = Color3.fromRGB(255, 50, 50),
        Text = Color3.fromRGB(240, 240, 240),
        DarkText = Color3.fromRGB(150, 150, 150)
    }
}

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "RYUZEN_HUB_V45"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 600, 0, 350)
main.Position = UDim2.new(0.5, -300, 0.5, -175)
main.BackgroundColor3 = CONFIG.Theme.Primary
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.ZIndex = 10

local stroke = Instance.new("UIStroke", main)
stroke.Color = CONFIG.Theme.Accent
stroke.Thickness = 3

-- HEADER
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
header.BorderSizePixel = 0

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(0.6, 0, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "🐉 RYUZEN HUB V4.5 🐉"
title.Font = Enum.Font.GothamBlack
title.TextSize = 22
title.TextColor3 = CONFIG.Theme.Highlight
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

-- AVISO DE METEOROS
local warningFrame = Instance.new("Frame", header)
warningFrame.Size = UDim2.new(0.35, 0, 0, 25)
warningFrame.Position = UDim2.new(0.65, 0, 0.5, -12.5)
warningFrame.BackgroundColor3 = CONFIG.Theme.Danger
warningFrame.BorderSizePixel = 0

local warningText = Instance.new("TextLabel", warningFrame)
warningText.Size = UDim2.new(1, 0, 1, 0)
warningText.Text = "⚠️ CHUVA DE METEOROS! ⚠️"
warningText.Font = Enum.Font.GothamBold
warningText.TextSize = 11
warningText.TextColor3 = Color3.fromRGB(255, 255, 200)
warningText.BackgroundTransparency = 1

-- ANIMAÇÃO PISCANTE DO AVISO
spawn(function()
    while true do
        warningFrame.Visible = not warningFrame.Visible
        task.wait(0.6)
    end
end)

-- BOTÃO FECHAR COM IMAGEM (X VERMELHO)
local closeBtn = Instance.new("ImageButton", header)
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -45, 0.5, -17.5)
closeBtn.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
closeBtn.BorderSizePixel = 1
closeBtn.BorderColor3 = CONFIG.Theme.Accent
closeBtn.AutoButtonColor = false
closeBtn.Image = "rbxassetid://3926305904"
closeBtn.ImageRectSize = Vector2.new(24, 24)
closeBtn.ImageRectOffset = Vector2.new(924, 724)
closeBtn.ScaleType = Enum.ScaleType.Fit

-- EFEITO HOVER NO BOTÃO FECHAR
closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(50, 0, 0),
        Rotation = 90
    }):Play()
end)

closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(30, 0, 0),
        Rotation = 0
    }):Play()
end)

-- SIDEBAR
local sidebar = Instance.new("Frame", main)
sidebar.Position = UDim2.new(0, 0, 0, 50)
sidebar.Size = UDim2.new(0, 200, 1, -50)
sidebar.BackgroundColor3 = CONFIG.Theme.Secondary
sidebar.BorderSizePixel = 0

local separator = Instance.new("Frame", sidebar)
separator.Size = UDim2.new(0, 2, 1, 0)
separator.Position = UDim2.new(1, -2, 0, 0)
separator.BackgroundColor3 = CONFIG.Theme.Accent
separator.BorderSizePixel = 0

-- ÁREA DE CONTEÚDO
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0, 200, 0, 50)
content.Size = UDim2.new(1, -200, 1, -50)
content.BackgroundColor3 = CONFIG.Theme.Primary
content.BorderSizePixel = 0

-- SISTEMA DE ABAS
local tabs = {}
local activeTab = nil

local function createTab(name, icon)
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.Position = UDim2.new(0, 5, 0, (#tabs * 40) + 10)
    btn.Text = icon .. "  " .. name:upper()
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextColor3 = CONFIG.Theme.DarkText
    btn.BackgroundColor3 = CONFIG.Theme.Secondary
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(40, 40, 40)
    btn.AutoButtonColor = false
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    local padding = Instance.new("UIPadding", btn)
    padding.PaddingLeft = UDim.new(0, 12)
    
    local frame = Instance.new("ScrollingFrame", content)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 4
    frame.ScrollBarImageColor3 = CONFIG.Theme.Accent
    frame.BorderSizePixel = 0
    frame.CanvasSize = UDim2.new(0, 0, 0, 0)
    frame.Visible = false
    
    local frameLayout = Instance.new("UIListLayout", frame)
    frameLayout.Padding = UDim.new(0, 8)
    frameLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    frameLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    tabs[name] = {button = btn, frame = frame}
    
    -- EFEITOS DO BOTÃO
    btn.MouseEnter:Connect(function()
        if activeTab ~= name then
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                TextColor3 = CONFIG.Theme.Text
            }):Play()
        end
    end)
    
    btn.MouseLeave:Connect(function()
        if activeTab ~= name then
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = CONFIG.Theme.Secondary,
                TextColor3 = CONFIG.Theme.DarkText
            }):Play()
        end
    end)
    
    btn.MouseButton1Click:Connect(function()
        if activeTab then
            tabs[activeTab].frame.Visible = false
            TweenService:Create(tabs[activeTab].button, TweenInfo.new(0.2), {
                BackgroundColor3 = CONFIG.Theme.Secondary,
                BorderColor3 = Color3.fromRGB(40, 40, 40),
                TextColor3 = CONFIG.Theme.DarkText
            }):Play()
        end
        
        frame.Visible = true
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = CONFIG.Theme.Accent,
            BorderColor3 = CONFIG.Theme.Highlight,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
        activeTab = name
    end)
    
    return frame
end

-- CRIAR ABAS (IGUAL FOTO)
local funTab = createTab("Fun", "🎮")
local avatarTab = createTab("Avatar", "👤")
local houseTab = createTab("House", "🏠")
local carTab = createTab("Car", "🚗")
local toolsTab = createTab("Tools", "🛠️")
local rgbTab = createTab("RGB", "🌈")
local musicAllTab = createTab("Music All", "🎵")
local musicTab = createTab("Music", "🎶")
local trollTab = createTab("Troll", "😈")

-- FUNÇÃO PARA CRIAR BOTÕES FUNCIONAIS
local function createFunctionalButton(parent, text, icon, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Text = icon .. "  " .. text:upper()
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.TextColor3 = CONFIG.Theme.Text
    btn.BackgroundColor3 = CONFIG.Theme.Secondary
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(50, 0, 0)
    btn.AutoButtonColor = false
    btn.LayoutOrder = #parent:GetChildren()
    
    local padding = Instance.new("UIPadding", btn)
    padding.PaddingLeft = UDim.new(0, 15)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    -- EFEITO HOVER
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(40, 0, 0),
            BorderColor3 = CONFIG.Theme.Accent
        }):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = CONFIG.Theme.Secondary,
            BorderColor3 = Color3.fromRGB(50, 0, 0)
        }):Play()
    end)
    
    -- EFEITO CLIQUE
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {
            BackgroundColor3 = CONFIG.Theme.Highlight
        }):Play()
        task.wait(0.1)
        TweenService:Create(btn, TweenInfo.new(0.1), {
            BackgroundColor3 = CONFIG.Theme.Secondary
        }):Play()
        
        if callback then
            pcall(callback)
        end
    end)
    
    return btn
end

-- FUNÇÕES DOS BOTÕES

-- FUNÇÃO FLY
local function toggleFly()
    flying = not flying
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    local rootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    
    if not humanoid or not rootPart then 
        warn("Character not found!")
        return 
    end
    
    if flying then
        local bodyVelocity = Instance.new("BodyVelocity", rootPart)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
        
        spawn(function()
            while flying and wait() do
                if humanoid then
                    local cam = workspace.CurrentCamera
                    local moveDir = Vector3.new(0, 0, 0)
                    
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        moveDir = moveDir + cam.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        moveDir = moveDir - cam.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        moveDir = moveDir + cam.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        moveDir = moveDir - cam.CFrame.RightVector
                    end
                    
                    bodyVelocity.Velocity = moveDir.Unit * 100
                end
            end
        end)
    else
        for _, v in pairs(rootPart:GetChildren()) do
            if v:IsA("BodyVelocity") then
                v:Destroy()
            end
        end
    end
end

-- FUNÇÃO NO CLIP
local function toggleNoclip()
    noclip = not noclip
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = not noclip
            end
        end
    end
end

-- FUNÇÃO SPEED HACK
local function toggleSpeed()
    speedHack = not speedHack
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        if speedHack then
            humanoid.WalkSpeed = speedValue
        else
            humanoid.WalkSpeed = 16
        end
    end
end

-- FUNÇÃO INFINITE JUMP
local function toggleInfJump()
    infJump = not infJump
    if infJump then
        player.Character:WaitForChild("Humanoid").JumpPower = 50
        UserInputService.JumpRequest:Connect(function()
            if infJump then
                player.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        player.Character:WaitForChild("Humanoid").JumpPower = 50
    end
end

-- FUNÇÃO ANTI-AFK
local function toggleAntiAFK()
    antiAfk = not antiAfk
    if antiAfk then
        local virtualUser = game:GetService('VirtualUser')
        spawn(function()
            while antiAfk do
                virtualUser:CaptureController()
                virtualUser:ClickButton2(Vector2.new())
                wait(30)
            end
        end)
    end
end

-- FUNÇÃO ESP (WALLHACK)
local function toggleESP()
    espEnabled = not espEnabled
    
    if espEnabled then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 100, 100)
                highlight.Parent = plr.Character
                highlight.Adornee = plr.Character
            end
        end
    else
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character then
                for _, obj in pairs(plr.Character:GetChildren()) do
                    if obj:IsA("Highlight") then
                        obj:Destroy()
                    end
                end
            end
        end
    end
end

-- FUNÇÃO COPY DISCORD
local function copyDiscord()
    setclipboard("https://discord.gg/zdDKdGbsZT")
    return "Discord link copiado!"
end

-- FUNÇÃO COPY TIKTOK
local function copyTikTok()
    setclipboard("@lolyta")
    return "TikTok @ copiado!"
end

-- BOTÕES NA ABA FUN
local funTitle = Instance.new("TextLabel", funTab)
funTitle.Size = UDim2.new(1, 0, 0, 40)
funTitle.Text = "🎮 FUNÇÕES PRINCIPAIS"
funTitle.Font = Enum.Font.GothamBlack
funTitle.TextSize = 18
funTitle.TextColor3 = CONFIG.Theme.Highlight
funTitle.BackgroundTransparency = 1
funTitle.LayoutOrder = 1

-- BOTÕES QUE FUNCIONAM
createFunctionalButton(funTab, "Fly Hack", "🕊️", toggleFly)
createFunctionalButton(funTab, "Noclip", "👻", toggleNoclip)
createFunctionalButton(funTab, "Speed Hack", "⚡", toggleSpeed)
createFunctionalButton(funTab, "Infinite Jump", "⬆️", toggleInfJump)
createFunctionalButton(funTab, "Anti-AFK", "🛡️", toggleAntiAFK)
createFunctionalButton(funTab, "ESP (Wallhack)", "👁️", toggleESP)

-- ÁREA DE CRÉDITOS
local creditsFrame = Instance.new("Frame", content)
creditsFrame.Size = UDim2.new(1, 0, 1, 0)
creditsFrame.BackgroundTransparency = 1
creditsFrame.Visible = false

local creditsLayout = Instance.new("UIListLayout", creditsFrame)
creditsLayout.Padding = UDim.new(0, 15)
creditsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
creditsLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- TÍTULO CRÉDITOS
local creditsTitle = Instance.new("TextLabel", creditsFrame)
creditsTitle.Size = UDim2.new(1, 0, 0, 40)
creditsTitle.Text = "🐉 RYUZEN CREDITS 🐉"
creditsTitle.Font = Enum.Font.GothamBlack
creditsTitle.TextSize = 22
creditsTitle.TextColor3 = CONFIG.Theme.Highlight
creditsTitle.BackgroundTransparency = 1
creditsTitle.LayoutOrder = 1

-- INFORMAÇÕES DA EQUIPE
local teamInfo = Instance.new("TextLabel", creditsFrame)
teamInfo.Size = UDim2.new(0.9, 0, 0, 60)
teamInfo.Text = "CRIADO POR:\nCOFFEE ☕ & FROST ❄️\n\nEQUIPE RYUZEN"
teamInfo.Font = Enum.Font.GothamBold
teamInfo.TextSize = 16
teamInfo.TextColor3 = CONFIG.Theme.Text
teamInfo.BackgroundTransparency = 1
teamInfo.TextYAlignment = Enum.TextYAlignment.Top
teamInfo.LayoutOrder = 2

-- DISCORD BUTTON
local discordBtn = createFunctionalButton(creditsFrame, "Discord Server", "💬", copyDiscord)
discordBtn.LayoutOrder = 3

-- TIKTOK BUTTON
local tiktokBtn = createFunctionalButton(creditsFrame, "Copiar TikTok @lolyta", "📱", copyTikTok)
tiktokBtn.LayoutOrder = 4

-- VERSÃO
local versionLabel = Instance.new("TextLabel", creditsFrame)
versionLabel.Size = UDim2.new(0.9, 0, 0, 25)
versionLabel.Text = "VERSÃO: HUB 4.5"
versionLabel.Font = Enum.Font.GothamBold
versionLabel.TextSize = 14
versionLabel.TextColor3 = CONFIG.Theme.DarkText
versionLabel.BackgroundTransparency = 1
versionLabel.LayoutOrder = 5

-- BOTÃO CRÉDITOS NA SIDEBAR
local creditsBtn = Instance.new("TextButton", sidebar)
creditsBtn.Size = UDim2.new(1, -10, 0, 35)
creditsBtn.Position = UDim2.new(0, 5, 1, -45)
creditsBtn.Text = "⭐  CREDITS"
creditsBtn.Font = Enum.Font.GothamBold
creditsBtn.TextSize = 12
creditsBtn.TextColor3 = CONFIG.Theme.DarkText
creditsBtn.BackgroundColor3 = CONFIG.Theme.Secondary
creditsBtn.BorderSizePixel = 1
creditsBtn.BorderColor3 = Color3.fromRGB(40, 40, 40)
creditsBtn.AutoButtonColor = false
creditsBtn.TextXAlignment = Enum.TextXAlignment.Left

local creditsPadding = Instance.new("UIPadding", creditsBtn)
creditsPadding.PaddingLeft = UDim.new(0, 12)

-- FUNÇÃO PARA MOSTRAR CRÉDITOS
creditsBtn.MouseButton1Click:Connect(function()
    for _, tab in pairs(tabs) do
        tab.frame.Visible = false
        TweenService:Create(tab.button, TweenInfo.new(0.2), {
            BackgroundColor3 = CONFIG.Theme.Secondary,
            BorderColor3 = Color3.fromRGB(40, 40, 40),
            TextColor3 = CONFIG.Theme.DarkText
        }):Play()
    end
    
    creditsFrame.Visible = true
    TweenService:Create(creditsBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = CONFIG.Theme.Accent,
        BorderColor3 = CONFIG.Theme.Highlight,
        TextColor3 = Color3.fromRGB(255, 255, 255)
    }):Play()
    activeTab = "Credits"
end)

-- ATIVAR PRIMEIRA ABA
tabs["Fun"].frame.Visible = true
activeTab = "Fun"
TweenService:Create(tabs["Fun"].button, TweenInfo.new(0.2), {
    BackgroundColor3 = CONFIG.Theme.Accent,
    BorderColor3 = CONFIG.Theme.Highlight,
    TextColor3 = Color3.fromRGB(255, 255, 255)
}):Play()

-- AJUSTAR CANVAS SIZE
for _, tab in pairs(tabs) do
    local layout = tab.frame:FindFirstChildOfClass("UIListLayout")
    if layout then
        layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tab.frame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
        end)
    end
end

-- BOTÃO PARA ABRIR COM IMAGEM (X VERMELHO)
local openBtn = Instance.new("ImageButton", gui)
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 20, 0, 20)
openBtn.BackgroundColor3 = CONFIG.Theme.Accent
openBtn.BorderSizePixel = 1
openBtn.BorderColor3 = CONFIG.Theme.Highlight
openBtn.AutoButtonColor = false
openBtn.Visible = false
openBtn.Image = "rbxassetid://3926305904"
openBtn.ImageRectSize = Vector2.new(36, 36)
openBtn.ImageRectOffset = Vector2.new(4, 964) -- Ícone de espada
openBtn.ScaleType = Enum.ScaleType.Fit

-- EFEITO HOVER NO BOTÃO ABRIR
openBtn.MouseEnter:Connect(function()
    TweenService:Create(openBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(150, 0, 0),
        Rotation = 10,
        Size = UDim2.new(0, 55, 0, 55)
    }):Play()
end)

openBtn.MouseLeave:Connect(function()
    TweenService:Create(openBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = CONFIG.Theme.Accent,
        Rotation = 0,
        Size = UDim2.new(0, 50, 0, 50)
    }):Play()
end)

-- EFEITO DE PULSAÇÃO NO BOTÃO ABRIR
spawn(function()
    while true do
        if openBtn.Visible then
            TweenService:Create(openBtn, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            }):Play()
        end
        task.wait(1)
        if openBtn.Visible then
            TweenService:Create(openBtn, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                BackgroundColor3 = CONFIG.Theme.Accent
            }):Play()
        end
        task.wait(1)
    end
end)

-- FUNÇÃO FECHAR (COM BOTÃO ABRIR)
closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(main, TweenInfo.new(0.3), {
        Position = UDim2.new(0.5, -300, -1, 0)
    }):Play()
    task.wait(0.3)
    main.Visible = false
    openBtn.Visible = true -- Mostra o botão de abrir (imagem)
end)

-- FUNÇÃO ABRIR
openBtn.MouseButton1Click:Connect(function()
    openBtn.Visible = false
    main.Visible = true
    TweenService:Create(main, TweenInfo.new(0.3), {
        Position = UDim2.new(0.5, -300, 0.5, -175)
    }):Play()
end)

-- KEYBIND (F1 PARA ABRIR/FECHAR)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        if main.Visible then
            closeBtn.MouseButton1Click:Fire()
        else
            openBtn.MouseButton1Click:Fire()
        end
    end
end)

-- INICIAR COM MENU ABERTO
main.Visible = true
openBtn.Visible = false

-- MENSAGEM NO CONSOLE
print("=======================================")
print("🐉 RYUZEN HUB V4.5 LOADED 🐉")
print("CRIADO POR: COFFEE ☕ & FROST ❄️")
print("PRESSIONE F1 PARA ABRIR/FECHAR")
print("=======================================")

return gui
