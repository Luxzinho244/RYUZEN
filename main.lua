-- ⚔️ RYUZEN HUB | ELITE EDITION
-- Professional UI | Dark Red Theme
-- By Coffee & Frost

if getgenv().RYUZEN_LOADED then return end
getgenv().RYUZEN_LOADED = true

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
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
    Danger = Color3.fromRGB(255, 50, 80)
}

-- Fonts
local FONTS = {
    Title = Enum.Font.GothamBlack,
    Header = Enum.Font.GothamBold,
    Body = Enum.Font.GothamMedium,
    Monospace = Enum.Font.Code
}

-- Main GUI
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

-- Main Container
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 650, 0, 420)
Main.Position = UDim2.new(0.5, -325, 0.5, -210)
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

-- Inner Glow Effect
local InnerGlow = Instance.new("Frame")
InnerGlow.Name = "InnerGlow"
InnerGlow.Size = UDim2.new(1, 0, 1, 0)
InnerGlow.BackgroundTransparency = 1
InnerGlow.Parent = Main

local GlowStroke = Instance.new("UIStroke")
GlowStroke.Color = COLORS.PrimaryLight
GlowStroke.Thickness = 2
GlowStroke.Transparency = 0.7
GlowStroke.Parent = InnerGlow

-- Header
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 48)
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

-- Title with Icon
local TitleContainer = Instance.new("Frame")
TitleContainer.Size = UDim2.new(0.6, 0, 1, 0)
TitleContainer.Position = UDim2.new(0, 20, 0, 0)
TitleContainer.BackgroundTransparency = 1
TitleContainer.ZIndex = 13
TitleContainer.Parent = Header

local TitleIcon = Instance.new("TextLabel")
TitleIcon.Size = UDim2.new(0, 32, 0, 32)
TitleIcon.Position = UDim2.new(0, 0, 0.5, -16)
TitleIcon.Text = "⚔️"
TitleIcon.Font = FONTS.Title
TitleIcon.TextSize = 24
TitleIcon.TextColor3 = COLORS.PrimaryLight
TitleIcon.BackgroundTransparency = 1
TitleIcon.ZIndex = 14
TitleIcon.Parent = TitleContainer

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 40, 0, 0)
Title.Text = "RYUZEN | ELITE HUB"
Title.Font = FONTS.Title
Title.TextSize = 18
Title.TextColor3 = COLORS.Text
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.TextTransparency = 0
Title.ZIndex = 14
Title.Parent = TitleContainer

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -40, 0, 14)
Subtitle.Position = UDim2.new(0, 40, 1, -18)
Subtitle.Text = "v5.0 | Professional Edition"
Subtitle.Font = FONTS.Body
Subtitle.TextSize = 11
Subtitle.TextColor3 = COLORS.TextSecondary
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.BackgroundTransparency = 1
Subtitle.ZIndex = 14
Subtitle.Parent = TitleContainer

-- Control Buttons
local Controls = Instance.new("Frame")
Controls.Size = UDim2.new(0.3, 0, 1, 0)
Controls.Position = UDim2.new(0.7, 0, 0, 0)
Controls.BackgroundTransparency = 1
Controls.ZIndex = 13
Controls.Parent = Header

-- Minimize Button
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 32, 0, 32)
MinimizeBtn.Position = UDim2.new(0, 10, 0.5, -16)
MinimizeBtn.Text = "_"
MinimizeBtn.Font = FONTS.Header
MinimizeBtn.TextSize = 18
MinimizeBtn.TextColor3 = COLORS.TextSecondary
MinimizeBtn.BackgroundColor3 = COLORS.SurfaceLight
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.AutoButtonColor = false
MinimizeBtn.ZIndex = 14
MinimizeBtn.Parent = Controls

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -42, 0.5, -16)
CloseBtn.Text = "×"
CloseBtn.Font = FONTS.Header
CloseBtn.TextSize = 22
CloseBtn.TextColor3 = COLORS.Text
CloseBtn.BackgroundColor3 = COLORS.SurfaceLight
CloseBtn.BorderSizePixel = 0
CloseBtn.AutoButtonColor = false
CloseBtn.ZIndex = 14
CloseBtn.Parent = Controls

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
setupControlButton(CloseBtn, COLORS.Danger, Color3.fromRGB(200, 40, 60))

-- Navigation Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 180, 1, -48)
Sidebar.Position = UDim2.new(0, 0, 0, 48)
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

-- Content Area
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -180, 1, -48)
Content.Position = UDim2.new(0, 180, 0, 48)
Content.BackgroundColor3 = COLORS.Background
Content.BorderSizePixel = 0
Content.ZIndex = 10
Content.Parent = Main

-- Tab System
local Tabs = {}
local ActiveTab = nil

-- Function to create professional tab
local function createTab(name, icon, description)
    local TabButton = Instance.new("TextButton")
    TabButton.Name = name .. "Tab"
    TabButton.Size = UDim2.new(1, -20, 0, 48)
    TabButton.Position = UDim2.new(0, 10, 0, (#Tabs * 52) + 10)
    TabButton.Text = ""
    TabButton.BackgroundColor3 = COLORS.SurfaceLight
    TabButton.BorderSizePixel = 0
    TabButton.AutoButtonColor = false
    TabButton.ZIndex = 12
    TabButton.Parent = Sidebar
    
    -- Tab Icon
    local TabIcon = Instance.new("TextLabel")
    TabIcon.Size = UDim2.new(0, 24, 0, 24)
    TabIcon.Position = UDim2.new(0, 16, 0.5, -12)
    TabIcon.Text = icon
    TabIcon.Font = FONTS.Body
    TabIcon.TextSize = 16
    TabIcon.TextColor3 = COLORS.TextSecondary
    TabIcon.BackgroundTransparency = 1
    TabIcon.ZIndex = 13
    TabIcon.Parent = TabButton
    
    -- Tab Name
    local TabName = Instance.new("TextLabel")
    TabName.Size = UDim2.new(1, -50, 0, 20)
    TabName.Position = UDim2.new(0, 48, 0.5, -10)
    TabName.Text = name:upper()
    TabName.Font = FONTS.Header
    TabName.TextSize = 12
    TabName.TextColor3 = COLORS.TextSecondary
    TabName.TextXAlignment = Enum.TextXAlignment.Left
    TabName.BackgroundTransparency = 1
    TabName.ZIndex = 13
    TabName.Parent = TabButton
    
    -- Tab Description
    local TabDesc = Instance.new("TextLabel")
    TabDesc.Size = UDim2.new(1, -50, 0, 14)
    TabDesc.Position = UDim2.new(0, 48, 0.5, 4)
    TabDesc.Text = description
    TabDesc.Font = FONTS.Body
    TabDesc.TextSize = 10
    TabDesc.TextColor3 = COLORS.TextDisabled
    TabDesc.TextXAlignment = Enum.TextXAlignment.Left
    TabDesc.BackgroundTransparency = 1
    TabDesc.ZIndex = 13
    TabDesc.Parent = TabButton
    
    -- Active Indicator
    local ActiveIndicator = Instance.new("Frame")
    ActiveIndicator.Size = UDim2.new(0, 3, 0.6, 0)
    ActiveIndicator.Position = UDim2.new(0, 0, 0.2, 0)
    ActiveIndicator.BackgroundColor3 = COLORS.Primary
    ActiveIndicator.BorderSizePixel = 0
    ActiveIndicator.Visible = false
    ActiveIndicator.ZIndex = 13
    ActiveIndicator.Parent = TabButton
    
    -- Hover Effect
    local HoverOverlay = Instance.new("Frame")
    HoverOverlay.Size = UDim2.new(1, 0, 1, 0)
    HoverOverlay.BackgroundColor3 = COLORS.Primary
    HoverOverlay.BackgroundTransparency = 0.9
    HoverOverlay.BorderSizePixel = 0
    HoverOverlay.Visible = false
    HoverOverlay.ZIndex = 11
    HoverOverlay.Parent = TabButton
    
    -- Content Frame
    local TabContent = Instance.new("ScrollingFrame")
    TabContent.Name = name .. "Content"
    TabContent.Size = UDim2.new(1, 0, 1, 0)
    TabContent.BackgroundTransparency = 1
    TabContent.ScrollBarThickness = 4
    TabContent.ScrollBarImageColor3 = COLORS.Primary
    TabContent.BorderSizePixel = 0
    TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContent.Visible = false
    TabContent.ZIndex = 10
    TabContent.Parent = Content
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Padding = UDim.new(0, 12)
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
        Desc = TabDesc
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
            BackgroundColor3 = COLORS.Surface
        }):Play()
        TweenService:Create(TabIcon, TweenInfo.new(0.2), {
            TextColor3 = COLORS.PrimaryLight
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

-- Create Tabs with professional descriptions
local CombatTab = createTab("Combat", "⚔️", "Aimbot & ESP")
local MovementTab = createTab("Movement", "🏃", "Speed & Fly")
local VisualTab = createTab("Visual", "👁️", "ESP & Chams")
local UtilityTab = createTab("Utility", "🛠️", "Tools & Info")
local SettingsTab = createTab("Settings", "⚙️", "Configuration")

-- Function to create professional toggle button
local function createToggle(parent, name, description, defaultState, callback)
    local ToggleContainer = Instance.new("Frame")
    ToggleContainer.Size = UDim2.new(0.92, 0, 0, 60)
    ToggleContainer.BackgroundColor3 = COLORS.SurfaceLight
    ToggleContainer.BorderSizePixel = 0
    ToggleContainer.LayoutOrder = #parent:GetChildren()
    ToggleContainer.Parent = parent
    
    -- Toggle Info
    local ToggleInfo = Instance.new("Frame")
    ToggleInfo.Size = UDim2.new(0.7, 0, 1, 0)
    ToggleInfo.BackgroundTransparency = 1
    ToggleInfo.Parent = ToggleContainer
    
    local ToggleName = Instance.new("TextLabel")
    ToggleName.Size = UDim2.new(1, -20, 0, 24)
    ToggleName.Position = UDim2.new(0, 20, 0, 12)
    ToggleName.Text = name
    ToggleName.Font = FONTS.Header
    ToggleName.TextSize = 14
    ToggleName.TextColor3 = COLORS.Text
    ToggleName.TextXAlignment = Enum.TextXAlignment.Left
    ToggleName.BackgroundTransparency = 1
    ToggleName.Parent = ToggleInfo
    
    local ToggleDesc = Instance.new("TextLabel")
    ToggleDesc.Size = UDim2.new(1, -20, 0, 18)
    ToggleDesc.Position = UDim2.new(0, 20, 1, -24)
    ToggleDesc.Text = description
    ToggleDesc.Font = FONTS.Body
    ToggleDesc.TextSize = 11
    ToggleDesc.TextColor3 = COLORS.TextSecondary
    ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
    ToggleDesc.BackgroundTransparency = 1
    ToggleDesc.Parent = ToggleInfo
    
    -- Toggle Switch
    local ToggleSwitch = Instance.new("Frame")
    ToggleSwitch.Size = UDim2.new(0, 50, 0, 26)
    ToggleSwitch.Position = UDim2.new(1, -70, 0.5, -13)
    ToggleSwitch.BackgroundColor3 = COLORS.Surface
    ToggleSwitch.BorderSizePixel = 0
    ToggleSwitch.Parent = ToggleContainer
    
    local ToggleKnob = Instance.new("Frame")
    ToggleKnob.Size = UDim2.new(0, 20, 0, 20)
    ToggleKnob.Position = UDim2.new(0, 3, 0.5, -10)
    ToggleKnob.BackgroundColor3 = defaultState and COLORS.Success or COLORS.TextDisabled
    ToggleKnob.BorderSizePixel = 0
    ToggleKnob.Parent = ToggleSwitch
    
    local state = defaultState
    
    local function updateToggle()
        if state then
            TweenService:Create(ToggleKnob, TweenInfo.new(0.2), {
                Position = UDim2.new(1, -23, 0.5, -10),
                BackgroundColor3 = COLORS.Success
            }):Play()
            TweenService:Create(ToggleSwitch, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(0, 100, 50)
            }):Play()
        else
            TweenService:Create(ToggleKnob, TweenInfo.new(0.2), {
                Position = UDim2.new(0, 3, 0.5, -10),
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

-- Function to create professional slider
local function createSlider(parent, name, min, max, default, callback)
    local SliderContainer = Instance.new("Frame")
    SliderContainer.Size = UDim2.new(0.92, 0, 0, 80)
    SliderContainer.BackgroundColor3 = COLORS.SurfaceLight
    SliderContainer.BorderSizePixel = 0
    SliderContainer.LayoutOrder = #parent:GetChildren()
    SliderContainer.Parent = parent
    
    local SliderName = Instance.new("TextLabel")
    SliderName.Size = UDim2.new(1, -40, 0, 24)
    SliderName.Position = UDim2.new(0, 20, 0, 12)
    SliderName.Text = name
    SliderName.Font = FONTS.Header
    SliderName.TextSize = 14
    SliderName.TextColor3 = COLORS.Text
    SliderName.TextXAlignment = Enum.TextXAlignment.Left
    SliderName.BackgroundTransparency = 1
    SliderName.Parent = SliderContainer
    
    local SliderValue = Instance.new("TextLabel")
    SliderValue.Size = UDim2.new(0, 60, 0, 24)
    SliderValue.Position = UDim2.new(1, -80, 0, 12)
    SliderValue.Text = tostring(default)
    SliderValue.Font = FONTS.Monospace
    SliderValue.TextSize = 14
    SliderValue.TextColor3 = COLORS.PrimaryLight
    SliderValue.TextXAlignment = Enum.TextXAlignment.Right
    SliderValue.BackgroundTransparency = 1
    SliderValue.Parent = SliderContainer
    
    local SliderTrack = Instance.new("Frame")
    SliderTrack.Size = UDim2.new(1, -40, 0, 4)
    SliderTrack.Position = UDim2.new(0, 20, 1, -28)
    SliderTrack.BackgroundColor3 = COLORS.Surface
    SliderTrack.BorderSizePixel = 0
    SliderTrack.Parent = SliderContainer
    
    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.BackgroundColor3 = COLORS.Primary
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = SliderTrack
    
    local SliderKnob = Instance.new("Frame")
    SliderKnob.Size = UDim2.new(0, 16, 0, 16)
    SliderKnob.Position = UDim2.new((default - min) / (max - min), -8, 0.5, -8)
    SliderKnob.BackgroundColor3 = COLORS.PrimaryLight
    SliderKnob.BorderSizePixel = 0
    SliderKnob.Parent = SliderTrack
    
    local value = default
    local dragging = false
    
    local function updateSlider(newValue)
        value = math.clamp(newValue, min, max)
        local ratio = (value - min) / (max - min)
        
        SliderFill.Size = UDim2.new(ratio, 0, 1, 0)
        SliderKnob.Position = UDim2.new(ratio, -8, 0.5, -8)
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

-- ========== FUNCTIONALITY ==========

-- Combat Tab
local AimbotToggle = createToggle(CombatTab, "Aimbot", "Auto-aim at nearest player", false, function(state)
    module.Settings.Aimbot = state
    print("Aimbot:", state and "ENABLED" or "DISABLED")
end)

local ESPToggle = createToggle(CombatTab, "ESP", "See players through walls", false, function(state)
    module.Settings.ESP = state
    print("ESP:", state and "ENABLED" or "DISABLED")
    
    if state then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer and player.Character then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = Color3.fromRGB(255, 50, 50)
                highlight.OutlineColor = Color3.fromRGB(255, 100, 100)
                highlight.FillTransparency = 0.5
                highlight.Parent = player.Character
            end
        end
    else
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                for _, child in pairs(player.Character:GetChildren()) do
                    if child:IsA("Highlight") then
                        child:Destroy()
                    end
                end
            end
        end
    end
end)

-- Movement Tab
local FlyToggle = createToggle(MovementTab, "Flight Mode", "Toggle flying ability", false, function(state)
    module.Settings.Fly = state
    print("Flight Mode:", state and "ENABLED" or "DISABLED")
    
    if state then
        local root = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
            bodyVelocity.Parent = root
            
            spawn(function()
                while module.Settings.Fly do
                    local cam = workspace.CurrentCamera.CFrame
                    local moveDirection = Vector3.new(0, 0, 0)
                    
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        moveDirection = moveDirection + cam.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        moveDirection = moveDirection - cam.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        moveDirection = moveDirection - cam.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        moveDirection = moveDirection + cam.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        moveDirection = moveDirection + Vector3.new(0, 1, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                        moveDirection = moveDirection - Vector3.new(0, 1, 0)
                    end
                    
                    bodyVelocity.Velocity = moveDirection.Unit * 100
                    RunService.RenderStepped:Wait()
                end
            end)
        end
    else
        local root = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            for _, child in pairs(root:GetChildren()) do
                if child:IsA("BodyVelocity") then
                    child:Destroy()
                end
            end
        end
    end
end)

local SpeedSlider = createSlider(MovementTab, "Speed Multiplier", 16, 200, 100, function(value)
    module.Settings.SpeedValue = value
    local humanoid = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = value
    end
    print("Speed set to:", value)
end)

local NoclipToggle = createToggle(MovementTab, "Noclip", "Walk through objects", false, function(state)
    module.Settings.Noclip = state
    print("Noclip:", state and "ENABLED" or "DISABLED")
end)

-- Visual Tab
local FullbrightToggle = createToggle(VisualTab, "Fullbright", "Maximum brightness", false, function(state)
    if state then
        game.Lighting.Brightness = 2
        game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        game.Lighting.Brightness = 1
        game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    end
    print("Fullbright:", state and "ENABLED" or "DISABLED")
end)

-- Utility Tab
local AntiAFKToggle = createToggle(UtilityTab, "Anti-AFK", "Prevent getting kicked", false, function(state)
    module.Settings.AntiAFK = state
    print("Anti-AFK:", state and "ENABLED" or "DISABLED")
    
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
end)

local ClickTPToggle = createToggle(UtilityTab, "Click Teleport", "Teleport to clicked location", false, function(state)
    module.Settings.ClickTP = state
    print("Click Teleport:", state and "ENABLED" or "DISABLED")
    
    if state then
        local connection
        connection = UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local mouse = Players.LocalPlayer:GetMouse()
                local target = mouse.Hit.Position
                local root = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
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
end)

-- Noclip loop
spawn(function()
    while true do
        if module.Settings.Noclip and Players.LocalPlayer.Character then
            for _, part in pairs(Players.LocalPlayer.Character:GetDescendants()) do
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
            local localPlayer = Players.LocalPlayer
            local localRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if localRoot then
                local closestPlayer = nil
                local closestDistance = math.huge
                
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= localPlayer and player.Character then
                        local root = player.Character:FindFirstChild("HumanoidRootPart")
                        if root then
                            local distance = (localRoot.Position - root.Position).Magnitude
                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = player
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
    BackgroundColor3 = COLORS.Surface
}):Play()
TweenService:Create(Tabs["Combat"].Icon, TweenInfo.new(0.2), {
    TextColor3 = COLORS.PrimaryLight
}):Play()
TweenService:Create(Tabs["Combat"].Name, TweenInfo.new(0.2), {
    TextColor3 = COLORS.Text
}):Play()
ActiveTab = "Combat"

-- Open/Close functionality
local isMinimized = false

MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        TweenService:Create(Main, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 650, 0, 48)
        }):Play()
        MinimizeBtn.Text = "□"
    else
        TweenService:Create(Main, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 650, 0, 420)
        }):Play()
        MinimizeBtn.Text = "_"
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    Blur:Destroy()
    getgenv().RYUZEN_LOADED = false
end)

-- Keybind system
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F1 then
        if isMinimized then
            isMinimized = false
            TweenService:Create(Main, TweenInfo.new(0.3), {
                Size = UDim2.new(0, 650, 0, 420)
            }):Play()
            MinimizeBtn.Text = "_"
        else
            Main.Visible = not Main.Visible
        end
    elseif input.KeyCode == Enum.KeyCode.Insert then
        Main.Visible = not Main.Visible
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
print("║     ⚔️ RYUZEN ELITE HUB v5.0 LOADED ⚔️     ║")
print("║      Professional Interface Enabled         ║")
print("║      Press F1 to toggle visibility         ║")
print("║      Press INSERT for quick toggle         ║")
print("╚══════════════════════════════════════════════╝")

return module 
