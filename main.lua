-- ⛩️ RYUZEN HUB SIMPLES & FUNCIONAL
-- By Coffee & Frost

if getgenv().RYUZEN_LOADED then return end
getgenv().RYUZEN_LOADED = true

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Variáveis
local noclip = false
local flying = false
local speedHack = false
local infJump = false
local espEnabled = false

-- GUI Simples
local gui = Instance.new("ScreenGui")
gui.Name = "RYUZEN_HUB_V5"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN FRAME (Simples)
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 600, 0, 400)
main.Position = UDim2.new(0.5, -300, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

-- Borda vermelha
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(200, 0, 0)
stroke.Thickness = 2

-- HEADER
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
header.BorderSizePixel = 0

-- Título
local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(0.7, 0, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "🐉 RYUZEN HUB V5 🐉"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 50, 50)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

-- Botão Fechar
local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -50, 0.5, -20)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
closeBtn.BorderSizePixel = 0
closeBtn.AutoButtonColor = false

closeBtn.MouseEnter:Connect(function()
    closeBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
end)

closeBtn.MouseLeave:Connect(function()
    closeBtn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
end)

-- SIDEBAR
local sidebar = Instance.new("Frame", main)
sidebar.Position = UDim2.new(0, 0, 0, 50)
sidebar.Size = UDim2.new(0, 150, 1, -50)
sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
sidebar.BorderSizePixel = 0

-- Separador
local separator = Instance.new("Frame", sidebar)
separator.Size = UDim2.new(0, 2, 1, 0)
separator.Position = UDim2.new(1, -2, 0, 0)
separator.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
separator.BorderSizePixel = 0

-- ÁREA DE CONTEÚDO
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0, 150, 0, 50)
content.Size = UDim2.new(1, -150, 1, -50)
content.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
content.BorderSizePixel = 0

-- Sistema de Abas
local tabs = {}
local activeTab = nil

local function createTab(name, icon)
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, (#tabs * 45) + 10)
    btn.Text = icon .. " " .. name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.fromRGB(150, 150, 150)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    local padding = Instance.new("UIPadding", btn)
    padding.PaddingLeft = UDim.new(0, 10)
    
    local frame = Instance.new("ScrollingFrame", content)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 4
    frame.ScrollBarImageColor3 = Color3.fromRGB(200, 0, 0)
    frame.BorderSizePixel = 0
    frame.CanvasSize = UDim2.new(0, 0, 0, 0)
    frame.Visible = false
    
    local layout = Instance.new("UIListLayout", frame)
    layout.Padding = UDim.new(0, 10)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    tabs[name] = {button = btn, frame = frame}
    
    btn.MouseButton1Click:Connect(function()
        if activeTab then
            tabs[activeTab].frame.Visible = false
            tabs[activeTab].button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            tabs[activeTab].button.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
        
        frame.Visible = true
        btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        activeTab = name
    end)
    
    return frame
end

-- Criar Abas
local funTab = createTab("Hacks", "⚡")
local visualTab = createTab("Visual", "👁️")
local moveTab = createTab("Movimento", "🏃")
local trollTab = createTab("Troll", "😈")
local utilTab = createTab("Utilitários", "🛠️")

-- Função para criar botões
local function createButton(parent, text, icon, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.Text = icon .. " " .. text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
    end)
    
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end)
    
    btn.MouseButton1Click:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        wait(0.1)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        
        if callback then
            pcall(callback)
        end
    end)
    
    return btn
end

-- ========== FUNÇÕES ==========

-- Fly Hack
local function toggleFly()
    flying = not flying
    
    if flying then
        local root = player.Character:FindFirstChild("HumanoidRootPart")
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
                    wait()
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
    print("Fly Hack: " .. (flying and "ON" or "OFF"))
end

-- Speed Hack
local function toggleSpeed()
    speedHack = not speedHack
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = speedHack and 100 or 16
        print("Speed Hack: " .. (speedHack and "ON" or "OFF"))
    end
end

-- Infinite Jump
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
    print("Inf Jump: " .. (infJump and "ON" or "OFF"))
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
                highlight.Parent = plr.Character
                highlight.Name = "ESP"
            end
        end
    else
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character then
                for _, obj in pairs(plr.Character:GetChildren()) do
                    if obj.Name == "ESP" then
                        obj:Destroy()
                    end
                end
            end
        end
    end
    print("ESP: " .. (espEnabled and "ON" or "OFF"))
end

-- Noclip
local function toggleNoclip()
    noclip = not noclip
    print("Noclip: " .. (noclip and "ON" or "OFF"))
end

-- Aimbot
local function toggleAimbot()
    aimbotEnabled = not aimbotEnabled
    
    if aimbotEnabled then
        spawn(function()
            while aimbotEnabled do
                local closestPlayer = nil
                local closestDistance = math.huge
                local root = player.Character:FindFirstChild("HumanoidRootPart")
                
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
                wait()
            end
        end)
    end
    print("Aimbot: " .. (aimbotEnabled and "ON" or "OFF"))
end

-- Click TP
local function toggleClickTP()
    clickTP = not clickTP
    
    if clickTP then
        local connection
        connection = UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local mouse = player:GetMouse()
                local target = mouse.Hit.Position
                local root = player.Character:FindFirstChild("HumanoidRootPart")
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
    print("Click TP: " .. (clickTP and "ON" or "OFF"))
end

-- High Jump
local function toggleHighJump()
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = humanoid.JumpPower == 50 and 150 or 50
        print("High Jump: " .. (humanoid.JumpPower == 150 and "ON" or "OFF"))
    end
end

-- Troll: Teleport All
local function teleportAllToMe()
    local myRoot = player.Character:FindFirstChild("HumanoidRootPart")
    if myRoot then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local targetRoot = plr.Character:FindFirstChild("HumanoidRootPart")
                if targetRoot then
                    targetRoot.CFrame = myRoot.CFrame
                end
            end
        end
        print("Teleportou todos para você!")
    end
end

-- Anti-AFK
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
    print("Anti-AFK: " .. (antiAfk and "ON" or "OFF"))
end

-- ========== BOTÕES ==========

-- ABA HACKS
local hacksTitle = Instance.new("TextLabel", funTab)
hacksTitle.Size = UDim2.new(1, 0, 0, 50)
hacksTitle.Text = "⚡ HACKS PRINCIPAIS"
hacksTitle.Font = Enum.Font.GothamBold
hacksTitle.TextSize = 18
hacksTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
hacksTitle.BackgroundTransparency = 1

createButton(funTab, "Fly Hack", "🕊️", toggleFly)
createButton(funTab, "Speed Hack", "⚡", toggleSpeed)
createButton(funTab, "Infinite Jump", "⬆️", toggleInfJump)
createButton(funTab, "Noclip", "👻", toggleNoclip)
createButton(funTab, "Aimbot", "🎯", toggleAimbot)
createButton(funTab, "Click Teleport", "📍", toggleClickTP)
createButton(funTab, "Anti-AFK", "🛡️", toggleAntiAFK)

-- ABA VISUAL
local visualTitle = Instance.new("TextLabel", visualTab)
visualTitle.Size = UDim2.new(1, 0, 0, 50)
visualTitle.Text = "👁️ VISUAL"
visualTitle.Font = Enum.Font.GothamBold
visualTitle.TextSize = 18
visualTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
visualTitle.BackgroundTransparency = 1

createButton(visualTab, "ESP", "👁️", toggleESP)
createButton(visualTab, "Fullbright", "☀️", function()
    game.Lighting.Brightness = 2
    game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    print("Fullbright ON")
end)

-- ABA MOVIMENTO
local moveTitle = Instance.new("TextLabel", moveTab)
moveTitle.Size = UDim2.new(1, 0, 0, 50)
moveTitle.Text = "🏃 MOVIMENTO"
moveTitle.Font = Enum.Font.GothamBold
moveTitle.TextSize = 18
moveTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
moveTitle.BackgroundTransparency = 1

createButton(moveTab, "High Jump", "🚀", toggleHighJump)
createButton(moveTab, "Speed 2x", "⚡", function()
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 32
        print("Speed 2x ON")
    end
end)

-- ABA TROLL
local trollTitle = Instance.new("TextLabel", trollTab)
trollTitle.Size = UDim2.new(1, 0, 0, 50)
trollTitle.Text = "😈 TROLL"
trollTitle.Font = Enum.Font.GothamBold
trollTitle.TextSize = 18
trollTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
trollTitle.BackgroundTransparency = 1

createButton(trollTab, "Teleportar Todos", "📍", teleportAllToMe)
createButton(trollTab, "Lançar Jogadores", "🚀", function()
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
    print("Jogadores lançados!")
end)

-- ABA UTILITÁRIOS
local utilTitle = Instance.new("TextLabel", utilTab)
utilTitle.Size = UDim2.new(1, 0, 0, 50)
utilTitle.Text = "🛠️ UTILITÁRIOS"
utilTitle.Font = Enum.Font.GothamBold
utilTitle.TextSize = 18
utilTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
utilTitle.BackgroundTransparency = 1

createButton(utilTab, "Copiar Game ID", "🎮", function()
    setclipboard(tostring(game.PlaceId))
    print("Game ID copiado!")
end)

createButton(utilTab, "Copiar Job ID", "🔗", function()
    setclipboard(tostring(game.JobId))
    print("Job ID copiado!")
end)

-- Ativar primeira aba
tabs["Hacks"].frame.Visible = true
tabs["Hacks"].button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
tabs["Hacks"].button.TextColor3 = Color3.fromRGB(255, 255, 255)
activeTab = "Hacks"

-- Botão para abrir
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 120, 0, 40)
openBtn.Position = UDim2.new(0, 20, 0, 20)
openBtn.Text = "🐉 ABRIR HUB"
openBtn.Font = Enum.Font.GothamBold
openBtn.TextSize = 14
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
openBtn.BorderSizePixel = 0
openBtn.AutoButtonColor = false
openBtn.Visible = false

openBtn.MouseEnter:Connect(function()
    openBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
end)

openBtn.MouseLeave:Connect(function()
    openBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
end)

-- Funções abrir/fechar
closeBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
    openBtn.Visible = false
    main.Visible = true
end)

-- Keybind
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F1 then
        if main.Visible then
            closeBtn:Fire()
        else
            openBtn:Fire()
        end
    end
end)

-- Noclip automático
RunService.Stepped:Connect(function()
    if noclip and player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Iniciar
main.Visible = true
openBtn.Visible = false

print("🐉 RYUZEN HUB V5 CARREGADO!")
print("Criado por: Coffee & Frost")
print("Pressione F1 para abrir/fechar")

return gui 
