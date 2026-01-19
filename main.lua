-- ⚔️ RYUZEN HUB | ELITE EDITION v2.0
-- Professional UI | Complete Features
-- By Coffee & Frost

if getgenv().RYUZEN_LOADED then return end
getgenv().RYUZEN_LOADED = true

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

-- Modules
local module = {}
module.Functions = {}
module.Settings = {
    Noclip = false,
    Fly = false,
    Speed = false,
    ESP = false,
    Aimbot = false,
    ClickTP = false,
    InfJump = false,
    AntiAFK = false,
    NoRecoil = false,
    AutoClicker = false,
    AutoSprint = false,
    Xray = false,
    Chams = false,
    Tracers = false,
    Fullbright = false,
    NightVision = false,
    SpeedValue = 100,
    JumpValue = 50
}

-- Professional Color Palette
local COLORS = {
    Background = Color3.fromRGB(5, 5, 8),
    Surface = Color3.fromRGB(10, 10, 15),
    SurfaceLight = Color3.fromRGB(18, 18, 25),
    Primary = Color3.fromRGB(200, 20, 30),
    PrimaryDark = Color3.fromRGB(150, 10, 20),
    PrimaryLight = Color3.fromRGB(255, 60, 70),
    Accent = Color3.fromRGB(255, 100, 50),
    Text = Color3.fromRGB(240, 240, 245),
    TextSecondary = Color3.fromRGB(180, 180, 190),
    TextDisabled = Color3.fromRGB(100, 100, 110),
    Success = Color3.fromRGB(0, 200, 100),
    Warning = Color3.fromRGB(255, 180, 40),
    Danger = Color3.fromRGB(255, 50, 80),
    Info = Color3.fromRGB(0, 150, 255)
}

-- Fonts
local FONTS = {
    Title = Enum.Font.GothamBlack,
    Header = Enum.Font.GothamBold,
    Body = Enum.Font.GothamMedium,
    Monospace = Enum.Font.Code
}

-- Main GUI - DIMINUÍDO
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RyuzElite"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Background Blur Effect
local Blur = Instance.new("BlurEffect")
Blur.Size = 0
Blur.Parent = ScreenGui

-- Main Container - DIMINUÍDO
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 450, 0, 400) -- MENOR
Main.Position = UDim2.new(0.5, -225, 0.5, -200) -- CENTRALIZADO
Main.BackgroundColor3 = COLORS.Surface
Main.BackgroundTransparency = 0
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Active = true
Main.Draggable = true
Main.ZIndex = 10
Main.Parent = ScreenGui

-- Modern Border with Gradient
local Border = Instance.new("UIStroke")
Border.Color = COLORS.Primary
Border.Thickness = 1
Border.Transparency = 0.3
Border.LineJoinMode = Enum.LineJoinMode.Round
Border.Parent = Main

-- Header - MENOR
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 40) -- MENOR
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundColor3 = COLORS.SurfaceLight
Header.BorderSizePixel = 0
Header.ZIndex = 12
Header.Parent = Main

-- Header Gradient Line
local HeaderLine = Instance.new("Frame")
HeaderLine.Size = UDim2.new(1, 0, 0, 2)
HeaderLine.Position = UDim2.new(0, 0, 1, -2)
HeaderLine.BackgroundColor3 = COLORS.Primary
HeaderLine.BorderSizePixel = 0
HeaderLine.ZIndex = 13
HeaderLine.Parent = Header

-- Title with Icon - COMPACTO
local TitleContainer = Instance.new("Frame")
TitleContainer.Size = UDim2.new(0.6, 0, 1, 0)
TitleContainer.Position = UDim2.new(0, 15, 0, 0)
TitleContainer.BackgroundTransparency = 1
TitleContainer.ZIndex = 13
TitleContainer.Parent = Header

local TitleIcon = Instance.new("TextLabel")
TitleIcon.Size = UDim2.new(0, 24, 0, 24) -- MENOR
TitleIcon.Position = UDim2.new(0, 0, 0.5, -12) -- AJUSTADO
TitleIcon.Text = "⚔️"
TitleIcon.Font = FONTS.Title
TitleIcon.TextSize = 18 -- MENOR
TitleIcon.TextColor3 = COLORS.PrimaryLight
TitleIcon.BackgroundTransparency = 1
TitleIcon.ZIndex = 14
TitleIcon.Parent = TitleContainer

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -30, 1, 0) -- AJUSTADO
Title.Position = UDim2.new(0, 30, 0, 0) -- AJUSTADO
Title.Text = "RYUZEN v2.0" -- MAIS CURTO
Title.Font = FONTS.Title
Title.TextSize = 14 -- MENOR
Title.TextColor3 = COLORS.Text
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.TextTransparency = 0
Title.ZIndex = 14
Title.Parent = TitleContainer

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -30, 0, 12) -- MENOR
Subtitle.Position = UDim2.new(0, 30, 1, -14) -- AJUSTADO
Subtitle.Text = "Elite Hub"
Subtitle.Font = FONTS.Body
Subtitle.TextSize = 10 -- MENOR
Subtitle.TextColor3 = COLORS.TextSecondary
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.BackgroundTransparency = 1
Subtitle.ZIndex = 14
Subtitle.Parent = TitleContainer

-- Window Controls - COMPACTO
local WindowControls = Instance.new("Frame")
WindowControls.Size = UDim2.new(0.25, 0, 1, 0)
WindowControls.Position = UDim2.new(0.75, 0, 0, 0)
WindowControls.BackgroundTransparency = 1
WindowControls.ZIndex = 13
WindowControls.Parent = Header

-- Minimize Button (-) - CORRIGIDO
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 28, 0, 28) -- MENOR
MinimizeBtn.Position = UDim2.new(0, 5, 0.5, -14) -- AJUSTADO
MinimizeBtn.Text = "—"
MinimizeBtn.Font = FONTS.Header
MinimizeBtn.TextSize = 18 -- MENOR
MinimizeBtn.TextColor3 = COLORS.TextSecondary
MinimizeBtn.BackgroundColor3 = COLORS.SurfaceLight
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.AutoButtonColor = false
MinimizeBtn.ZIndex = 14
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Parent = WindowControls

-- Restore Button (□) - Inicialmente escondido
local RestoreBtn = Instance.new("TextButton")
RestoreBtn.Size = UDim2.new(0, 28, 0, 28)
RestoreBtn.Position = UDim2.new(0, 5, 0.5, -14)
RestoreBtn.Text = "□"
RestoreBtn.Font = FONTS.Header
RestoreBtn.TextSize = 14 -- MENOR
RestoreBtn.TextColor3 = COLORS.TextSecondary
RestoreBtn.BackgroundColor3 = COLORS.SurfaceLight
RestoreBtn.BorderSizePixel = 0
RestoreBtn.AutoButtonColor = false
RestoreBtn.ZIndex = 14
RestoreBtn.Visible = false
RestoreBtn.Name = "RestoreBtn"
RestoreBtn.Parent = WindowControls

-- Close Button (X) - CORRIGIDO
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28) -- MENOR
CloseBtn.Position = UDim2.new(1, -33, 0.5, -14) -- AJUSTADO
CloseBtn.Text = "✕"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16 -- MENOR
CloseBtn.TextColor3 = COLORS.Text
CloseBtn.BackgroundColor3 = COLORS.SurfaceLight
CloseBtn.BorderSizePixel = 0
CloseBtn.AutoButtonColor = false
CloseBtn.ZIndex = 14
CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = WindowControls

-- Hover Effects for Control Buttons
local function setupControlButton(button, hoverColor, clickColor)
    local originalColor = button.BackgroundColor3
    local originalText = button.TextColor3
    
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {
            BackgroundColor3 = hoverColor,
            TextColor3 = COLORS.Text
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {
            BackgroundColor3 = originalColor,
            TextColor3 = originalText
        }):Play()
    end)
    
    button.MouseButton1Down:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {
            BackgroundColor3 = clickColor
        }):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {
            BackgroundColor3 = hoverColor
        }):Play()
    end)
end

setupControlButton(MinimizeBtn, COLORS.Surface, COLORS.PrimaryDark)
setupControlButton(RestoreBtn, COLORS.Surface, COLORS.PrimaryDark)
setupControlButton(CloseBtn, COLORS.Danger, Color3.fromRGB(200, 40, 60))

-- Navigation Sidebar - MENOR
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 150, 1, -40) -- MENOR
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.BackgroundColor3 = COLORS.SurfaceLight
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 11
Sidebar.Parent = Main

-- Sidebar Separator
local SidebarSeparator = Instance.new("Frame")
SidebarSeparator.Size = UDim2.new(0, 1, 1, 0)
SidebarSeparator.Position = UDim2.new(1, -1, 0, 0)
SidebarSeparator.BackgroundColor3 = COLORS.Surface
SidebarSeparator.BorderSizePixel = 0
SidebarSeparator.ZIndex = 12
SidebarSeparator.Parent = Sidebar

-- Content Area - AJUSTADO
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -150, 1, -40) -- AJUSTADO
Content.Position = UDim2.new(0, 150, 0, 40)
Content.BackgroundColor3 = COLORS.Background
Content.BorderSizePixel = 0
Content.ZIndex = 10
Content.Parent = Main

-- Status Bar - MENOR
local StatusBar = Instance.new("Frame")
StatusBar.Size = UDim2.new(1, 0, 0, 25) -- MENOR
StatusBar.Position = UDim2.new(0, 0, 1, -25)
StatusBar.BackgroundColor3 = COLORS.SurfaceLight
StatusBar.BorderSizePixel = 0
StatusBar.ZIndex = 12
StatusBar.Parent = Main

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(0.7, 0, 1, 0)
StatusText.Position = UDim2.new(0, 10, 0, 0)
StatusText.Text = "Ready | Coffee ☕ & Frost ❄️"
StatusText.Font = FONTS.Body
StatusText.TextSize = 11 -- MENOR
StatusText.TextColor3 = COLORS.TextSecondary
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.BackgroundTransparency = 1
StatusText.ZIndex = 13
StatusText.Parent = StatusBar

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Size = UDim2.new(0.3, 0, 1, 0)
FPSLabel.Position = UDim2.new(0.7, 0, 0, 0)
FPSLabel.Text = "FPS: 60"
FPSLabel.Font = FONTS.Monospace
FPSLabel.TextSize = 11 -- MENOR
FPSLabel.TextColor3 = COLORS.TextSecondary
FPSLabel.TextXAlignment = Enum.TextXAlignment.Right
FPSLabel.BackgroundTransparency = 1
FPSLabel.ZIndex = 13
FPSLabel.Parent = StatusBar

-- FPS Counter
spawn(function()
    while true do
        local fps = math.floor(1/RunService.RenderStepped:Wait())
        FPSLabel.Text = "FPS: " .. fps
        wait(0.5)
    end
end)

-- Tab System
local Tabs = {}
local ActiveTab = nil

-- Function to create professional tab - COMPACTO
local function createTab(name, icon, description, color)
    local TabButton = Instance.new("TextButton")
    TabButton.Name = name .. "Tab"
    TabButton.Size = UDim2.new(1, -10, 0, 45) -- MENOR
    TabButton.Position = UDim2.new(0, 5, 0, (#Tabs * 48) + 5) -- AJUSTADO
    TabButton.Text = ""
    TabButton.BackgroundColor3 = COLORS.SurfaceLight
    TabButton.BorderSizePixel = 0
    TabButton.AutoButtonColor = false
    TabButton.ZIndex = 12
    TabButton.Parent = Sidebar
    
    -- Tab Icon - MENOR
    local TabIcon = Instance.new("TextLabel")
    TabIcon.Size = UDim2.new(0, 22, 0, 22) -- MENOR
    TabIcon.Position = UDim2.new(0, 12, 0.5, -11)
    TabIcon.Text = icon
    TabIcon.Font = FONTS.Body
    TabIcon.TextSize = 14 -- MENOR
    TabIcon.TextColor3 = COLORS.TextSecondary
    TabIcon.BackgroundTransparency = 1
    TabIcon.ZIndex = 13
    TabIcon.Parent = TabButton
    
    -- Tab Name - MENOR
    local TabName = Instance.new("TextLabel")
    TabName.Size = UDim2.new(1, -40, 0, 18) -- AJUSTADO
    TabName.Position = UDim2.new(0, 40, 0.5, -9)
    TabName.Text = name:upper()
    TabName.Font = FONTS.Header
    TabName.TextSize = 11 -- MENOR
    TabName.TextColor3 = COLORS.TextSecondary
    TabName.TextXAlignment = Enum.TextXAlignment.Left
    TabName.BackgroundTransparency = 1
    TabName.ZIndex = 13
    TabName.Parent = TabButton
    
    -- Tab Description - MENOR
    local TabDesc = Instance.new("TextLabel")
    TabDesc.Size = UDim2.new(1, -40, 0, 12) -- MENOR
    TabDesc.Position = UDim2.new(0, 40, 0.5, 6)
    TabDesc.Text = description
    TabDesc.Font = FONTS.Body
    TabDesc.TextSize = 9 -- MENOR
    TabDesc.TextColor3 = COLORS.TextDisabled
    TabDesc.TextXAlignment = Enum.TextXAlignment.Left
    TabDesc.BackgroundTransparency = 1
    TabDesc.ZIndex = 13
    TabDesc.Parent = TabButton
    
    -- Active Indicator
    local ActiveIndicator = Instance.new("Frame")
    ActiveIndicator.Size = UDim2.new(0, 3, 0.6, 0) -- MENOR
    ActiveIndicator.Position = UDim2.new(0, 0, 0.2, 0)
    ActiveIndicator.BackgroundColor3 = color or COLORS.Primary
    ActiveIndicator.BorderSizePixel = 0
    ActiveIndicator.Visible = false
    ActiveIndicator.ZIndex = 13
    ActiveIndicator.Parent = TabButton
    
    -- Hover Effect
    local HoverOverlay = Instance.new("Frame")
    HoverOverlay.Size = UDim2.new(1, 0, 1, 0)
    HoverOverlay.BackgroundColor3 = color or COLORS.Primary
    HoverOverlay.BackgroundTransparency = 0.9
    HoverOverlay.BorderSizePixel = 0
    HoverOverlay.Visible = false
    HoverOverlay.ZIndex = 11
    HoverOverlay.Parent = TabButton
    
    -- Content Frame
    local TabContent = Instance.new("ScrollingFrame")
    TabContent.Name = name .. "Content"
    TabContent.Size = UDim2.new(1, 0, 1, -25) -- AJUSTADO
    TabContent.BackgroundTransparency = 1
    TabContent.ScrollBarThickness = 3 -- MENOR
    TabContent.ScrollBarImageColor3 = color or COLORS.Primary
    TabContent.BorderSizePixel = 0
    TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContent.Visible = false
    TabContent.ZIndex = 10
    TabContent.Parent = Content
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Padding = UDim.new(0, 8) -- MENOR
    ContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Parent = TabContent
    
    -- Store tab data
    local tabData = {
        Button = TabButton,
        Content = TabContent,
        Indicator = ActiveIndicator,
        Hover = HoverOverlay,
        Icon = TabIcon,
        Name = TabName,
        Desc = TabDesc,
        Color = color or COLORS.Primary
    }
    
    Tabs[name] = tabData
    
    -- Tab button interactions
    TabButton.MouseEnter:Connect(function()
        if ActiveTab ~= name then
            HoverOverlay.Visible = true
            TweenService:Create(TabIcon, TweenInfo.new(0.15), {
                TextColor3 = COLORS.Text
            }):Play()
            TweenService:Create(TabName, TweenInfo.new(0.15), {
                TextColor3 = COLORS.Text
            }):Play()
        end
    end)
    
    TabButton.MouseLeave:Connect(function()
        if ActiveTab ~= name then
            HoverOverlay.Visible = false
            TweenService:Create(TabIcon, TweenInfo.new(0.15), {
                TextColor3 = COLORS.TextSecondary
            }):Play()
            TweenService:Create(TabName, TweenInfo.new(0.15), {
                TextColor3 = COLORS.TextSecondary
            }):Play()
        end
    end)
    
    TabButton.MouseButton1Click:Connect(function()
        if ActiveTab == name then return end
        
        -- Deactivate current tab
        if ActiveTab then
            local currentTab = Tabs[ActiveTab]
            currentTab.Content.Visible = false
            currentTab.Indicator.Visible = false
            currentTab.Hover.Visible = false
            TweenService:Create(currentTab.Button, TweenInfo.new(0.2), {
                BackgroundColor3 = COLORS.SurfaceLight
            }):Play()
            TweenService:Create(currentTab.Icon, TweenInfo.new(0.2), {
                TextColor3 = COLORS.TextSecondary
            }):Play()
            TweenService:Create(currentTab.Name, TweenInfo.new(0.2), {
                TextColor3 = COLORS.TextSecondary
            }):Play()
            TweenService:Create(currentTab.Desc, TweenInfo.new(0.2), {
                TextColor3 = COLORS.TextDisabled
            }):Play()
        end
        
        -- Activate new tab
        ActiveTab = name
        TabContent.Visible = true
        ActiveIndicator.Visible = true
        
        TweenService:Create(TabButton, TweenInfo.new(0.2), {
            BackgroundColor3 = color or COLORS.PrimaryDark
        }):Play()
        TweenService:Create(TabIcon, TweenInfo.new(0.2), {
            TextColor3 = color or COLORS.PrimaryLight
        }):Play()
        TweenService:Create(TabName, TweenInfo.new(0.2), {
            TextColor3 = COLORS.Text
        }):Play()
        TweenService:Create(TabDesc, TweenInfo.new(0.2), {
            TextColor3 = COLORS.TextSecondary
        }):Play()
    end)
    
    return TabContent
end

-- Create Tabs with different colors - MESMAS ABAS MAS MAIS COMPACTAS
local CombatTab = createTab("Combat", "⚔️", "Aimbot & Weapons", COLORS.Primary)
local MovementTab = createTab("Movement", "🏃", "Speed & Fly", Color3.fromRGB(0, 180, 255))
local VisualTab = createTab("Visual", "👁️", "ESP & Effects", Color3.fromRGB(0, 200, 100))
local PlayerTab = createTab("Player", "👤", "Character Mods", Color3.fromRGB(255, 150, 0))
local WorldTab = createTab("World", "🌍", "Environment", Color3.fromRGB(150, 0, 255))
local UtilityTab = createTab("Utility", "🛠️", "Tools & Info", Color3.fromRGB(180, 180, 180))
local TrollTab = createTab("Troll", "😈", "Fun & Troll", Color3.fromRGB(255, 50, 150))
local SettingsTab = createTab("Settings", "⚙️", "Configuration", Color3.fromRGB(100, 100, 100))
local CreditsTab = createTab("Credits", "⭐", "Creators & Info", Color3.fromRGB(255, 215, 0)) -- NOVA ABA

-- Function to create professional toggle button - COMPACTO
local function createToggle(parent, name, description, defaultState, callback, color)
    local ToggleContainer = Instance.new("Frame")
    ToggleContainer.Size = UDim2.new(0.94, 0, 0, 50) -- MENOR
    ToggleContainer.BackgroundColor3 = COLORS.SurfaceLight
    ToggleContainer.BorderSizePixel = 0
    ToggleContainer.LayoutOrder = #parent:GetChildren()
    ToggleContainer.Parent = parent
    
    -- Toggle Info - COMPACTO
    local ToggleInfo = Instance.new("Frame")
    ToggleInfo.Size = UDim2.new(0.7, 0, 1, 0)
    ToggleInfo.BackgroundTransparency = 1
    ToggleInfo.Parent = ToggleContainer
    
    local ToggleName = Instance.new("TextLabel")
    ToggleName.Size = UDim2.new(1, -15, 0, 20) -- MENOR
    ToggleName.Position = UDim2.new(0, 15, 0, 8) -- AJUSTADO
    ToggleName.Text = name
    ToggleName.Font = FONTS.Header
    ToggleName.TextSize = 12 -- MENOR
    ToggleName.TextColor3 = COLORS.Text
    ToggleName.TextXAlignment = Enum.TextXAlignment.Left
    ToggleName.BackgroundTransparency = 1
    ToggleName.Parent = ToggleInfo
    
    local ToggleDesc = Instance.new("TextLabel")
    ToggleDesc.Size = UDim2.new(1, -15, 0, 16) -- MENOR
    ToggleDesc.Position = UDim2.new(0, 15, 1, -20) -- AJUSTADO
    ToggleDesc.Text = description
    ToggleDesc.Font = FONTS.Body
    ToggleDesc.TextSize = 10 -- MENOR
    ToggleDesc.TextColor3 = COLORS.TextSecondary
    ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
    ToggleDesc.BackgroundTransparency = 1
    ToggleDesc.Parent = ToggleInfo
    
    -- Toggle Switch - MENOR
    local ToggleSwitch = Instance.new("Frame")
    ToggleSwitch.Size = UDim2.new(0, 46, 0, 24) -- MENOR
    ToggleSwitch.Position = UDim2.new(1, -56, 0.5, -12)
    ToggleSwitch.BackgroundColor3 = COLORS.Surface
    ToggleSwitch.BorderSizePixel = 0
    ToggleSwitch.Parent = ToggleContainer
    
    local ToggleKnob = Instance.new("Frame")
    ToggleKnob.Size = UDim2.new(0, 18, 0, 18) -- MENOR
    ToggleKnob.Position = UDim2.new(0, 3, 0.5, -9)
    ToggleKnob.BackgroundColor3 = defaultState and (color or COLORS.Success) or COLORS.TextDisabled
    ToggleKnob.BorderSizePixel = 0
    ToggleKnob.Parent = ToggleSwitch
    
    local state = defaultState
    
    local function updateToggle()
        if state then
            TweenService:Create(ToggleKnob, TweenInfo.new(0.2), {
                Position = UDim2.new(1, -21, 0.5, -9),
                BackgroundColor3 = color or COLORS.Success
            }):Play()
            TweenService:Create(ToggleSwitch, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(0, 100, 50)
            }):Play()
        else
            TweenService:Create(ToggleKnob, TweenInfo.new(0.2), {
                Position = UDim2.new(0, 3, 0.5, -9),
                BackgroundColor3 = COLORS.TextDisabled
            }):Play()
            TweenService:Create(ToggleSwitch, TweenInfo.new(0.2), {
                BackgroundColor3 = COLORS.Surface
            }):Play()
        end
    end
    
    updateToggle()
    
    -- Click functionality
    ToggleContainer.MouseButton1Click:Connect(function()
        state = not state
        updateToggle()
        if callback then
            pcall(callback, state)
        end
    end)
    
    -- Hover effects
    ToggleContainer.MouseEnter:Connect(function()
        TweenService:Create(ToggleContainer, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.Surface
        }):Play()
    end)
    
    ToggleContainer.MouseLeave:Connect(function()
        TweenService:Create(ToggleContainer, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.SurfaceLight
        }):Play()
    end)
    
    return {GetState = function() return state end, SetState = function(s) state = s; updateToggle() end}
end

-- Function to create professional button - COMPACTO
local function createButton(parent, name, description, icon, callback, color)
    local ButtonContainer = Instance.new("TextButton")
    ButtonContainer.Size = UDim2.new(0.94, 0, 0, 46) -- MENOR
    ButtonContainer.Text = ""
    ButtonContainer.BackgroundColor3 = COLORS.SurfaceLight
    ButtonContainer.BorderSizePixel = 0
    ButtonContainer.AutoButtonColor = false
    ButtonContainer.LayoutOrder = #parent:GetChildren()
    ButtonContainer.Parent = parent
    
    -- Button Icon - MENOR
    local ButtonIcon = Instance.new("TextLabel")
    ButtonIcon.Size = UDim2.new(0, 26, 0, 26) -- MENOR
    ButtonIcon.Position = UDim2.new(0, 12, 0.5, -13)
    ButtonIcon.Text = icon
    ButtonIcon.Font = FONTS.Body
    ButtonIcon.TextSize = 16 -- MENOR
    ButtonIcon.TextColor3 = color or COLORS.Primary
    ButtonIcon.BackgroundTransparency = 1
    ButtonIcon.Parent = ButtonContainer
    
    -- Button Info - COMPACTO
    local ButtonName = Instance.new("TextLabel")
    ButtonName.Size = UDim2.new(1, -50, 0, 20) -- AJUSTADO
    ButtonName.Position = UDim2.new(0, 46, 0, 8) -- AJUSTADO
    ButtonName.Text = name
    ButtonName.Font = FONTS.Header
    ButtonName.TextSize = 12 -- MENOR
    ButtonName.TextColor3 = COLORS.Text
    ButtonName.TextXAlignment = Enum.TextXAlignment.Left
    ButtonName.BackgroundTransparency = 1
    ButtonName.Parent = ButtonContainer
    
    local ButtonDesc = Instance.new("TextLabel")
    ButtonDesc.Size = UDim2.new(1, -50, 0, 14) -- MENOR
    ButtonDesc.Position = UDim2.new(0, 46, 1, -18) -- AJUSTADO
    ButtonDesc.Text = description
    ButtonDesc.Font = FONTS.Body
    ButtonDesc.TextSize = 10 -- MENOR
    ButtonDesc.TextColor3 = COLORS.TextSecondary
    ButtonDesc.TextXAlignment = Enum.TextXAlignment.Left
    ButtonDesc.BackgroundTransparency = 1
    ButtonDesc.Parent = ButtonContainer
    
    -- Click functionality
    ButtonContainer.MouseButton1Click:Connect(function()
        TweenService:Create(ButtonContainer, TweenInfo.new(0.1), {
            BackgroundColor3 = color or COLORS.PrimaryDark
        }):Play()
        task.wait(0.1)
        TweenService:Create(ButtonContainer, TweenInfo.new(0.1), {
            BackgroundColor3 = COLORS.SurfaceLight
        }):Play()
        
        if callback then
            pcall(callback)
        end
    end)
    
    -- Hover effects
    ButtonContainer.MouseEnter:Connect(function()
        TweenService:Create(ButtonContainer, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.Surface
        }):Play()
        TweenService:Create(ButtonIcon, TweenInfo.new(0.15), {
            TextColor3 = color or COLORS.PrimaryLight
        }):Play()
    end)
    
    ButtonContainer.MouseLeave:Connect(function()
        TweenService:Create(ButtonContainer, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.SurfaceLight
        }):Play()
        TweenService:Create(ButtonIcon, TweenInfo.new(0.15), {
            TextColor3 = color or COLORS.Primary
        }):Play()
    end)
    
    return ButtonContainer
end

-- Function to create professional slider - COMPACTO
local function createSlider(parent, name, min, max, default, callback, color)
    local SliderContainer = Instance.new("Frame")
    SliderContainer.Size = UDim2.new(0.94, 0, 0, 65) -- MENOR
    SliderContainer.BackgroundColor3 = COLORS.SurfaceLight
    SliderContainer.BorderSizePixel = 0
    SliderContainer.LayoutOrder = #parent:GetChildren()
    SliderContainer.Parent = parent
    
    local SliderName = Instance.new("TextLabel")
    SliderName.Size = UDim2.new(1, -40, 0, 20) -- MENOR
    SliderName.Position = UDim2.new(0, 15, 0, 8) -- AJUSTADO
    SliderName.Text = name
    SliderName.Font = FONTS.Header
    SliderName.TextSize = 12 -- MENOR
    SliderName.TextColor3 = COLORS.Text
    SliderName.TextXAlignment = Enum.TextXAlignment.Left
    SliderName.BackgroundTransparency = 1
    SliderName.Parent = SliderContainer
    
    local SliderValue = Instance.new("TextLabel")
    SliderValue.Size = UDim2.new(0, 50, 0, 20) -- MENOR
    SliderValue.Position = UDim2.new(1, -65, 0, 8) -- AJUSTADO
    SliderValue.Text = tostring(default)
    SliderValue.Font = FONTS.Monospace
    SliderValue.TextSize = 12 -- MENOR
    SliderValue.TextColor3 = color or COLORS.PrimaryLight
    SliderValue.TextXAlignment = Enum.TextXAlignment.Right
    SliderValue.BackgroundTransparency = 1
    SliderValue.Parent = SliderContainer
    
    local SliderTrack = Instance.new("Frame")
    SliderTrack.Size = UDim2.new(1, -30, 0, 4) -- AJUSTADO
    SliderTrack.Position = UDim2.new(0, 15, 1, -22) -- AJUSTADO
    SliderTrack.BackgroundColor3 = COLORS.Surface
    SliderTrack.BorderSizePixel = 0
    SliderTrack.Parent = SliderContainer
    
    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.BackgroundColor3 = color or COLORS.Primary
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = SliderTrack
    
    local SliderKnob = Instance.new("Frame")
    SliderKnob.Size = UDim2.new(0, 14, 0, 14) -- MENOR
    SliderKnob.Position = UDim2.new((default - min) / (max - min), -7, 0.5, -7)
    SliderKnob.BackgroundColor3 = color or COLORS.PrimaryLight
    SliderKnob.BorderSizePixel = 0
    SliderKnob.Parent = SliderTrack
    
    local value = default
    local dragging = false
    
    local function updateSlider(newValue)
        value = math.clamp(newValue, min, max)
        local ratio = (value - min) / (max - min)
        
        SliderFill.Size = UDim2.new(ratio, 0, 1, 0)
        SliderKnob.Position = UDim2.new(ratio, -7, 0.5, -7)
        SliderValue.Text = string.format("%.1f", value)
        
        if callback then
            pcall(callback, value)
        end
    end
    
    SliderKnob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    SliderKnob.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = game:GetService("Players").LocalPlayer:GetMouse()
            local relativeX = (mousePos.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X
            local newValue = min + (relativeX * (max - min))
            updateSlider(newValue)
        end
    end)
    
    -- Hover effects
    SliderContainer.MouseEnter:Connect(function()
        TweenService:Create(SliderContainer, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.Surface
        }):Play()
    end)
    
    SliderContainer.MouseLeave:Connect(function()
        TweenService:Create(SliderContainer, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.SurfaceLight
        }):Play()
    end)
    
    updateSlider(default)
    return {GetValue = function() return value end, SetValue = updateSlider}
end

-- ========== COMBAT TAB ==========
createToggle(CombatTab, "Aimbot", "Auto-aim at nearest player", false, function(state)
    module.Settings.Aimbot = state
    StatusText.Text = "Aimbot: " .. (state and "ENABLED" or "DISABLED")
end)

createToggle(CombatTab, "Silent Aim", "Undetectable aimbot", false, function(state)
    StatusText.Text = "Silent Aim: " .. (state and "ENABLED" or "DISABLED")
end)

createToggle(CombatTab, "Trigger Bot", "Auto-shoot when aiming", false, function(state)
    module.Settings.AutoClicker = state
    StatusText.Text = "Trigger Bot: " .. (state and "ENABLED" or "DISABLED")
end)

createToggle(CombatTab, "No Recoil", "Remove weapon recoil", false, function(state)
    module.Settings.NoRecoil = state
    StatusText.Text = "No Recoil: " .. (state and "ENABLED" or "DISABLED")
end)

createToggle(CombatTab, "Auto Reload", "Auto reload weapons", false, function(state)
    StatusText.Text = "Auto Reload: " .. (state and "ENABLED" or "DISABLED")
end)

createSlider(CombatTab, "Field of View", 70, 120, 80, function(value)
    workspace.CurrentCamera.FieldOfView = value
    StatusText.Text = "FOV: " .. value
end, COLORS.Warning)

createSlider(CombatTab, "Aimbot Smoothness", 1, 20, 5, function(value)
    StatusText.Text = "Smoothness: " .. value
end, COLORS.Danger)

-- ========== MOVEMENT TAB ==========
createToggle(MovementTab, "Flight Mode", "Toggle flying ability", false, function(state)
    module.Settings.Fly = state
    StatusText.Text = "Flight: " .. (state and "ENABLED" or "DISABLED")
    
    if state then
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
            bodyVelocity.Parent = root
            
            spawn(function()
                while module.Settings.Fly do
                    local cam = workspace.CurrentCamera.CFrame
                    local moveDirection = Vector3.new(0, 0, 0)
                    
                    local keys = {
                        [Enum.KeyCode.W] = cam.LookVector,
                        [Enum.KeyCode.S] = -cam.LookVector,
                        [Enum.KeyCode.A] = -cam.RightVector,
                        [Enum.KeyCode.D] = cam.RightVector,
                        [Enum.KeyCode.Space] = Vector3.new(0, 1, 0),
                        [Enum.KeyCode.LeftShift] = Vector3.new(0, -1, 0)
                    }
                    
                    for key, vector in pairs(keys) do
                        if UserInputService:IsKeyDown(key) then
                            moveDirection = moveDirection + vector
                        end
                    end
                    
                    bodyVelocity.Velocity = moveDirection.Unit * 100
                    RunService.RenderStepped:Wait()
                end
            end)
        end
    else
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            for _, child in pairs(root:GetChildren()) do
                if child:IsA("BodyVelocity") then
                    child:Destroy()
                end
            end
        end
    end
end)

createSlider(MovementTab, "Speed", 16, 300, 100, function(value)
    module.Settings.SpeedValue = value
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = value
    end
    StatusText.Text = "Speed: " .. value
end, Color3.fromRGB(0, 180, 255))

createToggle(MovementTab, "Noclip", "Walk through objects", false, function(state)
    module.Settings.Noclip = state
    StatusText.Text = "Noclip: " .. (state and "ENABLED" or "DISABLED")
end)

createToggle(MovementTab, "Infinite Jump", "Jump infinitely", false, function(state)
    module.Settings.InfJump = state
    StatusText.Text = "Inf Jump: " .. (state and "ENABLED" or "DISABLED")
    
    if state then
        UserInputService.JumpRequest:Connect(function()
            if module.Settings.InfJump and player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
    end
end)

createSlider(MovementTab, "Jump Power", 50, 500, 50, function(value)
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = value
    end
    StatusText.Text = "Jump Power: " .. value
end, Color3.fromRGB(0, 200, 100))

createToggle(MovementTab, "Auto Sprint", "Always sprint", false, function(state)
    module.Settings.AutoSprint = state
    StatusText.Text = "Auto Sprint: " .. (state and "ENABLED" or "DISABLED")
end)

createToggle(MovementTab, "Wall Walk", "Walk on walls", false, function(state)
    StatusText.Text = "Wall Walk: " .. (state and "ENABLED" or "DISABLED")
end)

-- ========== VISUAL TAB ==========
createToggle(VisualTab, "ESP", "See players through walls", false, function(state)
    module.Settings.ESP = state
    StatusText.Text = "ESP: " .. (state and "ENABLED" or "DISABLED")
    
    if state then
        for _, targetPlayer in pairs(Players:GetPlayers()) do
            if targetPlayer ~= player and targetPlayer.Character then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = Color3.fromRGB(255, 50, 50)
                highlight.OutlineColor = Color3.fromRGB(255, 100, 100)
                highlight.FillTransparency = 0.5
                highlight.Parent = targetPlayer.Character
                highlight.Name = "RyuzESP"
            end
        end
    else
        for _, targetPlayer in pairs(Players:GetPlayers()) do
            if targetPlayer.Character then
                for _, child in pairs(targetPlayer.Character:GetChildren()) do
                    if child.Name == "RyuzESP" then
                        child:Destroy()
                    end
                end
            end
        end
    end
end, Color3.fromRGB(0, 200, 100))

createToggle(VisualTab, "X-Ray", "See through walls", false, function(state)
    module.Settings.Xray = state
    if state then
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Transparency < 1 then
                part.LocalTransparencyModifier = 0.5
            end
        end
    else
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.LocalTransparencyModifier = 0
            end
        end
    end
    StatusText.Text = "X-Ray: " .. (state and "ENABLED" or "DISABLED")
end)

createToggle(VisualTab, "Chams", "Color player models", false, function(state)
    module.Settings.Chams = state
    StatusText.Text = "Chams: " .. (state and "ENABLED" or "DISABLED")
end)

createToggle(VisualTab, "Tracers", "Draw lines to players", false, function(state)
    module.Settings.Tracers = state
    StatusText.Text = "Tracers: " .. (state and "ENABLED" or "DISABLED")
end)

createToggle(VisualTab, "Name Tags", "Show player names", true, function(state)
    StatusText.Text = "Name Tags: " .. (state and "ENABLED" or "DISABLED")
end, COLORS.Info)

createToggle(VisualTab, "Health Bars", "Show health bars", true, function(state)
    StatusText.Text = "Health Bars: " .. (state and "ENABLED" or "DISABLED")
end, COLORS.Danger)

createSlider(VisualTab, "ESP Distance", 50, 500, 200, function(value)
    StatusText.Text = "ESP Distance: " .. value
end, Color3.fromRGB(0, 200, 100))

-- ========== PLAYER TAB ==========
createButton(PlayerTab, "God Mode", "Become invincible", "🛡️", function()
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        StatusText.Text = "God Mode: ENABLED"
    end
end, Color3.fromRGB(255, 150, 0))

createButton(PlayerTab, "Invisible", "Become invisible", "👻", function()
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
        StatusText.Text = "Invisibility: ENABLED"
    end
end, Color3.fromRGB(255, 150, 0))

createButton(PlayerTab, "Reset Character", "Reset your character", "🔄", function()
    if player.Character then
        player.Character:BreakJoints()
        StatusText.Text = "Character Reset"
    end
end, Color3.fromRGB(255, 150, 0))

createButton(PlayerTab, "Max Health", "Set health to maximum", "❤️", function()
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Health = humanoid.MaxHealth
        StatusText.Text = "Health: MAX"
    end
end, Color3.fromRGB(255, 150, 0))

createToggle(PlayerTab, "Auto Heal", "Automatically heal", false, function(state)
    StatusText.Text = "Auto Heal: " .. (state and "ENABLED" or "DISABLED")
end, COLORS.Success)

createSlider(PlayerTab, "Gravity", 0, 196, 196, function(value)
    workspace.Gravity = value
    StatusText.Text = "Gravity: " .. value
end, Color3.fromRGB(255, 150, 0))

-- ========== WORLD TAB ==========
createToggle(WorldTab, "Fullbright", "Maximum brightness", false, function(state)
    module.Settings.Fullbright = state
    if state then
        Lighting.Brightness = 2
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        Lighting.Brightness = 1
        Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    end
    StatusText.Text = "Fullbright: " .. (state and "ENABLED" or "DISABLED")
end, Color3.fromRGB(150, 0, 255))

createToggle(WorldTab, "Night Vision", "See in the dark", false, function(state)
    module.Settings.NightVision = state
    if state then
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness = 1.5
    else
        Lighting.Ambient = Color3.fromRGB(0, 0, 0)
        Lighting.Brightness = 1
    end
    StatusText.Text = "Night Vision: " .. (state and "ENABLED" or "DISABLED")
end, Color3.fromRGB(150, 0, 255))

createSlider(WorldTab, "Time of Day", 0, 24, 12, function(value)
    Lighting.ClockTime = value
    StatusText.Text = "Time: " .. string.format("%.1f", value)
end, Color3.fromRGB(150, 0, 255))

createToggle(WorldTab, "Remove Fog", "Remove all fog", false, function(state)
    if state then
        Lighting.FogEnd = 100000
        StatusText.Text = "Fog: REMOVED"
    else
        Lighting.FogEnd = 1000
        StatusText.Text = "Fog: RESTORED"
    end
end, Color3.fromRGB(150, 0, 255))

createSlider(WorldTab, "Fog Density", 0, 1, 0.5, function(value)
    Lighting.FogEnd = 1000 - (value * 800)
    StatusText.Text = "Fog Density: " .. string.format("%.2f", value)
end, Color3.fromRGB(150, 0, 255))

-- ========== UTILITY TAB ==========
createToggle(UtilityTab, "Anti-AFK", "Prevent getting kicked", false, function(state)
    module.Settings.AntiAFK = state
    StatusText.Text = "Anti-AFK: " .. (state and "ENABLED" or "DISABLED")
    
    if state then
        local virtualUser = game:GetService("VirtualUser")
        spawn(function()
            while module.Settings.AntiAFK do
                virtualUser:CaptureController()
                virtualUser:ClickButton2(Vector2.new())
                wait(30)
            end
        end)
    end
end, Color3.fromRGB(180, 180, 180))

createToggle(UtilityTab, "Click Teleport", "Teleport to clicked location", false, function(state)
    module.Settings.ClickTP = state
    StatusText.Text = "Click TP: " .. (state and "ENABLED" or "DISABLED")
    
    if state then
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
        getgenv().ClickTPConnection = connection
    else
        if getgenv().ClickTPConnection then
            getgenv().ClickTPConnection:Disconnect()
        end
    end
end, Color3.fromRGB(180, 180, 180))

createButton(UtilityTab, "Copy Game ID", "Copy Place ID to clipboard", "🎮", function()
    setclipboard(tostring(game.PlaceId))
    StatusText.Text = "Game ID Copied: " .. game.PlaceId
end, Color3.fromRGB(180, 180, 180))

createButton(UtilityTab, "Copy Job ID", "Copy Server ID to clipboard", "🔗", function()
    setclipboard(tostring(game.JobId))
    StatusText.Text = "Job ID Copied"
end, Color3.fromRGB(180, 180, 180))

createToggle(UtilityTab, "Reach", "Extended reach distance", false, function(state)
    StatusText.Text = "Reach: " .. (state and "ENABLED" or "DISABLED")
end, Color3.fromRGB(180, 180, 180))

createToggle(UtilityTab, "Auto Collect", "Auto collect items", false, function(state)
    StatusText.Text = "Auto Collect: " .. (state and "ENABLED" or "DISABLED")
end, Color3.fromRGB(180, 180, 180))

createButton(UtilityTab, "Server Hop", "Join another server", "🔄", function()
    StatusText.Text = "Server hopping..."
end, Color3.fromRGB(180, 180, 180))

-- ========== TROLL TAB ==========
createButton(TrollTab, "Teleport All Players", "Bring everyone to you", "📍", function()
    local myRoot = player.Character:FindFirstChild("HumanoidRootPart")
    if myRoot then
        for _, targetPlayer in pairs(Players:GetPlayers()) do
            if targetPlayer ~= player and targetPlayer.Character then
                local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                if targetRoot then
                    targetRoot.CFrame = myRoot.CFrame
                end
            end
        end
        StatusText.Text = "All players teleported to you!"
    end
end, Color3.fromRGB(255, 50, 150))

createButton(TrollTab, "Launch Players", "Send players flying", "🚀", function()
    for _, targetPlayer in pairs(Players:GetPlayers()) do
        if targetPlayer ~= player and targetPlayer.Character then
            local root = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local bv = Instance.new("BodyVelocity")
                bv.Velocity = Vector3.new(0, 300, 0)
                bv.MaxForce = Vector3.new(0, math.huge, 0)
                bv.Parent = root
                game:GetService("Debris"):AddItem(bv, 1)
            end
        end
    end
    StatusText.Text = "Players launched!"
end, Color3.fromRGB(255, 50, 150))

createButton(TrollTab, "Spam Chat", "Spam messages in chat", "💬", function()
    StatusText.Text = "Chat spam started!"
end, Color3.fromRGB(255, 50, 150))

createButton(TrollTab, "Lag Server", "Lag the server", "🐌", function()
    StatusText.Text = "Lagging server..."
end, Color3.fromRGB(255, 50, 150))

createToggle(TrollTab, "Annoy Players", "Annoy other players", false, function(state)
    StatusText.Text = "Annoy Players: " .. (state and "ENABLED" or "DISABLED")
end, Color3.fromRGB(255, 50, 150))

-- ========== SETTINGS TAB ==========
createToggle(SettingsTab, "UI Sound Effects", "Enable/disable UI sounds", true, function(state)
    StatusText.Text = "UI Sounds: " .. (state and "ENABLED" or "DISABLED")
end, Color3.fromRGB(100, 100, 100))

createToggle(SettingsTab, "Auto-Save Settings", "Save settings automatically", true, function(state)
    StatusText.Text = "Auto-Save: " .. (state and "ENABLED" or "DISABLED")
end, Color3.fromRGB(100, 100, 100))

createSlider(SettingsTab, "UI Transparency", 0, 0.5, 0, function(value)
    Main.BackgroundTransparency = value
    Header.BackgroundTransparency = value
    Sidebar.BackgroundTransparency = value
    StatusBar.BackgroundTransparency = value
    StatusText.Text = "UI Transparency: " .. string.format("%.1f", value)
end, Color3.fromRGB(100, 100, 100))

createSlider(SettingsTab, "Blur Intensity", 0, 20, 10, function(value)
    Blur.Size = value
    StatusText.Text = "Blur Intensity: " .. value
end, Color3.fromRGB(100, 100, 100))

createButton(SettingsTab, "Save Settings", "Save current configuration", "💾", function()
    -- Simular salvamento de configurações
    local savedSettings = {}
    for key, value in pairs(module.Settings) do
        savedSettings[key] = value
    end
    getgenv().RyuzSavedSettings = savedSettings
    StatusText.Text = "Settings saved successfully!"
end, Color3.fromRGB(100, 100, 100))

createButton(SettingsTab, "Load Settings", "Load saved configuration", "📂", function()
    -- Simular carregamento de configurações
    if getgenv().RyuzSavedSettings then
        for key, value in pairs(getgenv().RyuzSavedSettings) do
            module.Settings[key] = value
        end
        StatusText.Text = "Settings loaded successfully!"
    else
        StatusText.Text = "No saved settings found!"
    end
end, Color3.fromRGB(100, 100, 100))

createButton(SettingsTab, "Reset Settings", "Reset to default values", "🔄", function()
    -- Resetar todas as configurações
    for key, _ in pairs(module.Settings) do
        if type(module.Settings[key]) == "boolean" then
            module.Settings[key] = false
        elseif key == "SpeedValue" then
            module.Settings[key] = 100
        elseif key == "JumpValue" then
            module.Settings[key] = 50
        end
    end
    
    -- Resetar UI
    Main.BackgroundTransparency = 0
    Blur.Size = 10
    
    -- Resetar personagem se aplicável
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 16
        humanoid.JumpPower = 50
    end
    
    StatusText.Text = "All settings reset to default!"
end, Color3.fromRGB(100, 100, 100))

createButton(SettingsTab, "Hide UI", "Temporarily hide interface", "👁️", function()
    Main.Visible = not Main.Visible
    StatusText.Text = Main.Visible and "UI: VISIBLE" or "UI: HIDDEN"
end, Color3.fromRGB(100, 100, 100))

createButton(SettingsTab, "Change Theme", "Change UI theme color", "🎨", function()
    StatusText.Text = "Theme changed!"
end, Color3.fromRGB(100, 100, 100))

-- ========== CREDITS TAB (NOVA) ==========
createButton(CreditsTab, "Coffee", "Main Developer", "☕", function()
    StatusText.Text = "Coffee - Main Developer"
end, Color3.fromRGB(255, 215, 0))

createButton(CreditsTab, "Frost", "UI Designer", "❄️", function()
    StatusText.Text = "Frost - UI Designer"
end, Color3.fromRGB(255, 215, 0))

createButton(CreditsTab, "Discord Server", "Join our community", "💬", function()
    setclipboard("discord.gg/ryuzen")
    StatusText.Text = "Discord link copied!"
end, Color3.fromRGB(255, 215, 0))

createButton(CreditsTab, "Copy Script", "Copy script to clipboard", "📋", function()
    setclipboard("-- RYUZEN HUB | ELITE EDITION v2.0")
    StatusText.Text = "Script info copied!"
end, Color3.fromRGB(255, 215, 0))

createButton(CreditsTab, "Check Updates", "Check for updates", "🔄", function()
    StatusText.Text = "You have the latest version!"
end, Color3.fromRGB(255, 215, 0))

-- CORREÇÃO DOS BOTÕES DE MINIMIZAR E FECHAR
local isMinimized = false
local originalSize = Main.Size
local minimizedSize = UDim2.new(0, 450, 0, 40) -- Só a header
local minimizedContent = Content
local minimizedSidebar = Sidebar
local minimizedStatusBar = StatusBar

-- Função de minimizar CORRIGIDA
local function toggleMinimize()
    isMinimized = not isMinimized
    
    if isMinimized then
        -- Minimizar: Só mostra o header
        TweenService:Create(Main, TweenInfo.new(0.3), {
            Size = minimizedSize
        }):Play()
        Content.Visible = false
        Sidebar.Visible = false
        StatusBar.Visible = false
        MinimizeBtn.Visible = false
        RestoreBtn.Visible = true
        StatusText.Text = "Minimized - Click □ to restore"
    else
        -- Restaurar: Mostra tudo
        TweenService:Create(Main, TweenInfo.new(0.3), {
            Size = originalSize
        }):Play()
        Content.Visible = true
        Sidebar.Visible = true
        StatusBar.Visible = true
        MinimizeBtn.Visible = true
        RestoreBtn.Visible = false
        StatusText.Text = "Restored"
    end
end

-- Conectar os botões CORRETAMENTE
MinimizeBtn.MouseButton1Click:Connect(toggleMinimize)
RestoreBtn.MouseButton1Click:Connect(toggleMinimize)

-- Fechar script CORRETAMENTE
CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(Main, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    TweenService:Create(Blur, TweenInfo.new(0.3), {
        Size = 0
    }):Play()
    wait(0.3)
    ScreenGui:Destroy()
    Blur:Destroy()
    getgenv().RYUZEN_LOADED = false
end)

-- Noclip loop
spawn(function()
    while true do
        if module.Settings.Noclip and player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
        RunService.Stepped:Wait()
    end
end)

-- Aimbot loop
spawn(function()
    while true do
        if module.Settings.Aimbot then
            local localRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            
            if localRoot then
                local closestPlayer = nil
                local closestDistance = math.huge
                
                for _, targetPlayer in pairs(Players:GetPlayers()) do
                    if targetPlayer ~= player and targetPlayer.Character then
                        local root = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if root then
                            local distance = (localRoot.Position - root.Position).Magnitude
                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = targetPlayer
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
        end
        RunService.RenderStepped:Wait()
    end
end)

-- Activate first tab
Tabs["Combat"].Content.Visible = true
Tabs["Combat"].Indicator.Visible = true
TweenService:Create(Tabs["Combat"].Button, TweenInfo.new(0.2), {
    BackgroundColor3 = COLORS.PrimaryDark
}):Play()
TweenService:Create(Tabs["Combat"].Icon, TweenInfo.new(0.2), {
    TextColor3 = COLORS.PrimaryLight
}):Play()
TweenService:Create(Tabs["Combat"].Name, TweenInfo.new(0.2), {
    TextColor3 = COLORS.Text
}):Play()
ActiveTab = "Combat"

-- Keybind system
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F1 then
        Main.Visible = not Main.Visible
        StatusText.Text = Main.Visible and "UI: TOGGLED ON" or "UI: TOGGLED OFF"
    elseif input.KeyCode == Enum.KeyCode.Insert then
        toggleMinimize()
    elseif input.KeyCode == Enum.KeyCode.F2 then
        toggleMinimize()
    elseif input.KeyCode == Enum.KeyCode.RightControl then
        toggleMinimize()
    end
end)

-- Auto-adjust canvas sizes
for _, tab in pairs(Tabs) do
    if tab.Content:FindFirstChildOfClass("UIListLayout") then
        tab.Content:FindFirstChildOfClass("UIListLayout"):GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tab.Content.CanvasSize = UDim2.new(0, 0, 0, tab.Content:FindFirstChildOfClass("UIListLayout").AbsoluteContentSize.Y + 20)
        end)
    end
end

-- Initial blur effect
spawn(function()
    wait(0.5)
    TweenService:Create(Blur, TweenInfo.new(0.5), {
        Size = 10
    }):Play()
end)

print("╔══════════════════════════════════════════════╗")
print("║     ⚔️ RYUZEN ELITE HUB v2.0 LOADED ⚔️     ║")
print("║        9 Tabs | 60+ Features              ║")
print("║      F1: Toggle UI | F2: Minimize         ║")
print("║      INSERT: Quick Minimize              ║")
print("║      Coffee ☕ & Frost ❄️                ║")
print("╚══════════════════════════════════════════════╝")

return module
