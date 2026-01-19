-- ⛩️ RYUZEN HUB | MENU COM ABAS
-- Dark + Red | Estilo Samurai/Masculino
-- By Coffee & Frost

if getgenv().RYUZEN_LOADED then return end
getgenv().RYUZEN_LOADED = true

-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- CONFIGURAÇÕES RYUZEN
local CONFIG = {
    Theme = {
        Primary = Color3.fromRGB(10, 10, 10),      -- Preto profundo
        Secondary = Color3.fromRGB(20, 20, 20),    -- Preto médio
        Accent = Color3.fromRGB(180, 0, 0),        -- Vermelho sangue
        Highlight = Color3.fromRGB(220, 0, 0),     -- Vermelho brilhante
        Danger = Color3.fromRGB(255, 50, 50),      -- Vermelho alerta
        Text = Color3.fromRGB(240, 240, 240),      -- Branco gelo
        DarkText = Color3.fromRGB(150, 150, 150)   -- Cinza
    },
    Symbols = {
        Dragon = "🐉",
        Sword = "⚔️",
        Shield = "🛡️",
        Fire = "🔥",
        Skull = "💀",
        Warning = "⚠️"
    }
}

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "RYUZEN_HUB_V45"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN FRAME (ESTILO SAMURAI) - ALTURA REDUZIDA
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 600, 0, 350)  -- Altura reduzida de 450 para 350
main.Position = UDim2.new(0.5, -300, 0.5, -175)
main.BackgroundColor3 = CONFIG.Theme.Primary
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.ZIndex = 10

-- BORDA VERMELHA (ESTILO SAMURAI)
local stroke = Instance.new("UIStroke", main)
stroke.Color = CONFIG.Theme.Accent
stroke.Thickness = 3
stroke.LineJoinMode = Enum.LineJoinMode.Miter

-- CANTOS RETOS (ESTILO MILITAR)
local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 2)

-- HEADER COM AVISO
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 50)  -- Altura reduzida
header.BackgroundColor3 = Color3.fromRGB(15, 0, 0) -- Vermelho escuro
header.BorderSizePixel = 0

-- TÍTULO RYUZEN
local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(0.6, 0, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "🐉 RYUZEN HUB V4.5 🐉"
title.Font = Enum.Font.GothamBlack
title.TextSize = 22  -- Tamanho reduzido
title.TextColor3 = CONFIG.Theme.Highlight
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

-- AVISO DE METEOROS (IGUAL FOTO)
local warningFrame = Instance.new("Frame", header)
warningFrame.Size = UDim2.new(0.35, 0, 0, 25)  -- Altura reduzida
warningFrame.Position = UDim2.new(0.65, 0, 0.5, -12.5)
warningFrame.BackgroundColor3 = CONFIG.Theme.Danger
warningFrame.BorderSizePixel = 0

local warningCorner = Instance.new("UICorner", warningFrame)
warningCorner.CornerRadius = UDim.new(0, 4)

local warningText = Instance.new("TextLabel", warningFrame)
warningText.Size = UDim2.new(1, 0, 1, 0)
warningText.Text = CONFIG.Symbols.Warning .. " CHUVA DE METEOROS! " .. CONFIG.Symbols.Warning
warningText.Font = Enum.Font.GothamBold
warningText.TextSize = 11  -- Tamanho reduzido
warningText.TextColor3 = Color3.fromRGB(255, 255, 200)
warningText.BackgroundTransparency = 1

-- ANIMAÇÃO PISCANTE DO AVISO
local warningVisible = true
spawn(function()
    while true do
        warningVisible = not warningVisible
        warningFrame.Visible = warningVisible
        task.wait(0.6)
    end
end)

-- BOTÃO FECHAR (ESTILO MILITAR)
local close = Instance.new("TextButton", header)
close.Size = UDim2.new(0, 35, 0, 35)  -- Tamanho reduzido
close.Position = UDim2.new(1, -45, 0.5, -17.5)
close.Text = "✕"
close.Font = Enum.Font.GothamBlack
close.TextSize = 18  -- Tamanho reduzido
close.TextColor3 = CONFIG.Theme.Danger
close.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
close.BorderSizePixel = 1
close.BorderColor3 = CONFIG.Theme.Accent
close.AutoButtonColor = false

-- SIDEBAR (MENU LATERAL - IGUAL FOTO)
local sidebar = Instance.new("Frame", main)
sidebar.Position = UDim2.new(0, 0, 0, 50)  -- Ajustado para nova altura do header
sidebar.Size = UDim2.new(0, 200, 1, -50)  -- Ajustado para nova altura
sidebar.BackgroundColor3 = CONFIG.Theme.Secondary
sidebar.BorderSizePixel = 0

-- SEPARADOR VERMELHO
local separator = Instance.new("Frame", sidebar)
separator.Size = UDim2.new(0, 2, 1, 0)
separator.Position = UDim2.new(1, -2, 0, 0)
separator.BackgroundColor3 = CONFIG.Theme.Accent
separator.BorderSizePixel = 0

-- ÁREA DE CONTEÚDO
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0, 200, 0, 50)  -- Ajustado
content.Size = UDim2.new(1, -200, 1, -50)  -- Ajustado
content.BackgroundColor3 = CONFIG.Theme.Primary
content.BorderSizePixel = 0

-- SISTEMA DE ABAS (IGUAL FOTO)
local tabs = {}
local activeTab = nil

local function createTab(name, icon)
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(1, -10, 0, 35)  -- Altura reduzida
    btn.Position = UDim2.new(0, 5, 0, (#tabs * 40) + 10)  -- Espaço reduzido
    btn.Text = icon .. "  " .. name:upper()
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12  -- Tamanho reduzido
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
    frameLayout.Padding = UDim.new(0, 8)  -- Espaço reduzido
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

-- CRIAR ABAS (IGUAL FOTO QUE VOCÊ DESCREVEU)
local funTab = createTab("Fun", "🎮")
local avatarTab = createTab("Avatar", "👤")
local houseTab = createTab("House", "🏠")
local carTab = createTab("Car", "🚗")
local toolsTab = createTab("Tools", "🛠️")
local rgbTab = createTab("RGB", "🌈")
local musicAllTab = createTab("Music All", "🎵")
local musicTab = createTab("Music", "🎶")
local trollTab = createTab("Troll", "😈")

-- FUNÇÃO PARA CRIAR BOTÕES ESTILO RYUZEN
local function createRyButton(parent, text, icon)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.9, 0, 0, 40)  -- Altura reduzida
    btn.Text = icon .. "  " .. text:upper()
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13  -- Tamanho reduzido
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
    end)
    
    return btn
end

-- CONTEÚDO DA ABA FUN (EXEMPLO)
local funTitle = Instance.new("TextLabel", funTab)
funTitle.Size = UDim2.new(1, 0, 0, 40)  -- Altura reduzida
funTitle.Text = "🎮 FUNCTIONS"
funTitle.Font = Enum.Font.GothamBlack
funTitle.TextSize = 18  -- Tamanho reduzido
funTitle.TextColor3 = CONFIG.Theme.Highlight
funTitle.BackgroundTransparency = 1
funTitle.LayoutOrder = 1

-- BOTÕES EXEMPLO PARA ABA FUN
createRyButton(funTab, "Fly", "🕊️")
createRyButton(funTab, "Speed", "⚡")
createRyButton(funTab, "Noclip", "👻")
createRyButton(funTab, "Infinite Jump", "⬆️")
createRyButton(funTab, "Anti-AFK", "🛡️")

-- ÁREA DE CRÉDITOS
local creditsFrame = Instance.new("Frame", content)
creditsFrame.Size = UDim2.new(1, 0, 1, 0)
creditsFrame.BackgroundTransparency = 1
creditsFrame.Visible = false

local creditsLayout = Instance.new("UIListLayout", creditsFrame)
creditsLayout.Padding = UDim.new(0, 15)  -- Espaço reduzido
creditsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
creditsLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- TÍTULO CRÉDITOS
local creditsTitle = Instance.new("TextLabel", creditsFrame)
creditsTitle.Size = UDim2.new(1, 0, 0, 40)  -- Altura reduzida
creditsTitle.Text = "🐉 RYUZEN CREDITS 🐉"
creditsTitle.Font = Enum.Font.GothamBlack
creditsTitle.TextSize = 22  -- Tamanho reduzido
creditsTitle.TextColor3 = CONFIG.Theme.Highlight
creditsTitle.BackgroundTransparency = 1
creditsTitle.LayoutOrder = 1

-- INFORMAÇÕES DA EQUIPE
local teamInfo = Instance.new("TextLabel", creditsFrame)
teamInfo.Size = UDim2.new(0.9, 0, 0, 60)  -- Altura reduzida
teamInfo.Text = "CREATED BY:\nCOFFEE ☕ & FROST ❄️\n\nRYUZEN TEAM"
teamInfo.Font = Enum.Font.GothamBold
teamInfo.TextSize = 16  -- Tamanho reduzido
teamInfo.TextColor3 = CONFIG.Theme.Text
teamInfo.BackgroundTransparency = 1
teamInfo.TextYAlignment = Enum.TextYAlignment.Top
teamInfo.LayoutOrder = 2

-- DISCORD BUTTON (ESTILO DARK)
local discordBtn = Instance.new("TextButton", creditsFrame)
discordBtn.Size = UDim2.new(0.85, 0, 0, 45)  -- Altura reduzida
discordBtn.Text = "DISCORD: https://discord.gg/zdDKdGbsZT"
discordBtn.Font = Enum.Font.GothamBold
discordBtn.TextSize = 13  -- Tamanho reduzido
discordBtn.TextColor3 = CONFIG.Theme.Text
discordBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
discordBtn.BorderSizePixel = 1
discordBtn.BorderColor3 = Color3.fromRGB(88, 101, 242)
discordBtn.AutoButtonColor = false
discordBtn.LayoutOrder = 3

discordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/zdDKdGbsZT")
    discordBtn.Text = "✅ LINK COPIED!"
    task.wait(1.5)
    discordBtn.Text = "DISCORD: https://discord.gg/zdDKdGbsZT"
end)

-- STUDIO BUTTON
local studioBtn = Instance.new("TextButton", creditsFrame)
studioBtn.Size = UDim2.new(0.85, 0, 0, 45)  -- Altura reduzida
studioBtn.Text = "RYUZEN STUDIO"
studioBtn.Font = Enum.Font.GothamBold
studioBtn.TextSize = 13  -- Tamanho reduzido
studioBtn.TextColor3 = CONFIG.Theme.Text
studioBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
studioBtn.BorderSizePixel = 1
studioBtn.BorderColor3 = CONFIG.Theme.Accent
studioBtn.AutoButtonColor = false
studioBtn.LayoutOrder = 4

studioBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/zdDKdGbsZT")
    studioBtn.Text = "✅ LINK COPIED!"
    task.wait(1.5)
    studioBtn.Text = "RYUZEN STUDIO"
end)

-- VERSÃO
local versionLabel = Instance.new("TextLabel", creditsFrame)
versionLabel.Size = UDim2.new(0.9, 0, 0, 25)  -- Altura reduzida
versionLabel.Text = "VERSION: HUB 4.5"
versionLabel.Font = Enum.Font.GothamBold
versionLabel.TextSize = 14  -- Tamanho reduzido
versionLabel.TextColor3 = CONFIG.Theme.DarkText
versionLabel.BackgroundTransparency = 1
versionLabel.LayoutOrder = 5

-- BOTÃO CRÉDITOS NA SIDEBAR
local creditsBtn = Instance.new("TextButton", sidebar)
creditsBtn.Size = UDim2.new(1, -10, 0, 35)  -- Altura reduzida
creditsBtn.Position = UDim2.new(0, 5, 1, -45)  -- Posição ajustada
creditsBtn.Text = "⭐  CREDITS"
creditsBtn.Font = Enum.Font.GothamBold
creditsBtn.TextSize = 12  -- Tamanho reduzido
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

-- BOTÃO PARA ABRIR (ESTILO RYUZEN) - AGORA COM FUNCIONALIDADE
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 140, 0, 40)  -- Tamanho reduzido
openBtn.Position = UDim2.new(0, 20, 0, 20)  -- Posição no canto superior esquerdo
openBtn.Text = "🐉 RYUZEN HUB"
openBtn.Font = Enum.Font.GothamBlack
openBtn.TextSize = 14
openBtn.TextColor3 = CONFIG.Theme.Text
openBtn.BackgroundColor3 = CONFIG.Theme.Accent
openBtn.BorderSizePixel = 1
openBtn.BorderColor3 = CONFIG.Theme.Highlight
openBtn.Visible = false  -- Começa invisível
openBtn.AutoButtonColor = false

-- EFEITO PULSO NO BOTÃO ABRIR
spawn(function()
    while true do
        TweenService:Create(openBtn, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        }):Play()
        task.wait(1)
        TweenService:Create(openBtn, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            BackgroundColor3 = CONFIG.Theme.Accent
        }):Play()
        task.wait(1)
    end
end)

-- FUNÇÃO FECHAR (COM BOTÃO ABRIR)
close.MouseButton1Click:Connect(function()
    TweenService:Create(main, TweenInfo.new(0.3), {
        Position = UDim2.new(0.5, -300, -1, 0)
    }):Play()
    task.wait(0.3)
    main.Visible = false
    openBtn.Visible = true  -- Mostra o botão de abrir
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
            close.MouseButton1Click:Fire()
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
print("CREATED BY: COFFEE ☕ & FROST ❄️")
print("PRESS F1 TO TOGGLE MENU")
print("=======================================")

return gui
