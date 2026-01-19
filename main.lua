-- ⛩️ RYUZEN HUB | MENU COM ABAS
-- Dark + Red | Mobile + PC | Estável | Aprimorado

if getgenv().RYUZEN_LOADED then return end
getgenv().RYUZEN_LOADED = true

-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- CONFIGURAÇÕES
local CONFIG = {
    Theme = {
        Primary = Color3.fromRGB(14, 14, 14),
        Secondary = Color3.fromRGB(18, 18, 18),
        Accent = Color3.fromRGB(170, 0, 0),
        Text = Color3.fromRGB(255, 255, 255),
        LightRed = Color3.fromRGB(220, 0, 0)
    },
    Sizes = {
        Main = UDim2.new(0, 500, 0, 350),
        Mobile = UDim2.new(0, 380, 0, 500)
    }
}

-- DETECTAR DISPOSITIVO
local isMobile = UserInputService.TouchEnabled
local isSmallScreen = workspace.CurrentCamera.ViewportSize.X < 800

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "RYUZEN_HUB"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = not isMobile
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- FUNÇÃO PARA EFEITOS DE HOVER
local function createHoverEffect(button)
    local originalColor = button.BackgroundColor3
    local originalText = button.TextColor3
    
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = originalColor:Lerp(Color3.fromRGB(255, 255, 255), 0.1),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = originalColor,
            TextColor3 = originalText
        }):Play()
    end)
end

-- MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = isMobile and CONFIG.Sizes.Mobile or CONFIG.Sizes.Main
main.Position = isMobile and UDim2.new(0.5, -190, 0.5, -250) or UDim2.new(0.5, -250, 0.5, -175)
main.BackgroundColor3 = CONFIG.Theme.Primary
main.BorderSizePixel = 0
main.Active = true
main.Draggable = not isMobile
main.ZIndex = 2

-- ARREDONDAMENTO
local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 14)

-- BORDA COM GRADIENTE
local stroke = Instance.new("UIStroke", main)
stroke.Color = CONFIG.Theme.Accent
stroke.Thickness = 2
stroke.LineJoinMode = Enum.LineJoinMode.Round

-- SOMBRA
local shadow = Instance.new("ImageLabel", main)
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 24, 1, 24)
shadow.Position = UDim2.new(-0.024, 0, -0.024, 0)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.8
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.ZIndex = 1

-- TOP BAR
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1, 0, 0, 40)
top.BackgroundColor3 = CONFIG.Theme.Secondary
top.BorderSizePixel = 0

local topCorner = Instance.new("UICorner", top)
topCorner.CornerRadius = UDim.new(0, 14)
topCorner:Clone().Parent = top

-- TÍTULO
local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "⛩️ RYUZEN HUB v2.0"
title.Font = Enum.Font.GothamBold
title.TextSize = isMobile and 16 or 18
title.TextColor3 = CONFIG.Theme.LightRed
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

-- CLOSE BUTTON
local close = Instance.new("TextButton", top)
close.Size = UDim2.new(0, 40, 1, 0)
close.Position = UDim2.new(1, -40, 0, 0)
close.Text = "✕"
close.Font = Enum.Font.GothamBold
close.TextSize = 20
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.BackgroundTransparency = 1

createHoverEffect(close)

-- SIDEBAR
local sidebar = Instance.new("Frame", main)
sidebar.Position = UDim2.new(0, 0, 0, 40)
sidebar.Size = isMobile and UDim2.new(1, 0, 0, 50) or UDim2.new(0, 120, 1, -40)
sidebar.BackgroundColor3 = CONFIG.Theme.Secondary
sidebar.BorderSizePixel = 0

if isMobile then
    local layout = Instance.new("UIListLayout", sidebar)
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.Padding = UDim.new(0, 5)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
end

-- CONTENT AREA
local content = Instance.new("Frame", main)
content.Position = isMobile and UDim2.new(0, 0, 0, 90) or UDim2.new(0, 120, 0, 40)
content.Size = isMobile and UDim2.new(1, 0, 1, -90) or UDim2.new(1, -120, 1, -40)
content.BackgroundTransparency = 1
content.ClipsDescendants = true

-- SCROLLING PARA MOBILE
local scrolling = Instance.new("ScrollingFrame", content)
scrolling.Size = UDim2.new(1, 0, 1, 0)
scrolling.BackgroundTransparency = 1
scrolling.ScrollBarThickness = 4
scrolling.ScrollBarImageColor3 = CONFIG.Theme.Accent
scrolling.BorderSizePixel = 0
scrolling.CanvasSize = UDim2.new(0, 0, 0, 0)

local contentLayout = Instance.new("UIListLayout", scrolling)
contentLayout.Padding = UDim.new(0, 10)
contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
contentLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- FUNÇÃO CRIAR ABA
local tabs = {}
local activeTab = nil

local function createTab(name, order, icon)
    local btn = Instance.new("TextButton", sidebar)
    
    if isMobile then
        btn.Size = UDim2.new(0, 80, 1, 0)
        btn.LayoutOrder = order
    else
        btn.Size = UDim2.new(1, -10, 0, 40)
        btn.Position = UDim2.new(0, 5, 0, (order-1)*45 + 10)
    end
    
    btn.Text = icon and (icon .. " " .. name) or name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = isMobile and 12 or 14
    btn.TextColor3 = CONFIG.Theme.Text
    btn.BackgroundColor3 = CONFIG.Theme.Secondary
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 8)
    
    local frame = Instance.new("Frame", scrolling)
    frame.Size = UDim2.new(1, -20, 0, 0)
    frame.AutomaticSize = Enum.AutomaticSize.Y
    frame.Visible = false
    frame.BackgroundTransparency = 1
    frame.LayoutOrder = order
    
    local frameLayout = Instance.new("UIListLayout", frame)
    frameLayout.Padding = UDim.new(0, 15)
    frameLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    frameLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    tabs[name] = {button = btn, frame = frame}
    
    -- ESTILOS PARA BOTÃO ATIVO/INATIVO
    local function setActive(active)
        if active then
            TweenService:Create(btn, TweenInfo.new(0.3), {
                BackgroundColor3 = CONFIG.Theme.Accent,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        else
            TweenService:Create(btn, TweenInfo.new(0.3), {
                BackgroundColor3 = CONFIG.Theme.Secondary,
                TextColor3 = CONFIG.Theme.Text
            }):Play()
        end
    end
    
    btn.MouseButton1Click:Connect(function()
        if activeTab then
            tabs[activeTab].frame.Visible = false
            setActive(tabs[activeTab].button, false)
        end
        
        frame.Visible = true
        setActive(btn, true)
        activeTab = name
        
        -- Scroll para o topo em mobile
        if isMobile then
            scrolling.CanvasPosition = Vector2.new(0, 0)
        end
    end)
    
    createHoverEffect(btn)
    
    return frame
end

-- FUNÇÃO CRIAR BOTÃO
local function createButton(parent, text, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = CONFIG.Theme.Text
    btn.BackgroundColor3 = CONFIG.Theme.Accent
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 10)
    
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(255, 100, 100)
    stroke.Thickness = 1.5
    
    btn.MouseButton1Click:Connect(function()
        if callback then
            pcall(callback)
        end
        -- Efeito de clique
        TweenService:Create(btn, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        }):Play()
        task.wait(0.1)
        TweenService:Create(btn, TweenInfo.new(0.1), {
            BackgroundColor3 = CONFIG.Theme.Accent
        }):Play()
    end)
    
    createHoverEffect(btn)
    
    return btn
end

-- ABAS
local mainTab = createTab("Principal", 1, "🏠")
local funTab = createTab("Diversão", 2, "🎮")
local scriptsTab = createTab("Scripts", 3, "⚡")
local creditsTab = createTab("Créditos", 4, "⭐")

-- ATIVAR PRIMEIRA ABA
tabs["Principal"].frame.Visible = true
activeTab = "Principal"
TweenService:Create(tabs["Principal"].button, TweenInfo.new(0.3), {
    BackgroundColor3 = CONFIG.Theme.Accent,
    TextColor3 = Color3.fromRGB(255, 255, 255)
}):Play()

-- CONTEÚDO PRINCIPAL
local mainLabel = Instance.new("TextLabel", mainTab)
mainLabel.Size = UDim2.new(1, 0, 0, 30)
mainLabel.Text = "🎌 Bem-vindo ao RYUZEN HUB 🎌"
mainLabel.Font = Enum.Font.GothamBold
mainLabel.TextSize = 18
mainLabel.TextColor3 = CONFIG.Theme.LightRed
mainLabel.BackgroundTransparency = 1
mainLabel.LayoutOrder = 1

local subtitle = Instance.new("TextLabel", mainTab)
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Text = "Sistema otimizado para mobile e PC"
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 12
subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
subtitle.BackgroundTransparency = 1
subtitle.LayoutOrder = 2

-- FUN TAB
local funLabel = Instance.new("TextLabel", funTab)
funLabel.Size = UDim2.new(1, 0, 0, 30)
funLabel.Text = "🎯 Funções Divertidas"
funLabel.Font = Enum.Font.GothamBold
funLabel.TextSize = 16
funLabel.TextColor3 = CONFIG.Theme.Text
funLabel.BackgroundTransparency = 1
funLabel.LayoutOrder = 1

-- SCRIPTS TAB
local scriptsLabel = Instance.new("TextLabel", scriptsTab)
scriptsLabel.Size = UDim2.new(1, 0, 0, 30)
scriptsLabel.Text = "⚡ Scripts Automáticos"
scriptsLabel.Font = Enum.Font.GothamBold
scriptsLabel.TextSize = 16
scriptsLabel.TextColor3 = CONFIG.Theme.Text
scriptsLabel.BackgroundTransparency = 1
scriptsLabel.LayoutOrder = 1

-- CRÉDITOS
local credLabel = Instance.new("TextLabel", creditsTab)
credLabel.Size = UDim2.new(1, 0, 0, 40)
credLabel.Text = "✨ Criado por Luxzinho & Equipe ✨"
credLabel.Font = Enum.Font.GothamBold
credLabel.TextSize = 16
credLabel.TextColor3 = CONFIG.Theme.LightRed
credLabel.BackgroundTransparency = 1
credLabel.LayoutOrder = 1

local discordBtn = createButton(creditsTab, "📱 Discord", function()
    local link = "https://discord.gg/SEU_LINK"
    setclipboard(link)
    
    -- Feedback visual
    discordBtn.Text = "✅ Copiado!"
    task.wait(1)
    discordBtn.Text = "📱 Discord"
end)
discordBtn.LayoutOrder = 2

local copyGameId = createButton(creditsTab, "🎮 Copiar Game ID", function()
    setclipboard(tostring(game.PlaceId))
    
    copyGameId.Text = "✅ ID Copiado!"
    task.wait(1)
    copyGameId.Text = "🎮 Copiar Game ID"
end)
copyGameId.LayoutOrder = 3

-- BOTÃO PARA ABRIR/FECHAR
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, isMobile and 100 or 120, 0, 40)
openBtn.Position = UDim2.new(0, 20, 0.5, -20)
openBtn.Text = "⛩️ RYUZEN"
openBtn.Font = Enum.Font.GothamBold
openBtn.TextSize = 14
openBtn.TextColor3 = CONFIG.Theme.Text
openBtn.BackgroundColor3 = CONFIG.Theme.Accent
openBtn.Visible = false
openBtn.BorderSizePixel = 0

local openBtnCorner = Instance.new("UICorner", openBtn)
openBtnCorner.CornerRadius = UDim.new(0, 12)

createHoverEffect(openBtn)

-- FUNÇÕES DE ABRIR/FECHAR
close.MouseButton1Click:Connect(function()
    TweenService:Create(main, TweenInfo.new(0.3), {
        Position = UDim2.new(0.5, -250, -1, 0)
    }):Play()
    task.wait(0.3)
    main.Visible = false
    openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
    openBtn.Visible = false
    main.Visible = true
    TweenService:Create(main, TweenInfo.new(0.3), {
        Position = isMobile and UDim2.new(0.5, -190, 0.5, -250) or UDim2.new(0.5, -250, 0.5, -175)
    }):Play()
end)

-- AJUSTAR CANVAS SIZE
contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrolling.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 20)
end)

-- KEYBIND PARA ABRIR/FECHAR (PC apenas)
if not isMobile then
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.RightShift then
            if main.Visible then
                close.MouseButton1Click:Fire()
            else
                openBtn.MouseButton1Click:Fire()
            end
        end
    end)
end

-- TOGGLE VISIBILIDADE INICIAL
main.Visible = true
openBtn.Visible = false

print("⛩️ RYUZEN HUB Carregado com Sucesso!")
print("📱 Modo: " .. (isMobile and "Mobile" or "PC"))
print("🎯 Pressione RightShift para abrir/fechar (PC)")

return gui
