-- ⛩️ RYUZEN HUB V4.5 LITE
-- By Coffee & Frost | Modo Leve & Design Premium

if getgenv().RYUZEN_LOADED then return end
getgenv().RYUZEN_LOADED = true

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

-- Variáveis globais (otimizadas)
local noclip = false
local flying = false
local speedHack = false
local infJump = false
local espEnabled = false
local aimbotEnabled = false
local clickTP = false
local nightVision = false
local chamsEnabled = false

-- CONFIGURAÇÕES PREMIUM
local CONFIG = {
    Theme = {
        Primary = Color3.fromRGB(8, 8, 8),           -- Preto mais escuro
        Secondary = Color3.fromRGB(25, 0, 0),        -- Vermelho escuro
        Accent = Color3.fromRGB(200, 0, 0),          -- Vermelho sangue
        Highlight = Color3.fromRGB(255, 40, 40),     -- Vermelho brilhante
        Text = Color3.fromRGB(245, 245, 245),        -- Branco puro
        DarkText = Color3.fromRGB(180, 180, 180),    -- Cinza claro
        Glow = Color3.fromRGB(255, 80, 80)           -- Brilho vermelho
    },
    Effects = {
        ShadowIntensity = 0.4,
        GlowIntensity = 0.2,
        AnimationSpeed = 0.15
    }
}

-- GUI PREMIUM
local gui = Instance.new("ScreenGui")
gui.Name = "RYUZEN_HUB_PREMIUM"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- FUNDO COM GRADIENTE
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundTransparency = 1

local gradient = Instance.new("UIGradient", bg)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 0, 5))
}
gradient.Rotation = 45

-- EFEITO DE PARTICULAS NO FUNDO (leve)
for i = 1, 5 do
    local particle = Instance.new("Frame", bg)
    particle.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    particle.BorderSizePixel = 0
    particle.BackgroundTransparency = 0.7
    
    spawn(function()
        while particle do
            particle.Position = UDim2.new(
                (math.sin(tick() * 0.3 + i) * 0.1) + 0.5,
                math.random(-300, 300),
                (math.cos(tick() * 0.2 + i) * 0.1) + 0.5,
                math.random(-300, 300)
            )
            task.wait(0.1)
        end
    end)
end

-- MAIN FRAME COM DESIGN PREMIUM
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 620, 0, 380)
main.Position = UDim2.new(0.5, -310, 0.5, -190)
main.BackgroundColor3 = CONFIG.Theme.Primary
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.ZIndex = 20
main.ClipsDescendants = true

-- BORDA COM GRADIENTE
local border = Instance.new("UIStroke", main)
border.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, CONFIG.Theme.Accent),
    ColorSequenceKeypoint.new(0.5, CONFIG.Theme.Highlight),
    ColorSequenceKeypoint.new(1, CONFIG.Theme.Accent)
}
border.Thickness = 3
border.LineJoinMode = Enum.LineJoinMode.Round

-- GLOW EFFECT
local glow = Instance.new("ImageLabel", main)
glow.Size = UDim2.new(1, 40, 1, 40)
glow.Position = UDim2.new(-0.032, 0, -0.032, 0)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://8992234291"
glow.ImageColor3 = CONFIG.Theme.Glow
glow.ImageTransparency = 0.9
glow.ScaleType = Enum.ScaleType.Slice
glow.SliceCenter = Rect.new(100, 100, 100, 100)
glow.SliceScale = 0.02
glow.ZIndex = 19

-- HEADER PREMIUM
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 55)
header.BackgroundColor3 = CONFIG.Theme.Secondary
header.BorderSizePixel = 0
header.ZIndex = 25

-- GRADIENTE NO HEADER
local headerGradient = Instance.new("UIGradient", header)
headerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 0, 0))
}
headerGradient.Rotation = 90

-- TÍTULO COM EFEITO
local titleContainer = Instance.new("Frame", header)
titleContainer.Size = UDim2.new(0.6, 0, 1, 0)
titleContainer.Position = UDim2.new(0, 15, 0, 0)
titleContainer.BackgroundTransparency = 1

local title = Instance.new("TextLabel", titleContainer)
title.Size = UDim2.new(1, 0, 1, 0)
title.Text = "⚔️ RYUZEN HUB PREMIUM ⚔️"
title.Font = Enum.Font.GothamBlack
title.TextSize = 20
title.TextColor3 = CONFIG.Theme.Highlight
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextStrokeTransparency = 0.7
title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- ANIMAÇÃO NO TÍTULO
spawn(function()
    while true do
        TweenService:Create(title, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
            TextColor3 = Color3.fromRGB(255, 80, 80)
        }):Play()
        task.wait(1.5)
        TweenService:Create(title, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
            TextColor3 = CONFIG.Theme.Highlight
        }):Play()
        task.wait(1.5)
    end
end)

-- BOTÃO FECHAR PREMIUM
local closeBtn = Instance.new("ImageButton", header)
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -50, 0.5, -20)
closeBtn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
closeBtn.BorderSizePixel = 0
closeBtn.AutoButtonColor = false
closeBtn.ZIndex = 26
closeBtn.Image = "rbxassetid://3926305904"
closeBtn.ImageRectSize = Vector2.new(36, 36)
closeBtn.ImageRectOffset = Vector2.new(884, 284) -- X vermelho mais bonito
closeBtn.ScaleType = Enum.ScaleType.Fit

-- EFEITO 3D NO BOTÃO FECHAR
local closeGlow = Instance.new("Frame", closeBtn)
closeGlow.Size = UDim2.new(1, 0, 1, 0)
closeGlow.BackgroundColor3 = CONFIG.Theme.Highlight
closeGlow.BorderSizePixel = 0
closeGlow.BackgroundTransparency = 0.8
closeGlow.ZIndex = -1

closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(60, 0, 0),
        Rotation = 180,
        Size = UDim2.new(0, 42, 0, 42)
    }):Play()
    TweenService:Create(closeGlow, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.5
    }):Play()
end)

closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(40, 0, 0),
        Rotation = 0,
        Size = UDim2.new(0, 40, 0, 40)
    }):Play()
    TweenService:Create(closeGlow, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.8
    }):Play()
end)

-- SIDEBAR PREMIUM
local sidebar = Instance.new("Frame", main)
sidebar.Position = UDim2.new(0, 0, 0, 55)
sidebar.Size = UDim2.new(0, 200, 1, -55)
sidebar.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
sidebar.BorderSizePixel = 0
sidebar.ZIndex = 22

-- SEPARADOR DINÂMICO
local separator = Instance.new("Frame", sidebar)
separator.Size = UDim2.new(0, 3, 1, 0)
separator.Position = UDim2.new(1, -3, 0, 0)
separator.BackgroundColor3 = CONFIG.Theme.Accent
separator.BorderSizePixel = 0

-- ANIMAÇÃO NO SEPARADOR
spawn(function()
    while true do
        TweenService:Create(separator, TweenInfo.new(1), {
            BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        }):Play()
        task.wait(1)
        TweenService:Create(separator, TweenInfo.new(1), {
            BackgroundColor3 = CONFIG.Theme.Accent
        }):Play()
        task.wait(1)
    end
end)

-- ÁREA DE CONTEÚDO
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0, 200, 0, 55)
content.Size = UDim2.new(1, -200, 1, -55)
content.BackgroundColor3 = CONFIG.Theme.Primary
content.BorderSizePixel = 0
content.ZIndex = 21

-- DECORAÇÃO NO CONTEÚDO
local pattern = Instance.new("ImageLabel", content)
pattern.Size = UDim2.new(1, 0, 1, 0)
pattern.Image = "rbxassetid://11144540292" -- Textura sutil
pattern.ImageTransparency = 0.97
pattern.BackgroundTransparency = 1
pattern.ScaleType = Enum.ScaleType.Tile
pattern.TileSize = UDim2.new(0, 100, 0, 100)

-- SISTEMA DE ABAS PREMIUM
local tabs = {}
local activeTab = nil

local function createTab(name, icon, color)
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(1, -10, 0, 38)
    btn.Position = UDim2.new(0, 5, 0, (#tabs * 42) + 10)
    btn.Text = icon .. "  " .. name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.TextColor3 = CONFIG.Theme.DarkText
    btn.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.ZIndex = 23
    
    local padding = Instance.new("UIPadding", btn)
    padding.PaddingLeft = UDim.new(0, 15)
    
    -- GLOW NO BOTÃO
    local btnGlow = Instance.new("Frame", btn)
    btnGlow.Size = UDim2.new(1, 0, 1, 0)
    btnGlow.BackgroundColor3 = color or CONFIG.Theme.Accent
    btnGlow.BorderSizePixel = 0
    btnGlow.BackgroundTransparency = 0.9
    btnGlow.ZIndex = 22
    
    local frame = Instance.new("ScrollingFrame", content)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 4
    frame.ScrollBarImageColor3 = CONFIG.Theme.Accent
    frame.BorderSizePixel = 0
    frame.CanvasSize = UDim2.new(0, 0, 0, 0)
    frame.Visible = false
    frame.ZIndex = 22
    
    local frameLayout = Instance.new("UIListLayout", frame)
    frameLayout.Padding = UDim.new(0, 10)
    frameLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    frameLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    tabs[name] = {button = btn, frame = frame, glow = btnGlow}
    
    -- EFEITOS PREMIUM NO BOTÃO
    btn.MouseEnter:Connect(function()
        if activeTab ~= name then
            TweenService:Create(btn, TweenInfo.new(0.15), {
                BackgroundColor3 = Color3.fromRGB(35, 0, 0),
                TextColor3 = CONFIG.Theme.Text
            }):Play()
            TweenService:Create(btnGlow, TweenInfo.new(0.15), {
                BackgroundTransparency = 0.7
            }):Play()
        end
    end)
    
    btn.MouseLeave:Connect(function()
        if activeTab ~= name then
            TweenService:Create(btn, TweenInfo.new(0.15), {
                BackgroundColor3 = Color3.fromRGB(25, 0, 0),
                TextColor3 = CONFIG.Theme.DarkText
            }):Play()
            TweenService:Create(btnGlow, TweenInfo.new(0.15), {
                BackgroundTransparency = 0.9
            }):Play()
        end
    end)
    
    btn.MouseButton1Click:Connect(function()
        if activeTab == name then return end
        
        -- Desativar aba atual
        if activeTab then
            tabs[activeTab].frame.Visible = false
            TweenService:Create(tabs[activeTab].button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(25, 0, 0),
                TextColor3 = CONFIG.Theme.DarkText
            }):Play()
            TweenService:Create(tabs[activeTab].glow, TweenInfo.new(0.2), {
                BackgroundTransparency = 0.9
            }):Play()
        end
        
        -- Ativar nova aba
        frame.Visible = true
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = color or CONFIG.Theme.Accent,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
        TweenService:Create(btnGlow, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.3
        }):Play()
        activeTab = name
    end)
    
    return frame
end

-- CRIAR ABAS COM CORES DIFERENTES
local funTab = createTab("Hacks", "⚡", Color3.fromRGB(220, 0, 0))
local visualTab = createTab("Visual", "👁️", Color3.fromRGB(0, 150, 220))
local moveTab = createTab("Movimento", "🏃", Color3.fromRGB(0, 200, 100))
local trollTab = createTab("Troll", "😈", Color3.fromRGB(200, 0, 200))
local utilTab = createTab("Utilitários", "🛠️", Color3.fromRGB(220, 150, 0))
local creditsTab = createTab("Créditos", "⭐", Color3.fromRGB(255, 200, 0))

-- FUNÇÃO PARA CRIAR BOTÕES PREMIUM
local function createPremiumButton(parent, text, icon, color, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.92, 0, 0, 42)
    btn.Text = icon .. "  " .. text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = CONFIG.Theme.Text
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.LayoutOrder = #parent:GetChildren()
    btn.ZIndex = 23
    
    local padding = Instance.new("UIPadding", btn)
    padding.PaddingLeft = UDim.new(0, 20)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    -- BORDA COLORIDA
    local btnBorder = Instance.new("Frame", btn)
    btnBorder.Size = UDim2.new(0, 4, 1, 0)
    btnBorder.Position = UDim2.new(0, 0, 0, 0)
    btnBorder.BackgroundColor3 = color or CONFIG.Theme.Accent
    btnBorder.BorderSizePixel = 0
    btnBorder.ZIndex = 24
    
    -- GLOW
    local btnGlow = Instance.new("Frame", btn)
    btnGlow.Size = UDim2.new(1, 0, 1, 0)
    btnGlow.BackgroundColor3 = color or CONFIG.Theme.Accent
    btnGlow.BorderSizePixel = 0
    btnGlow.BackgroundTransparency = 0.9
    btnGlow.ZIndex = 22
    
    -- EFEITOS
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
            Size = UDim2.new(0.93, 0, 0, 44)
        }):Play()
        TweenService:Create(btnBorder, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        }):Play()
        TweenService:Create(btnGlow, TweenInfo.new(0.15), {
            BackgroundTransparency = 0.6
        }):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(30, 30, 30),
            Size = UDim2.new(0.92, 0, 0, 42)
        }):Play()
        TweenService:Create(btnBorder, TweenInfo.new(0.15), {
            BackgroundColor3 = color or CONFIG.Theme.Accent
        }):Play()
        TweenService:Create(btnGlow, TweenInfo.new(0.15), {
            BackgroundTransparency = 0.9
        }):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        -- Efeito de clique
        TweenService:Create(btn, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        }):Play()
        TweenService:Create(btnBorder, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
        task.wait(0.1)
        TweenService:Create(btn, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        }):Play()
        TweenService:Create(btnBorder, TweenInfo.new(0.1), {
            BackgroundColor3 = color or CONFIG.Theme.Accent
        }):Play()
        
        -- Executar função
        if callback then
            local success, err = pcall(callback)
            if not success then
                warn("[RYUZEN] Erro: " .. err)
            end
        end
    end)
    
    return btn
end

-- ========== FUNÇÕES LEVES E OTIMIZADAS ==========

-- 1. FLY HACK OTIMIZADO
local function toggleFly()
    flying = not flying
    
    if flying then
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local bv = Instance.new("BodyVelocity")
            bv.Velocity = Vector3.new(0, 0, 0)
            bv.MaxForce = Vector3.new(4000, 4000, 4000)
            bv.Parent = root
            
            spawn(function()
                while flying and root do
                    local cam = workspace.CurrentCamera.CFrame
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
                    
                    bv.Velocity = velocity.Unit * 100
                    task.wait()
                end
            end)
        end
    else
        if player.Character then
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                for _, v in pairs(root:GetChildren()) do
                    if v:IsA("BodyVelocity") then
                        v:Destroy()
                    end
                end
            end
        end
    end
    print("🕊️ Fly Hack " .. (flying and "ATIVADO" or "DESATIVADO"))
end

-- 2. SPEED HACK
local function toggleSpeed()
    speedHack = not speedHack
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = speedHack and 100 or 16
        print("⚡ Speed Hack " .. (speedHack and "ATIVADO" or "DESATIVADO"))
    end
end

-- 3. INFINITE JUMP
local function toggleInfJump()
    infJump = not infJump
    if infJump then
        UserInputService.JumpRequest:Connect(function()
            if infJump and player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
    end
    print("⬆️ Infinite Jump " .. (infJump and "ATIVADO" or "DESATIVADO"))
end

-- 4. ESP LEVE
local function toggleESP()
    espEnabled = not espEnabled
    
    if espEnabled then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 100, 100)
                highlight.FillTransparency = 0.6
                highlight.Parent = plr.Character
                highlight.Name = "RyuzESP"
            end
        end
    else
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character then
                for _, obj in pairs(plr.Character:GetChildren()) do
                    if obj.Name == "RyuzESP" then
                        obj:Destroy()
                    end
                end
            end
        end
    end
    print("👁️ ESP " .. (espEnabled and "ATIVADO" or "DESATIVADO"))
end

-- 5. AIMBOT SIMPLES
local function toggleAimbot()
    aimbotEnabled = not aimbotEnabled
    
    if aimbotEnabled then
        spawn(function()
            while aimbotEnabled do
                local closestPlayer = nil
                local closestDistance = math.huge
                local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                
                if root then
                    for _, plr in pairs(Players:GetPlayers()) do
                        if plr ~= player and plr.Character then
                            local targetRoot = plr.Character:FindFirstChild("HumanoidRootPart")
                            if targetRoot then
                                local distance = (root.Position - targetRoot.Position).Magnitude
                                if distance < closestDistance then
                                    closestDistance = distance
                                    closestPlayer = plr
                                end
                            end
                        end
                    end
                    
                    if closestPlayer and closestPlayer.Character then
                        local target = closestPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if target and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                            workspace.CurrentCamera.CFrame = CFrame.new(
                                workspace.CurrentCamera.CFrame.Position,
                                target.Position
                            )
                        end
                    end
                end
                task.wait()
            end
        end)
    end
    print("🎯 Aimbot " .. (aimbotEnabled and "ATIVADO" or "DESATIVADO"))
end

-- 6. CLICK TELEPORT
local function toggleClickTP()
    clickTP = not clickTP
    
    if clickTP then
        local connection
        connection = UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local mouse = player:GetMouse()
                local target = mouse.Hit.Position
                local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CFrame = CFrame.new(target + Vector3.new(0, 5, 0))
                end
            end
        end)
        getgenv().clickTPConnection = connection
    else
        if getgenv().clickTPConnection then
            getgenv().clickTPConnection:Disconnect()
        end
    end
    print("📍 Click TP " .. (clickTP and "ATIVADO" or "DESATIVADO"))
end

-- 7. NIGHT VISION
local function toggleNightVision()
    nightVision = not nightVision
    
    if nightVision then
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness = 2
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    else
        Lighting.Ambient = Color3.fromRGB(0, 0, 0)
        Lighting.Brightness = 1
        Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    end
    print("🌙 Night Vision " .. (nightVision and "ATIVADO" or "DESATIVADO"))
end

-- 8. FULLBRIGHT
local function toggleFullbright()
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.Brightness = 3
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    Lighting.ClockTime = 12
    print("☀️ Fullbright ATIVADO")
end

-- 9. NO CLIP
local function toggleNoclip()
    noclip = not noclip
    print("👻 Noclip " .. (noclip and "ATIVADO" or "DESATIVADO"))
end

-- 10. HIGH JUMP
local function toggleHighJump()
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = humanoid.JumpPower == 50 and 150 or 50
        print("🚀 High Jump " .. (humanoid.JumpPower == 150 and "ATIVADO" or "DESATIVADO"))
    end
end

-- 11. WALL WALK
local function toggleWallWalk()
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
        print("🧗 Wall Walk ATIVADO")
    end
end

-- 12. CHAMS
local function toggleChams()
    chamsEnabled = not chamsEnabled
    
    if chamsEnabled then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                for _, part in pairs(plr.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 0.3
                        part.Color = Color3.fromRGB(255, 0, 255)
                    end
                end
            end
        end
    else
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character then
                for _, part in pairs(plr.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 0
                        part.Color = Color3.fromRGB(255, 255, 255)
                    end
                end
            end
        end
    end
    print("🌈 Chams " .. (chamsEnabled and "ATIVADO" or "DESATIVADO"))
end

-- 13. TRACERS
local function toggleTracers()
    tracersEnabled = not tracersEnabled
    
    if tracersEnabled then
        spawn(function()
            while tracersEnabled do
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= player and plr.Character then
                        local root = plr.Character:FindFirstChild("HumanoidRootPart")
                        if root then
                            local beam = Instance.new("Beam")
                            beam.Attachment0 = player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChildOfClass("Attachment") or Instance.new("Attachment", player.Character:FindFirstChild("HumanoidRootPart"))
                            beam.Attachment1 = root:FindFirstChildOfClass("Attachment") or Instance.new("Attachment", root)
                            beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
                            beam.Width0 = 0.1
                            beam.Width1 = 0.1
                            beam.Parent = workspace
                            game:GetService("Debris"):AddItem(beam, 0.1)
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
    print("🎯 Tracers " .. (tracersEnabled and "ATIVADO" or "DESATIVADO"))
end

-- 14. TELEPORT ALL (TROLL)
local function teleportAllToMe()
    local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if myRoot then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local targetRoot = plr.Character:FindFirstChild("HumanoidRootPart")
                if targetRoot then
                    targetRoot.CFrame = myRoot.CFrame
                end
            end
        end
        print("😈 Todos teleportados para você!")
    end
end

-- 15. ANTI-AFK
local function toggleAntiAFK()
    antiAfk = not antiAfk
    
    if antiAfk then
        local virtualUser = game:GetService('VirtualUser')
        spawn(function()
            while antiAfk do
                virtualUser:CaptureController()
                virtualUser:ClickButton2(Vector2.new())
                task.wait(30)
            end
        end)
    end
    print("🛡️ Anti-AFK " .. (antiAfk and "ATIVADO" or "DESATIVADO"))
end

-- 16. AUTO CLICKER
local function toggleAutoClicker()
    autoClicker = not autoClicker
    
    if autoClicker then
        spawn(function()
            while autoClicker do
                mouse1click()
                task.wait(0.1)
            end
        end)
    end
    print("🤖 Auto Clicker " .. (autoClicker and "ATIVADO" or "DESATIVADO"))
end

-- 17. RAINBOW CHARACTER
local function toggleRainbow()
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
        print("🌈 Rainbow Character ATIVADO")
    end
end

-- 18. FIRE AURA
local function toggleFireAura()
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if root then
        local fire = Instance.new("Fire")
        fire.Size = 10
        fire.Heat = 10
        fire.Parent = root
        print("🔥 Fire Aura ATIVADO")
    end
end

-- 19. SPEED MULTIPLIER
local function setSpeedMultiplier(multiplier)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 16 * multiplier
        print("⚡ Speed Multiplier: " .. multiplier .. "x")
    end
end

-- 20. COPY OUTFIT
local function copyOutfit(targetPlayer)
    if targetPlayer.Character then
        for _, item in pairs(targetPlayer.Character:GetDescendants()) do
            if item:IsA("Accessory") then
                local clone = item:Clone()
                clone.Parent = player.Character
            end
        end
        print("👕 Outfit copiado!")
    end
end

-- ========== CONTEÚDO DAS ABAS ==========

-- ABA HACKS
local hacksTitle = Instance.new("TextLabel", funTab)
hacksTitle.Size = UDim2.new(1, 0, 0, 50)
hacksTitle.Text = "⚡ HACKS PRINCIPAIS"
hacksTitle.Font = Enum.Font.GothamBlack
hacksTitle.TextSize = 22
hacksTitle.TextColor3 = CONFIG.Theme.Highlight
hacksTitle.BackgroundTransparency = 1
hacksTitle.LayoutOrder = 1

createPremiumButton(funTab, "Fly Hack", "🕊️", Color3.fromRGB(220, 0, 0), toggleFly)
createPremiumButton(funTab, "Speed Hack", "⚡", Color3.fromRGB(255, 150, 0), toggleSpeed)
createPremiumButton(funTab, "Infinite Jump", "⬆️", Color3.fromRGB(0, 200, 100), toggleInfJump)
createPremiumButton(funTab, "Noclip", "👻", Color3.fromRGB(150, 0, 200), toggleNoclip)
createPremiumButton(funTab, "Aimbot", "🎯", Color3.fromRGB(255, 0, 100), toggleAimbot)
createPremiumButton(funTab, "Click Teleport", "📍", Color3.fromRGB(0, 150, 255), toggleClickTP)
createPremiumButton(funTab, "Anti-AFK", "🛡️", Color3.fromRGB(100, 100, 255), toggleAntiAFK)
createPremiumButton(funTab, "Auto Clicker", "🤖", Color3.fromRGB(200, 100, 0), toggleAutoClicker)

-- ABA VISUAL
local visualTitle = Instance.new("TextLabel", visualTab)
visualTitle.Size = UDim2.new(1, 0, 0, 50)
visualTitle.Text = "👁️ VISUAL MODS"
visualTitle.Font = Enum.Font.GothamBlack
visualTitle.TextSize = 22
visualTitle.TextColor3 = Color3.fromRGB(0, 200, 255)
visualTitle.BackgroundTransparency = 1
visualTitle.LayoutOrder = 1

createPremiumButton(visualTab, "ESP (Wallhack)", "👁️", Color3.fromRGB(255, 0, 0), toggleESP)
createPremiumButton(visualTab, "Night Vision", "🌙", Color3.fromRGB(0, 100, 200), toggleNightVision)
createPremiumButton(visualTab, "Fullbright", "☀️", Color3.fromRGB(255, 200, 0), toggleFullbright)
createPremiumButton(visualTab, "Chams", "🌈", Color3.fromRGB(255, 0, 255), toggleChams)
createPremiumButton(visualTab, "Tracers", "🎯", Color3.fromRGB(255, 100, 0), toggleTracers)
createPremiumButton(visualTab, "Rainbow Character", "🌈", Color3.fromRGB(255, 0, 100), toggleRainbow)
createPremiumButton(visualTab, "Fire Aura", "🔥", Color3.fromRGB(255, 100, 0), toggleFireAura)

-- ABA MOVIMENTO
local moveTitle = Instance.new("TextLabel", moveTab)
moveTitle.Size = UDim2.new(1, 0, 0, 50)
moveTitle.Text = "🏃 MOVIMENTO"
moveTitle.Font = Enum.Font.GothamBlack
moveTitle.TextSize = 22
moveTitle.TextColor3 = Color3.fromRGB(0, 200, 100)
moveTitle.BackgroundTransparency = 1
moveTitle.LayoutOrder = 1

createPremiumButton(moveTab, "High Jump", "🚀", Color3.fromRGB(0, 200, 100), toggleHighJump)
createPremiumButton(moveTab, "Wall Walk", "🧗", Color3.fromRGB(100, 200, 0), toggleWallWalk)
createPremiumButton(moveTab, "Speed 2x", "⚡", Color3.fromRGB(255, 150, 0), function() setSpeedMultiplier(2) end)
createPremiumButton(moveTab, "Speed 3x", "⚡⚡", Color3.fromRGB(255, 100, 0), function() setSpeedMultiplier(3) end)
createPremiumButton(moveTab, "Speed 5x", "⚡⚡⚡", Color3.fromRGB(255, 50, 0), function() setSpeedMultiplier(5) end)

-- ABA TROLL
local trollTitle = Instance.new("TextLabel", trollTab)
trollTitle.Size = UDim2.new(1, 0, 0, 50)
trollTitle.Text = "😈 TROLL"
trollTitle.Font = Enum.Font.GothamBlack
trollTitle.TextSize = 22
trollTitle.TextColor3 = Color3.fromRGB(255, 0, 255)
trollTitle.BackgroundTransparency = 1
trollTitle.LayoutOrder = 1

createPremiumButton(trollTab, "Teleportar Todos", "📍", Color3.fromRGB(255, 0, 100), teleportAllToMe)
createPremiumButton(trollTab, "Lançar Jogadores", "🚀", Color3.fromRGB(255, 100, 0), function()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local root = plr.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local bv = Instance.new("BodyVelocity")
                bv.Velocity = Vector3.new(0, 200, 0)
                bv.MaxForce = Vector3.new(0, math.huge, 0)
                bv.Parent = root
                game:GetService("Debris"):AddItem(bv, 1)
            end
        end
    end
    print("😈 Jogadores lançados!")
end)

-- ABA UTILITÁRIOS
local utilTitle = Instance.new("TextLabel", utilTab)
utilTitle.Size = UDim2.new(1, 0, 0, 50)
utilTitle.Text = "🛠️ UTILITÁRIOS"
utilTitle.Font = Enum.Font.GothamBlack
utilTitle.TextSize = 22
utilTitle.TextColor3 = Color3.fromRGB(255, 200, 0)
utilTitle.BackgroundTransparency = 1
utilTitle.LayoutOrder = 1

createPremiumButton(utilTab, "Copiar Game ID", "🎮", Color3.fromRGB(100, 150, 255), function()
    setclipboard(tostring(game.PlaceId))
    print("🎮 Game ID copiado!")
end)

createPremiumButton(utilTab, "Copiar Job ID", "🔗", Color3.fromRGB(100, 200, 255), function()
    setclipboard(tostring(game.JobId))
    print("🔗 Job ID copiado!")
end)

createPremiumButton(utilTab, "Copiar Discord", "💬", Color3.fromRGB(88, 101, 242), function()
    setclipboard("https://discord.gg/zdDKdGbsZT")
    print("💬 Discord copiado!")
end)

createPremiumButton(utilTab, "Copiar TikTok", "📱", Color3.fromRGB(0, 0, 0), function()
    setclipboard("@lolyta")
    print("📱 TikTok copiado!")
end)

-- ABA CRÉDITOS
local creditsTitle = Instance.new("TextLabel", creditsTab)
creditsTitle.Size = UDim2.new(1, 0, 0, 50)
creditsTitle.Text = "⭐ RYUZEN PREMIUM"
creditsTitle.Font = Enum.Font.GothamBlack
creditsTitle.TextSize = 24
creditsTitle.TextColor3 = Color3.fromRGB(255, 200, 0)
creditsTitle.BackgroundTransparency = 1
creditsTitle.LayoutOrder = 1

local teamInfo = Instance.new("TextLabel", creditsTab)
teamInfo.Size = UDim2.new(0.9, 0, 0, 100)
teamInfo.Text = "⚔️ CRIADO POR:\nCOFFEE ☕ & FROST ❄️\n\n🐉 EQUIPE RYUZEN\n✨ VERSÃO: HUB 4.5 PREMIUM"
teamInfo.Font = Enum.Font.GothamBold
teamInfo.TextSize = 16
teamInfo.TextColor3 = CONFIG.Theme.Text
teamInfo.BackgroundTransparency = 1
teamInfo.TextYAlignment = Enum.TextYAlignment.Top
teamInfo.LayoutOrder = 2

-- ATIVAR PRIMEIRA ABA
tabs["Hacks"].frame.Visible = true
activeTab = "Hacks"
TweenService:Create(tabs["Hacks"].button, TweenInfo.new(0.3), {
    BackgroundColor3 = Color3.fromRGB(220, 0, 0),
    TextColor3 = Color3.fromRGB(255, 255, 255)
}):Play()
TweenService:Create(tabs["Hacks"].glow, TweenInfo.new(0.3), {
    BackgroundTransparency = 0.3
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

-- BOTÃO PARA ABRIR (DESIGN PREMIUM)
local openBtn = Instance.new("ImageButton", gui)
openBtn.Size = UDim2.new(0, 55, 0, 55)
openBtn.Position = UDim2.new(0, 25, 0, 25)
openBtn.BackgroundColor3 = CONFIG.Theme.Accent
openBtn.BorderSizePixel = 0
openBtn.AutoButtonColor = false
openBtn.Visible = false
openBtn.ZIndex = 30
openBtn.Image = "rbxassetid://3926307971" -- Ícone de dragão/espada
openBtn.ImageRectSize = Vector2.new(48, 48)
openBtn.ImageRectOffset = Vector2.new(240, 0)
openBtn.ScaleType = Enum.ScaleType.Fit

-- GLOW NO BOTÃO ABRIR
local openBtnGlow = Instance.new("ImageLabel", openBtn)
openBtnGlow.Size = UDim2.new(1, 10, 1, 10)
openBtnGlow.Position = UDim2.new(-0.09, 0, -0.09, 0)
openBtnGlow.BackgroundTransparency = 1
openBtnGlow.Image = "rbxassetid://8992234291"
openBtnGlow.ImageColor3 = CONFIG.Theme.Glow
openBtnGlow.ImageTransparency = 0.7
openBtnGlow.ScaleType = Enum.ScaleType.Slice
openBtnGlow.SliceCenter = Rect.new(100, 100, 100, 100)
openBtnGlow.ZIndex = 29

-- ANIMAÇÃO PULSANTE
spawn(function()
    while true do
        TweenService:Create(openBtn, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0, 58, 0, 58),
            BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        }):Play()
        TweenService:Create(openBtnGlow, TweenInfo.new(1.2), {
            ImageTransparency = 0.5
        }):Play()
        task.wait(1.2)
        TweenService:Create(openBtn, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0, 55, 0, 55),
            BackgroundColor3 = CONFIG.Theme.Accent
        }):Play()
        TweenService:Create(openBtnGlow, TweenInfo.new(1.2), {
            ImageTransparency = 0.7
        }):Play()
        task.wait(1.2)
    end
end)

-- EFEITO HOVER
openBtn.MouseEnter:Connect(function()
    TweenService:Create(openBtn, TweenInfo.new(0.2), {
        Rotation = 15,
        BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    }):Play()
end)

openBtn.MouseLeave:Connect(function()
    TweenService:Create(openBtn, TweenInfo.new(0.2), {
        Rotation = 0,
        BackgroundColor3 = CONFIG.Theme.Accent
    }):Play()
end)

-- FUNÇÕES ABRIR/FECHAR
closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -310, -1, 0)
    }):Play()
    task.wait(0.4)
    main.Visible = false
    openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
    openBtn.Visible = false
    main.Visible = true
    TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -310, 0.5, -190)
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

-- INICIAR
main.Visible = true
openBtn.Visible = false

-- MENSAGEM NO CONSOLE
print("╔══════════════════════════════════════════╗")
print("║    ⚔️ RYUZEN HUB PREMIUM v4.5 ⚔️     ║")
print("║    CRIADO POR: COFFEE ☕ & FROST ❄️    ║")
print("║    PRESSIONE F1 PARA ABRIR/FECHAR       ║")
print("╚══════════════════════════════════════════╝")
print("✨ Modo Leve Ativado | 20+ Funções Premium ✨")

return gui 
