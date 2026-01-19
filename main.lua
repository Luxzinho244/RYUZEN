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

-- VARIÁVEIS GLOBAIS
local noclip = false
local flying = false
local flyConnection
local speedHack = false
local originalWalkSpeed = 16
local infJump = false
local antiAfk = false
local espEnabled = false

-- CONFIGURAÇÕES
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

-- ANIMAÇÃO PISCANTE
spawn(function()
    while true do
        warningFrame.Visible = not warningFrame.Visible
        task.wait(0.6)
    end
end)

-- BOTÃO FECHAR
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

-- SISTEMA DE ABAS SIMPLIFICADO
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
    
    -- CONECTAR CLIQUE
    btn.MouseButton1Click:Connect(function()
        if activeTab == name then return end
        
        -- Desativar aba atual
        if activeTab then
            tabs[activeTab].frame.Visible = false
            TweenService:Create(tabs[activeTab].button, TweenInfo.new(0.2), {
                BackgroundColor3 = CONFIG.Theme.Secondary,
                BorderColor3 = Color3.fromRGB(40, 40, 40),
                TextColor3 = CONFIG.Theme.DarkText
            }):Play()
        end
        
        -- Ativar nova aba
        frame.Visible = true
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = CONFIG.Theme.Accent,
            BorderColor3 = CONFIG.Theme.Highlight,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
        activeTab = name
    end)
    
    return frame, btn
end

-- CRIAR TODAS AS ABAS
local funTab, funBtn = createTab("Fun", "🎮")
local avatarTab, avatarBtn = createTab("Avatar", "👤")
local houseTab, houseBtn = createTab("House", "🏠")
local carTab, carBtn = createTab("Car", "🚗")
local toolsTab, toolsBtn = createTab("Tools", "🛠️")
local rgbTab, rgbBtn = createTab("RGB", "🌈")
local musicAllTab, musicAllBtn = createTab("Music All", "🎵")
local musicTab, musicBtn = createTab("Music", "🎶")
local trollTab, trollBtn = createTab("Troll", "😈")

-- FUNÇÃO PARA CRIAR BOTÕES
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
            local success, result = pcall(callback)
            if not success then
                warn("Erro: " .. result)
            end
        end
    end)
    
    return btn
end

-- ========== FUNÇÕES PRINCIPAIS ==========

-- FLY HACK MELHORADO
local function toggleFly()
    flying = not flying
    
    if flying then
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        local rootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        
        if humanoid and rootPart then
            humanoid.PlatformStand = true
            
            local bv = Instance.new("BodyVelocity")
            bv.Velocity = Vector3.new(0, 0, 0)
            bv.MaxForce = Vector3.new(4000, 4000, 4000)
            bv.P = 1250
            bv.Parent = rootPart
            
            local bg = Instance.new("BodyGyro")
            bg.MaxTorque = Vector3.new(50000, 50000, 50000)
            bg.P = 3000
            bg.D = 500
            bg.Parent = rootPart
            
            flyConnection = RunService.Heartbeat:Connect(function()
                if not flying or not player.Character then
                    if flyConnection then
                        flyConnection:Disconnect()
                        flyConnection = nil
                    end
                    return
                end
                
                local cam = workspace.CurrentCamera.CFrame
                bg.CFrame = cam
                
                local speed = 100
                local velocity = Vector3.new(0, 0, 0)
                
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    velocity = velocity + cam.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    velocity = velocity - cam.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    velocity = velocity - cam.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    velocity = velocity + cam.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    velocity = velocity + Vector3.new(0, 1, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    velocity = velocity - Vector3.new(0, 1, 0)
                end
                
                if velocity.Magnitude > 0 then
                    velocity = velocity.Unit * speed
                end
                
                bv.Velocity = velocity
            end)
            
            print("🕊️ Fly Hack ATIVADO - WASD + Espaço/Shift")
        end
    else
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            
            if humanoid then
                humanoid.PlatformStand = false
            end
            
            if rootPart then
                for _, v in pairs(rootPart:GetChildren()) do
                    if v:IsA("BodyVelocity") or v:IsA("BodyGyro") then
                        v:Destroy()
                    end
                end
            end
        end
        
        print("🕊️ Fly Hack DESATIVADO")
    end
end

-- SPEED HACK
local function toggleSpeed()
    speedHack = not speedHack
    
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        if speedHack then
            originalWalkSpeed = humanoid.WalkSpeed
            humanoid.WalkSpeed = 100
            print("⚡ Speed Hack ATIVADO (Velocidade: 100)")
        else
            humanoid.WalkSpeed = originalWalkSpeed
            print("⚡ Speed Hack DESATIVADO")
        end
    end
end

-- NO CLIP
local function toggleNoclip()
    noclip = not noclip
    print("👻 Noclip " .. (noclip and "ATIVADO" or "DESATIVADO"))
end

-- INFINITE JUMP
local function toggleInfJump()
    infJump = not infJump
    
    if infJump then
        local connection
        connection = UserInputService.JumpRequest:Connect(function()
            if infJump and player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
        
        getgenv().infJumpConnection = connection
        print("⬆️ Infinite Jump ATIVADO")
    else
        if getgenv().infJumpConnection then
            getgenv().infJumpConnection:Disconnect()
            getgenv().infJumpConnection = nil
        end
        print("⬆️ Infinite Jump DESATIVADO")
    end
end

-- ESP
local function toggleESP()
    espEnabled = not espEnabled
    
    if espEnabled then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 100, 100)
                highlight.FillTransparency = 0.5
                highlight.Parent = plr.Character
                highlight.Adornee = plr.Character
                highlight.Name = "RyuzESP"
            end
        end
        print("👁️ ESP ATIVADO")
    else
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character then
                for _, obj in pairs(plr.Character:GetChildren()) do
                    if obj.Name == "RyuzESP" and obj:IsA("Highlight") then
                        obj:Destroy()
                    end
                end
            end
        end
        print("👁️ ESP DESATIVADO")
    end
end

-- ========== FUNÇÕES DE TROLL (TODAS FUNCIONAIS) ==========

local function trollTeleportAll()
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if root then
        local count = 0
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local targetRoot = plr.Character:FindFirstChild("HumanoidRootPart")
                if targetRoot then
                    targetRoot.CFrame = root.CFrame
                    count = count + 1
                end
            end
        end
        print("😈 " .. count .. " jogadores teleportados para você!")
    else
        print("❌ Erro: Character não encontrado")
    end
end

local function trollLaunchPlayers()
    local count = 0
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            local root = plr.Character:FindFirstChild("HumanoidRootPart")
            
            if humanoid and root then
                humanoid.PlatformStand = true
                local bv = Instance.new("BodyVelocity")
                bv.Velocity = Vector3.new(0, 150, 0)
                bv.MaxForce = Vector3.new(0, math.huge, 0)
                bv.Parent = root
                game:GetService("Debris"):AddItem(bv, 1)
                count = count + 1
            end
        end
    end
    print("😈 " .. count .. " jogadores lançados para o alto!")
end

local function trollFreezeAll()
    local count = 0
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = true
                count = count + 1
            end
        end
    end
    print("❄️ " .. count .. " jogadores congelados!")
end

local function trollUnfreezeAll()
    local count = 0
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
                count = count + 1
            end
        end
    end
    print("🔥 " .. count .. " jogadores descongelados!")
end

local function trollSpinPlayers()
    local count = 0
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local root = plr.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local bg = Instance.new("BodyAngularVelocity")
                bg.AngularVelocity = Vector3.new(0, 50, 0)
                bg.MaxTorque = Vector3.new(0, math.huge, 0)
                bg.Parent = root
                game:GetService("Debris"):AddItem(bg, 3)
                count = count + 1
            end
        end
    end
    print("🌀 " .. count .. " jogadores girando!")
end

-- ========== FUNÇÕES DE AVATAR ==========

local function avatarGodMode()
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        print("👤 God Mode ATIVADO - Vida infinita")
    end
end

local function avatarInvisible()
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            elseif part:IsA("Decal") then
                part.Transparency = 1
            end
        end
        print("👤 Invisibilidade ATIVADA")
    end
end

local function avatarReset()
    if player.Character then
        player.Character:BreakJoints()
        print("👤 Avatar resetado!")
    end
end

-- ========== CONTEÚDO DAS ABAS ==========

-- ABA FUN
local funTitle = Instance.new("TextLabel", funTab)
funTitle.Size = UDim2.new(1, 0, 0, 40)
funTitle.Text = "🎮 FUNÇÕES PRINCIPAIS"
funTitle.Font = Enum.Font.GothamBlack
funTitle.TextSize = 18
funTitle.TextColor3 = CONFIG.Theme.Highlight
funTitle.BackgroundTransparency = 1
funTitle.LayoutOrder = 1

createFunctionalButton(funTab, "Fly Hack", "🕊️", toggleFly)
createFunctionalButton(funTab, "Speed Hack", "⚡", toggleSpeed)
createFunctionalButton(funTab, "Noclip", "👻", toggleNoclip)
createFunctionalButton(funTab, "Infinite Jump", "⬆️", toggleInfJump)
createFunctionalButton(funTab, "ESP (Wallhack)", "👁️", toggleESP)

-- ABA TROLL
local trollTitle = Instance.new("TextLabel", trollTab)
trollTitle.Size = UDim2.new(1, 0, 0, 40)
trollTitle.Text = "😈 FUNÇÕES DE TROLL"
trollTitle.Font = Enum.Font.GothamBlack
trollTitle.TextSize = 18
trollTitle.TextColor3 = CONFIG.Theme.Highlight
trollTitle.BackgroundTransparency = 1
trollTitle.LayoutOrder = 1

createFunctionalButton(trollTab, "Teleportar Todos", "📍", trollTeleportAll)
createFunctionalButton(trollTab, "Lançar Jogadores", "🚀", trollLaunchPlayers)
createFunctionalButton(trollTab, "Congelar Todos", "❄️", trollFreezeAll)
createFunctionalButton(trollTab, "Descongelar Todos", "🔥", trollUnfreezeAll)
createFunctionalButton(trollTab, "Girar Jogadores", "🌀", trollSpinPlayers)

-- ABA AVATAR
local avatarTitle = Instance.new("TextLabel", avatarTab)
avatarTitle.Size = UDim2.new(1, 0, 0, 40)
avatarTitle.Text = "👤 AVATAR"
avatarTitle.Font = Enum.Font.GothamBlack
avatarTitle.TextSize = 18
avatarTitle.TextColor3 = CONFIG.Theme.Highlight
avatarTitle.BackgroundTransparency = 1
avatarTitle.LayoutOrder = 1

createFunctionalButton(avatarTab, "God Mode", "🛡️", avatarGodMode)
createFunctionalButton(avatarTab, "Invisibilidade", "👻", avatarInvisible)
createFunctionalButton(avatarTab, "Reset Avatar", "🔄", avatarReset)

-- ABA MUSIC
local musicTitle = Instance.new("TextLabel", musicTab)
musicTitle.Size = UDim2.new(1, 0, 0, 40)
musicTitle.Text = "🎵 MÚSICA"
musicTitle.Font = Enum.Font.GothamBlack
musicTitle.TextSize = 18
musicTitle.TextColor3 = CONFIG.Theme.Highlight
musicTitle.BackgroundTransparency = 1
musicTitle.LayoutOrder = 1

createFunctionalButton(musicTab, "Tocar Música Épica", "🎶", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://276972217" -- Música genérica
    sound.Volume = 0.5
    sound.Looped = true
    sound.Parent = workspace
    sound:Play()
    print("🎵 Música tocando!")
end)

createFunctionalButton(musicTab, "Parar Todas Músicas", "⏹️", function()
    for _, sound in pairs(workspace:GetDescendants()) do
        if sound:IsA("Sound") then
            sound:Stop()
        end
    end
    print("🎵 Todas as músicas paradas!")
end)

-- ABA TOOLS
local toolsTitle = Instance.new("TextLabel", toolsTab)
toolsTitle.Size = UDim2.new(1, 0, 0, 40)
toolsTitle.Text = "🛠️ FERRAMENTAS"
toolsTitle.Font = Enum.Font.GothamBlack
toolsTitle.TextSize = 18
toolsTitle.TextColor3 = CONFIG.Theme.Highlight
toolsTitle.BackgroundTransparency = 1
toolsTitle.LayoutOrder = 1

createFunctionalButton(toolsTab, "Copiar Game ID", "🎮", function()
    setclipboard(tostring(game.PlaceId))
    print("🎮 Game ID copiado: " .. game.PlaceId)
end)

createFunctionalButton(toolsTab, "Copiar Job ID", "🔗", function()
    setclipboard(tostring(game.JobId))
    print("🔗 Job ID copiado: " .. game.JobId)
end)

-- ABA RGB
local rgbTitle = Instance.new("TextLabel", rgbTab)
rgbTitle.Size = UDim2.new(1, 0, 0, 40)
rgbTitle.Text = "🌈 RGB EFFECTS"
rgbTitle.Font = Enum.Font.GothamBlack
rgbTitle.TextSize = 18
rgbTitle.TextColor3 = CONFIG.Theme.Highlight
rgbTitle.BackgroundTransparency = 1
rgbTitle.LayoutOrder = 1

createFunctionalButton(rgbTab, "RGB Character", "🎨", function()
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                spawn(function()
                    while part and part.Parent do
                        part.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                        task.wait(0.1)
                    end
                end)
            end
        end
        print("🌈 RGB Character ativado!")
    end
end)

-- ABA CRÉDITOS (AGORA É UMA ABA NORMAL)
local creditsTab, creditsBtn = createTab("Créditos", "⭐")

local creditsTitle = Instance.new("TextLabel", creditsTab)
creditsTitle.Size = UDim2.new(1, 0, 0, 40)
creditsTitle.Text = "🐉 RYUZEN CREDITS 🐉"
creditsTitle.Font = Enum.Font.GothamBlack
creditsTitle.TextSize = 22
creditsTitle.TextColor3 = CONFIG.Theme.Highlight
creditsTitle.BackgroundTransparency = 1
creditsTitle.LayoutOrder = 1

local teamInfo = Instance.new("TextLabel", creditsTab)
teamInfo.Size = UDim2.new(0.9, 0, 0, 80)
teamInfo.Text = "CRIADO POR:\nCOFFEE ☕ & FROST ❄️\n\nEQUIPE RYUZEN\n\nVersão: HUB 4.5"
teamInfo.Font = Enum.Font.GothamBold
teamInfo.TextSize = 16
teamInfo.TextColor3 = CONFIG.Theme.Text
teamInfo.BackgroundTransparency = 1
teamInfo.TextYAlignment = Enum.TextYAlignment.Top
teamInfo.LayoutOrder = 2

createFunctionalButton(creditsTab, "Copiar Discord", "💬", function()
    setclipboard("https://discord.gg/zdDKdGbsZT")
    print("💬 Discord link copiado!")
end)

createFunctionalButton(creditsTab, "Copiar TikTok @lolyta", "📱", function()
    setclipboard("@lolyta")
    print("📱 TikTok @ copiado!")
end)

-- REMOVER A ANTIGA ABA DE CRÉDITOS DO FIM
creditsBtn.Position = UDim2.new(0, 5, 0, (10 * 40) + 10)

-- ATIVAR PRIMEIRA ABA
tabs["Fun"].frame.Visible = true
activeTab = "Fun"
TweenService:Create(funBtn, TweenInfo.new(0.2), {
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

-- BOTÃO PARA ABRIR
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
openBtn.ImageRectOffset = Vector2.new(4, 964)
openBtn.ScaleType = Enum.ScaleType.Fit

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

-- PULSAÇÃO
spawn(function()
    while true do
        if openBtn.Visible then
            TweenService:Create(openBtn, TweenInfo.new(1), {
                BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            }):Play()
        end
        task.wait(1)
        if openBtn.Visible then
            TweenService:Create(openBtn, TweenInfo.new(1), {
                BackgroundColor3 = CONFIG.Theme.Accent
            }):Play()
        end
        task.wait(1)
    end
end)

-- FUNÇÕES ABRIR/FECHAR
closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(main, TweenInfo.new(0.3), {
        Position = UDim2.new(0.5, -300, -1, 0)
    }):Play()
    task.wait(0.3)
    main.Visible = false
    openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
    openBtn.Visible = false
    main.Visible = true
    TweenService:Create(main, TweenInfo.new(0.3), {
        Position = UDim2.new(0.5, -300, 0.5, -175)
    }):Play()
end)

-- KEYBIND F1
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

-- NO CLIP AUTOMÁTICO
RunService.Stepped:Connect(function()
    if noclip and player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- ANTI-AFK AUTOMÁTICO
local antiAfkConnection
local function toggleAntiAFK()
    if antiAfkConnection then
        antiAfkConnection:Disconnect()
        antiAfkConnection = nil
        print("🛡️ Anti-AFK DESATIVADO")
    else
        local virtualUser = game:GetService('VirtualUser')
        antiAfkConnection = RunService.Heartbeat:Connect(function()
            virtualUser:CaptureController()
            virtualUser:ClickButton2(Vector2.new())
        end)
        print("🛡️ Anti-AFK ATIVADO")
    end
end

-- ADICIONAR ANTI-AFK NA ABA FUN
createFunctionalButton(funTab, "Anti-AFK", "🛡️", toggleAntiAFK)

-- INICIAR
main.Visible = true
openBtn.Visible = false

-- MENSAGEM NO CONSOLE
print("=======================================")
print("🐉 RYUZEN HUB V4.5 CARREGADO 🐉")
print("CRIADO POR: COFFEE ☕ & FROST ❄️")
print("PRESSIONE F1 PARA ABRIR/FECHAR")
print("=======================================")
print("🎮 CONTROLES FL
