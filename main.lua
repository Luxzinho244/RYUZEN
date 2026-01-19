-- COQUETTE HUB V4.5
-- Tema Rosa/Coquette | By Coffee & Frost

if getgenv().COQUETTE_LOADED then return end
getgenv().COQUETTE_LOADED = true

-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- CONFIGURAÇÕES
local CONFIG = {
    Theme = {
        Background = Color3.fromRGB(255, 224, 240), -- Rosa claro
        Primary = Color3.fromRGB(255, 182, 218), -- Rosa médio
        Secondary = Color3.fromRGB(255, 105, 180), -- Rosa quente
        Accent = Color3.fromRGB(220, 20, 140), -- Rosa escuro
        Text = Color3.fromRGB(255, 255, 255),
        DarkText = Color3.fromRGB(100, 20, 60),
        Stroke = Color3.fromRGB(255, 150, 200)
    },
    Images = {
        Background = "rbxassetid://13287637147", -- Textura floral/coquette
        Star = "⭐",
        Heart = "❤️",
        Sparkle = "✨"
    }
}

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "COQUETTE_HUB_V45"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- BACKGROUND COM DEGRADÊ
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = CONFIG.Theme.Background
bg.BorderSizePixel = 0

local gradient = Instance.new("UIGradient", bg)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 240, 245)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 230))
}
gradient.Rotation = 45

-- TEXTURA DE FLORES NO FUNDO
local texture = Instance.new("ImageLabel", bg)
texture.Size = UDim2.new(1, 0, 1, 0)
texture.Image = CONFIG.Images.Background
texture.ImageTransparency = 0.15
texture.BackgroundTransparency = 1
texture.ScaleType = Enum.ScaleType.Tile
texture.TileSize = UDim2.new(0, 200, 0, 200)

-- MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 550, 0, 400)
main.Position = UDim2.new(0.5, -275, 0.5, -200)
main.BackgroundColor3 = CONFIG.Theme.Primary
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.ZIndex = 10

-- BORDA DECORATIVA
local stroke = Instance.new("UIStroke", main)
stroke.Color = CONFIG.Theme.Stroke
stroke.Thickness = 4
stroke.LineJoinMode = Enum.LineJoinMode.Round

-- ARREDONDAMENTO
local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 20)

-- SOMBRA
local shadow = Instance.new("ImageLabel", main)
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 30, 1, 30)
shadow.Position = UDim2.new(-0.027, 0, -0.027, 0)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(255, 150, 200)
shadow.ImageTransparency = 0.7
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.ZIndex = 9

-- HEADER COM TÍTULO
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 70)
header.BackgroundColor3 = CONFIG.Theme.Secondary
header.BorderSizePixel = 0

local headerCorner = Instance.new("UICorner", header)
headerCorner.CornerRadius = UDim.new(0, 20)
headerCorner:Clone().Parent = header

-- TÍTULO PRINCIPAL
local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -100, 1, 0)
title.Position = UDim2.new(0, 20, 0, 0)
title.Text = "🌸 COQUETTE HUB V4.5 🌸"
title.Font = Enum.Font.FredokaOne
title.TextSize = 28
title.TextColor3 = CONFIG.Theme.Text
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

-- DECORAÇÃO NO TÍTULO
local titleDecoration = Instance.new("TextLabel", title)
titleDecoration.Size = UDim2.new(0, 40, 0, 40)
titleDecoration.Position = UDim2.new(1, -40, 0.5, -20)
titleDecoration.Text = "✨"
titleDecoration.Font = Enum.Font.FredokaOne
titleDecoration.TextSize = 30
titleDecoration.TextColor3 = Color3.fromRGB(255, 255, 200)
titleDecoration.BackgroundTransparency = 1

-- BOTÃO FECHAR ESTILIZADO
local close = Instance.new("TextButton", header)
close.Size = UDim2.new(0, 50, 0, 50)
close.Position = UDim2.new(1, -60, 0.5, -25)
close.Text = "✕"
close.Font = Enum.Font.FredokaOne
close.TextSize = 30
close.TextColor3 = Color3.fromRGB(255, 100, 150)
close.BackgroundColor3 = CONFIG.Theme.Accent
close.BorderSizePixel = 0
close.AutoButtonColor = false

local closeCorner = Instance.new("UICorner", close)
closeCorner.CornerRadius = UDim.new(1, 0)

-- EFEITO HOVER NO BOTÃO FECHAR
close.MouseEnter:Connect(function()
    TweenService:Create(close, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(255, 80, 130),
        Rotation = 180
    }):Play()
end)

close.MouseLeave:Connect(function()
    TweenService:Create(close, TweenInfo.new(0.2), {
        BackgroundColor3 = CONFIG.Theme.Accent,
        Rotation = 0
    }):Play()
end)

-- AVISO DE METEOROS (ANIMAÇÃO)
local meteorWarning = Instance.new("Frame", header)
meteorWarning.Size = UDim2.new(0, 250, 0, 30)
meteorWarning.Position = UDim2.new(0.5, -125, 1.2, 0)
meteorWarning.BackgroundColor3 = Color3.fromRGB(255, 100, 150)
meteorWarning.BorderSizePixel = 0
meteorWarning.Visible = true

local warningCorner = Instance.new("UICorner", meteorWarning)
warningCorner.CornerRadius = UDim.new(0, 15)

local warningText = Instance.new("TextLabel", meteorWarning)
warningText.Size = UDim2.new(1, 0, 1, 0)
warningText.Text = "⚠️ Chuva de meteoros! Se esconda! ⚠️"
warningText.Font = Enum.Font.FredokaOne
warningText.TextSize = 14
warningText.TextColor3 = CONFIG.Theme.Text
warningText.BackgroundTransparency = 1

-- PISCAR O AVISO
local warningVisible = true
spawn(function()
    while true do
        warningVisible = not warningVisible
        meteorWarning.Visible = warningVisible
        task.wait(0.5)
    end
end)

-- SIDEBAR (MENU LATERAL)
local sidebar = Instance.new("Frame", main)
sidebar.Position = UDim2.new(0, 0, 0, 70)
sidebar.Size = UDim2.new(0, 180, 1, -70)
sidebar.BackgroundColor3 = CONFIG.Theme.Primary
sidebar.BorderSizePixel = 0

-- ÁREA DE CONTEÚDO
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0, 180, 0, 70)
content.Size = UDim2.new(1, -180, 1, -70)
content.BackgroundColor3 = CONFIG.Theme.Background
content.BorderSizePixel = 0

local contentCorner = Instance.new("UICorner", content)
contentCorner.CornerRadius = UDim.new(0, 20)

-- SISTEMA DE ABAS
local tabs = {}
local activeTab = nil

local function createTab(name, icon)
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(1, -20, 0, 45)
    btn.Position = UDim2.new(0, 10, 0, (#tabs * 50) + 10)
    btn.Text = icon .. " " .. name
    btn.Font = Enum.Font.FredokaOne
    btn.TextSize = 16
    btn.TextColor3 = CONFIG.Theme.DarkText
    btn.BackgroundColor3 = CONFIG.Theme.Primary
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 10)
    
    local btnStroke = Instance.new("UIStroke", btn)
    btnStroke.Color = CONFIG.Theme.Stroke
    btnStroke.Thickness = 2
    
    local frame = Instance.new("ScrollingFrame", content)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 6
    frame.ScrollBarImageColor3 = CONFIG.Theme.Secondary
    frame.BorderSizePixel = 0
    frame.CanvasSize = UDim2.new(0, 0, 0, 0)
    frame.Visible = false
    
    local frameLayout = Instance.new("UIListLayout", frame)
    frameLayout.Padding = UDim.new(0, 15)
    frameLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    frameLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    tabs[name] = {button = btn, frame = frame}
    
    -- EFEITOS DO BOTÃO
    btn.MouseEnter:Connect(function()
        if activeTab ~= name then
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = CONFIG.Theme.Secondary,
                TextColor3 = CONFIG.Theme.Text
            }):Play()
        end
    end)
    
    btn.MouseLeave:Connect(function()
        if activeTab ~= name then
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = CONFIG.Theme.Primary,
                TextColor3 = CONFIG.Theme.DarkText
            }):Play()
        end
    end)
    
    btn.MouseButton1Click:Connect(function()
        if activeTab then
            tabs[activeTab].frame.Visible = false
            TweenService:Create(tabs[activeTab].button, TweenInfo.new(0.3), {
                BackgroundColor3 = CONFIG.Theme.Primary,
                TextColor3 = CONFIG.Theme.DarkText
            }):Play()
        end
        
        frame.Visible = true
        TweenService:Create(btn, TweenInfo.new(0.3), {
            BackgroundColor3 = CONFIG.Theme.Accent,
            TextColor3 = CONFIG.Theme.Text
        }):Play()
        activeTab = name
    end)
    
    return frame
end

-- FUNÇÃO PARA CRIAR BOTÕES ESTILIZADOS
local function createStyledButton(parent, text, icon)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.Text = icon .. " " .. text
    btn.Font = Enum.Font.FredokaOne
    btn.TextSize = 16
    btn.TextColor3 = CONFIG.Theme.Text
    btn.BackgroundColor3 = CONFIG.Theme.Secondary
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.LayoutOrder = #parent:GetChildren()
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 12)
    
    local btnStroke = Instance.new("UIStroke", btn)
    btnStroke.Color = CONFIG.Theme.Stroke
    btnStroke.Thickness = 2
    
    -- EFEITOS
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = CONFIG.Theme.Accent,
            Size = UDim2.new(0.92, 0, 0, 47)
        }):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = CONFIG.Theme.Secondary,
            Size = UDim2.new(0.9, 0, 0, 45)
        }):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(255, 80, 140)
        }):Play()
        task.wait(0.1)
        TweenService:Create(btn, TweenInfo.new(0.1), {
            BackgroundColor3 = CONFIG.Theme.Secondary
        }):Play()
    end)
    
    return btn
end

-- CRIAR ABAS (IGUAL DA FOTO)
local funTab = createTab("Fun", "🎮")
local avatarTab = createTab("Avatar", "👤")
local houseTab = createTab("House", "🏠")
local carTab = createTab("Car", "🚗")
local toolsTab = createTab("Tools", "🛠️")
local rgbTab = createTab("RGB", "🌈")
local musicAllTab = createTab("Music All", "🎵")
local musicTab = createTab("Music", "🎶")
local trollTab = createTab("Troll", "😈")

-- CONTEÚDO DA ABA FUN
local funTitle = Instance.new("TextLabel", funTab)
funTitle.Size = UDim2.new(1, 0, 0, 40)
funTitle.Text = "🎮 FUNÇÕES DIVERTIDAS 🎮"
funTitle.Font = Enum.Font.FredokaOne
funTitle.TextSize = 22
funTitle.TextColor3 = CONFIG.Theme.Accent
funTitle.BackgroundTransparency = 1
funTitle.LayoutOrder = 1

-- BOTÕES EXEMPLO PARA ABA FUN
createStyledButton(funTab, "Fly Hack", "🕊️")
createStyledButton(funTab, "Speed Hack", "⚡")
createStyledButton(funTab, "Jump Hack", "👟")
createStyledButton(funTab, "Noclip", "👻")
createStyledButton(funTab, "Infinite Yield", "♾️")

-- ABA CRÉDITOS (conteúdo principal)
local creditsFrame = Instance.new("Frame", content)
creditsFrame.Size = UDim2.new(1, 0, 1, 0)
creditsFrame.BackgroundTransparency = 1
creditsFrame.Visible = false

local creditsLayout = Instance.new("UIListLayout", creditsFrame)
creditsLayout.Padding = UDim.new(0, 25)
creditsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
creditsLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- TÍTULO CRÉDITOS
local creditsTitle = Instance.new("TextLabel", creditsFrame)
creditsTitle.Size = UDim2.new(1, 0, 0, 50)
creditsTitle.Text = "✨ CRÉDITOS DO HUB ✨"
creditsTitle.Font = Enum.Font.FredokaOne
creditsTitle.TextSize = 26
creditsTitle.TextColor3 = CONFIG.Theme.Accent
creditsTitle.BackgroundTransparency = 1
creditsTitle.LayoutOrder = 1

-- INFORMAÇÕES DE CRÉDITOS
local creditInfo = Instance.new("TextLabel", creditsFrame)
creditInfo.Size = UDim2.new(0.9, 0, 0, 100)
creditInfo.Text = "Criado por:\nCoffee ☕ & Frost ❄️\n\nEquipe Coquette Studio"
creditInfo.Font = Enum.Font.FredokaOne
creditInfo.TextSize = 20
creditInfo.TextColor3 = CONFIG.Theme.DarkText
creditInfo.BackgroundTransparency = 1
creditInfo.TextYAlignment = Enum.TextYAlignment.Top
creditInfo.LayoutOrder = 2

-- DISCORD BUTTON
local discordBtn = Instance.new("TextButton", creditsFrame)
discordBtn.Size = UDim2.new(0.8, 0, 0, 60)
discordBtn.Text = "💬 Discord Server\nhttps://discord.gg/zdDKdGbsZT"
discordBtn.Font = Enum.Font.FredokaOne
discordBtn.TextSize = 16
discordBtn.TextColor3 = CONFIG.Theme.Text
discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242) -- Cor do Discord
discordBtn.BorderSizePixel = 0
discordBtn.AutoButtonColor = false
discordBtn.LayoutOrder = 3

local discordCorner = Instance.new("UICorner", discordBtn)
discordCorner.CornerRadius = UDim.new(0, 15)

discordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/zdDKdGbsZT")
    discordBtn.Text = "✅ Link Copiado!"
    task.wait(1.5)
    discordBtn.Text = "💬 Discord Server\nhttps://discord.gg/zdDKdGbsZT"
end)

-- COPIAR TIKTOK
local tiktokBtn = Instance.new("TextButton", creditsFrame)
tiktokBtn.Size = UDim2.new(0.8, 0, 0, 60)
tiktokBtn.Text = "📱 Copiar TikTok @lolyta"
tiktokBtn.Font = Enum.Font.FredokaOne
tiktokBtn.TextSize = 16
tiktokBtn.TextColor3 = CONFIG.Theme.Text
tiktokBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Cor do TikTok
discordBtn.BorderSizePixel = 0
tiktokBtn.AutoButtonColor = false
tiktokBtn.LayoutOrder = 4

local tiktokCorner = Instance.new("UICorner", tiktokBtn)
tiktokCorner.CornerRadius = UDim.new(0, 15)

tiktokBtn.MouseButton1Click:Connect(function()
    setclipboard("@lolyta")
    tiktokBtn.Text = "✅ @ Copiado!"
    task.wait(1.5)
    tiktokBtn.Text = "📱 Copiar TikTok @lolyta"
end)

-- VERSÃO
local versionLabel = Instance.new("TextLabel", creditsFrame)
versionLabel.Size = UDim2.new(0.9, 0, 0, 30)
versionLabel.Text = "Versão do Hub: 4.5"
versionLabel.Font = Enum.Font.FredokaOne
versionLabel.TextSize = 18
versionLabel.TextColor3 = CONFIG.Theme.Accent
versionLabel.BackgroundTransparency = 1
versionLabel.LayoutOrder = 5

-- BOTÃO PARA ABRIR CRÉDITOS NA SIDEBAR
local creditsBtn = Instance.new("TextButton", sidebar)
creditsBtn.Size = UDim2.new(1, -20, 0, 45)
creditsBtn.Position = UDim2.new(0, 10, 1, -55)
creditsBtn.Text = "⭐ Créditos"
creditsBtn.Font = Enum.Font.FredokaOne
creditsBtn.TextSize = 16
creditsBtn.TextColor3 = CONFIG.Theme.DarkText
creditsBtn.BackgroundColor3 = CONFIG.Theme.Primary
creditsBtn.BorderSizePixel = 0
creditsBtn.AutoButtonColor = false

local creditsBtnCorner = Instance.new("UICorner", creditsBtn)
creditsBtnCorner.CornerRadius = UDim.new(0, 10)

local creditsBtnStroke = Instance.new("UIStroke", creditsBtn)
creditsBtnStroke.Color = CONFIG.Theme.Stroke
creditsBtnStroke.Thickness = 2

-- FUNÇÃO PARA MOSTRAR CRÉDITOS
creditsBtn.MouseButton1Click:Connect(function()
    for _, tab in pairs(tabs) do
        tab.frame.Visible = false
        TweenService:Create(tab.button, TweenInfo.new(0.3), {
            BackgroundColor3 = CONFIG.Theme.Primary,
            TextColor3 = CONFIG.Theme.DarkText
        }):Play()
    end
    
    creditsFrame.Visible = true
    TweenService:Create(creditsBtn, TweenInfo.new(0.3), {
        BackgroundColor3 = CONFIG.Theme.Accent,
        TextColor3 = CONFIG.Theme.Text
    }):Play()
    activeTab = "Credits"
end)

-- ATIVAR PRIMEIRA ABA
tabs["Fun"].frame.Visible = true
activeTab = "Fun"
TweenService:Create(tabs["Fun"].button, TweenInfo.new(0.3), {
    BackgroundColor3 = CONFIG.Theme.Accent,
    TextColor3 = CONFIG.Theme.Text
}):Play()

-- AJUSTAR CANVAS SIZE PARA TODAS AS ABAS
for _, tab in pairs(tabs) do
    local layout = tab.frame:FindFirstChildOfClass("UIListLayout")
    if layout then
        layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tab.frame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
        end)
    end
end

-- BOTÃO PARA ABRIR MENU
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 130, 0, 50)
openBtn.Position = UDim2.new(0, 20, 0.5, -25)
openBtn.Text = "🌸 COQUETTE"
openBtn.Font = Enum.Font.FredokaOne
openBtn.TextSize = 16
openBtn.TextColor3 = CONFIG.Theme.Text
openBtn.BackgroundColor3 = CONFIG.Theme.Accent
openBtn.Visible = false
openBtn.BorderSizePixel = 0
openBtn.AutoButtonColor = false

local openBtnCorner = Instance.new("UICorner", openBtn)
openBtnCorner.CornerRadius = UDim.new(0, 15)

local openBtnStroke = Instance.new("UIStroke", openBtn)
openBtnStroke.Color = CONFIG.Theme.Stroke
openBtnStroke.Thickness = 3

-- ANIMAÇÃO DE PULSO NO BOTÃO ABRIR
spawn(function()
    while true do
        TweenService:Create(openBtn, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0, 135, 0, 52)
        }):Play()
        task.wait(0.8)
        TweenService:Create(openBtn, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0, 130, 0, 50)
        }):Play()
        task.wait(0.8)
    end
end)

-- FUNÇÕES ABRIR/FECHAR
close.MouseButton1Click:Connect(function()
    TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -275, -0.5, 0)
    }):Play()
    task.wait(0.4)
    main.Visible = false
    openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
    openBtn.Visible = false
    main.Visible = true
    TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -275, 0.5, -200)
    }):Play()
end)

-- KEYBIND (F1 PARA ABRIR/FECHAR)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        if main.Visible then
            close.MouseButton1Click:Fire()
        else
            openBtn.MouseButton1Click:Fire()
        end
    end
end)

-- ESTRELAS FLUTUANTES NO FUNDO (Efeito decorativo)
for i = 1, 15 do
    local star = Instance.new("TextLabel", bg)
    star.Text = "✨"
    star.Font = Enum.Font.FredokaOne
    star.TextSize = math.random(20, 35)
    star.TextColor3 = Color3.fromRGB(255, 200, 230)
    star.BackgroundTransparency = 1
    star.Position = UDim2.new(math.random(), 0, math.random(), 0)
    
    spawn(function()
        while true do
            local time = tick()
            star.Position = UDim2.new(
                (math.sin(time * 0.5 + i) * 0.1) + 0.5,
                math.random(-200, 200),
                (math.cos(time * 0.3 + i) * 0.1) + 0.5,
                math.random(-200, 200)
            )
            task.wait(0.03)
        end
    end)
end

-- INICIAR COM MENU ABERTO
main.Visible = true
openBtn.Visible = false

print("🌸 COQUETTE HUB V4.5 Carregado!")
print("☕ Criado por: Coffee & Frost")
print("🎮 Pressione F1 para abrir/fechar")
print("🌸 Discord: https://discord.gg/V32pzdAB")

return gui
