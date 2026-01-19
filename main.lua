-- ⚔️ RYUZEN HUB | MINIMAL EDITION
-- By Coffee & Frost

if getgenv().RYUZEN_LOADED then return end
getgenv().RYUZEN_LOADED = true

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Colors
local COLORS = {
    Background = Color3.fromRGB(10, 10, 15),
    Surface = Color3.fromRGB(20, 20, 30),
    SurfaceLight = Color3.fromRGB(30, 30, 45),
    Primary = Color3.fromRGB(200, 20, 30),
    Text = Color3.fromRGB(240, 240, 245),
    TextSecondary = Color3.fromRGB(160, 160, 170),
    Danger = Color3.fromRGB(255, 50, 80),
    Success = Color3.fromRGB(0, 200, 100)
}

-- Main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RyuzMinimal"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Container (MENOR)
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 400, 0, 350)
Main.Position = UDim2.new(0.5, -200, 0.5, -175)
Main.BackgroundColor3 = COLORS.Surface
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Active = true
Main.Draggable = true
Main.ZIndex = 10
Main.Parent = ScreenGui

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = COLORS.SurfaceLight
Header.BorderSizePixel = 0
Header.ZIndex = 11
Header.Parent = Main

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.6, 0, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "⚔️ RYUZEN HUB"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextColor3 = COLORS.Text
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 12
Title.Parent = Header

-- Window Controls
local Controls = Instance.new("Frame")
Controls.Size = UDim2.new(0.3, 0, 1, 0)
Controls.Position = UDim2.new(0.7, 0, 0, 0)
Controls.BackgroundTransparency = 1
Controls.ZIndex = 12
Controls.Parent = Header

-- Minimize Button
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(0, 5, 0.5, -15)
MinimizeBtn.Text = "-"
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 18
MinimizeBtn.TextColor3 = COLORS.TextSecondary
MinimizeBtn.BackgroundColor3 = COLORS.SurfaceLight
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.AutoButtonColor = false
MinimizeBtn.ZIndex = 13
MinimizeBtn.Parent = Controls

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.Text = "×"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.TextColor3 = COLORS.Text
CloseBtn.BackgroundColor3 = COLORS.SurfaceLight
CloseBtn.BorderSizePixel = 0
CloseBtn.AutoButtonColor = false
CloseBtn.ZIndex = 13
CloseBtn.Parent = Controls

-- Tabs Container
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, 0, 0, 40)
TabContainer.Position = UDim2.new(0, 0, 0, 35)
TabContainer.BackgroundColor3 = COLORS.Background
TabContainer.BorderSizePixel = 0
TabContainer.ZIndex = 10
TabContainer.Parent = Main

-- Content Area
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -75)
Content.Position = UDim2.new(0, 0, 0, 75)
Content.BackgroundColor3 = COLORS.Background
Content.BorderSizePixel = 0
Content.ZIndex = 9
Content.Parent = Main

-- Status Bar
local StatusBar = Instance.new("Frame")
StatusBar.Size = UDim2.new(1, 0, 0, 25)
StatusBar.Position = UDim2.new(0, 0, 1, -25)
StatusBar.BackgroundColor3 = COLORS.SurfaceLight
StatusBar.BorderSizePixel = 0
StatusBar.ZIndex = 11
StatusBar.Parent = Main

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, -10, 1, 0)
StatusText.Position = UDim2.new(0, 10, 0, 0)
StatusText.Text = "Ready | Ryuzen Hub Loaded"
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 12
StatusText.TextColor3 = COLORS.TextSecondary
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.BackgroundTransparency = 1
StatusText.ZIndex = 12
StatusText.Parent = StatusBar

-- Hover Effects
local function setupButtonHover(button, hoverColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {
            BackgroundColor3 = hoverColor
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.SurfaceLight
        }):Play()
    end)
end

setupButtonHover(MinimizeBtn, COLORS.Surface)
setupButtonHover(CloseBtn, COLORS.Danger)

-- Tab System
local Tabs = {}
local ActiveTab = nil

local function createTab(name, color)
    local TabButton = Instance.new("TextButton")
    TabButton.Name = name .. "Tab"
    TabButton.Size = UDim2.new(0, 80, 1, 0)
    TabButton.Position = UDim2.new(0, (#Tabs * 85), 0, 0)
    TabButton.Text = name
    TabButton.Font = Enum.Font.Gotham
    TabButton.TextSize = 12
    TabButton.TextColor3 = COLORS.TextSecondary
    TabButton.BackgroundColor3 = COLORS.SurfaceLight
    TabButton.BorderSizePixel = 0
    TabButton.AutoButtonColor = false
    TabButton.ZIndex = 11
    TabButton.Parent = TabContainer
    
    local TabContent = Instance.new("ScrollingFrame")
    TabContent.Name = name .. "Content"
    TabContent.Size = UDim2.new(1, 0, 1, 0)
    TabContent.BackgroundTransparency = 1
    TabContent.ScrollBarThickness = 3
    TabContent.ScrollBarImageColor3 = color
    TabContent.BorderSizePixel = 0
    TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContent.Visible = false
    TabContent.ZIndex = 9
    TabContent.Parent = Content
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Padding = UDim.new(0, 8)
    ContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Parent = TabContent
    
    local tabData = {
        Button = TabButton,
        Content = TabContent,
        Color = color
    }
    
    Tabs[name] = tabData
    
    TabButton.MouseButton1Click:Connect(function()
        if ActiveTab == name then return end
        
        if ActiveTab then
            local currentTab = Tabs[ActiveTab]
            currentTab.Content.Visible = false
            TweenService:Create(currentTab.Button, TweenInfo.new(0.2), {
                BackgroundColor3 = COLORS.SurfaceLight,
                TextColor3 = COLORS.TextSecondary
            }):Play()
        end
        
        ActiveTab = name
        TabContent.Visible = true
        
        TweenService:Create(TabButton, TweenInfo.new(0.2), {
            BackgroundColor3 = color,
            TextColor3 = COLORS.Text
        }):Play()
        
        StatusText.Text = "Tab: " .. name
    end)
    
    return TabContent
end

-- Create Tabs
local CombatTab = createTab("Combat", COLORS.Primary)
local MovementTab = createTab("Movement", Color3.fromRGB(0, 150, 255))
local VisualTab = createTab("Visual", Color3.fromRGB(0, 200, 100))
local UtilityTab = createTab("Utility", Color3.fromRGB(255, 150, 0))
local SettingsTab = createTab("Settings", Color3.fromRGB(100, 100, 100))

-- Toggle Function
local function createToggle(parent, name, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(0.9, 0, 0, 40)
    ToggleFrame.BackgroundColor3 = COLORS.SurfaceLight
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.LayoutOrder = #parent:GetChildren()
    ToggleFrame.Parent = parent
    
    local ToggleText = Instance.new("TextLabel")
    ToggleText.Size = UDim2.new(0.7, 0, 1, 0)
    ToggleText.Position = UDim2.new(0, 10, 0, 0)
    ToggleText.Text = name
    ToggleText.Font = Enum.Font.Gotham
    ToggleText.TextSize = 12
    ToggleText.TextColor3 = COLORS.Text
    ToggleText.TextXAlignment = Enum.TextXAlignment.Left
    ToggleText.BackgroundTransparency = 1
    ToggleText.Parent = ToggleFrame
    
    local ToggleSwitch = Instance.new("Frame")
    ToggleSwitch.Size = UDim2.new(0, 40, 0, 20)
    ToggleSwitch.Position = UDim2.new(1, -50, 0.5, -10)
    ToggleSwitch.BackgroundColor3 = COLORS.Background
    ToggleSwitch.BorderSizePixel = 0
    ToggleSwitch.Parent = ToggleFrame
    
    local ToggleKnob = Instance.new("Frame")
    ToggleKnob.Size = UDim2.new(0, 16, 0, 16)
    ToggleKnob.Position = UDim2.new(0, 2, 0.5, -8)
    ToggleKnob.BackgroundColor3 = COLORS.TextSecondary
    ToggleKnob.BorderSizePixel = 0
    ToggleKnob.Parent = ToggleSwitch
    
    local state = false
    
    local function updateToggle()
        if state then
            TweenService:Create(ToggleKnob, TweenInfo.new(0.2), {
                Position = UDim2.new(1, -18, 0.5, -8),
                BackgroundColor3 = COLORS.Success
            }):Play()
        else
            TweenService:Create(ToggleKnob, TweenInfo.new(0.2), {
                Position = UDim2.new(0, 2, 0.5, -8),
                BackgroundColor3 = COLORS.TextSecondary
            }):Play()
        end
    end
    
    ToggleFrame.MouseButton1Click:Connect(function()
        state = not state
        updateToggle()
        if callback then
            pcall(callback, state)
        end
    end)
    
    ToggleFrame.MouseEnter:Connect(function()
        TweenService:Create(ToggleFrame, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.Surface
        }):Play()
    end)
    
    ToggleFrame.MouseLeave:Connect(function()
        TweenService:Create(ToggleFrame, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.SurfaceLight
        }):Play()
    end)
    
    return {GetState = function() return state end, SetState = function(s) state = s; updateToggle() end}
end

-- Button Function
local function createButton(parent, name, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.9, 0, 0, 35)
    Button.Text = name
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 12
    Button.TextColor3 = COLORS.Text
    Button.BackgroundColor3 = COLORS.SurfaceLight
    Button.BorderSizePixel = 0
    Button.AutoButtonColor = false
    Button.LayoutOrder = #parent:GetChildren()
    Button.Parent = parent
    
    Button.MouseButton1Click:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.1), {
            BackgroundColor3 = COLORS.Primary
        }):Play()
        task.wait(0.1)
        TweenService:Create(Button, TweenInfo.new(0.1), {
            BackgroundColor3 = COLORS.SurfaceLight
        }):Play()
        
        if callback then
            pcall(callback)
        end
    end)
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.Surface
        }):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.SurfaceLight
        }):Play()
    end)
    
    return Button
end

-- Slider Function
local function createSlider(parent, name, min, max, default, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(0.9, 0, 0, 50)
    SliderFrame.BackgroundColor3 = COLORS.SurfaceLight
    SliderFrame.BorderSizePixel = 0
    SliderFrame.LayoutOrder = #parent:GetChildren()
    SliderFrame.Parent = parent
    
    local SliderText = Instance.new("TextLabel")
    SliderText.Size = UDim2.new(1, -10, 0, 20)
    SliderText.Position = UDim2.new(0, 10, 0, 5)
    SliderText.Text = name
    SliderText.Font = Enum.Font.Gotham
    SliderText.TextSize = 12
    SliderText.TextColor3 = COLORS.Text
    SliderText.TextXAlignment = Enum.TextXAlignment.Left
    SliderText.BackgroundTransparency = 1
    SliderText.Parent = SliderFrame
    
    local SliderValue = Instance.new("TextLabel")
    SliderValue.Size = UDim2.new(0, 40, 0, 20)
    SliderValue.Position = UDim2.new(1, -50, 0, 5)
    SliderValue.Text = tostring(default)
    SliderValue.Font = Enum.Font.Gotham
    SliderValue.TextSize = 12
    SliderValue.TextColor3 = COLORS.TextSecondary
    SliderValue.TextXAlignment = Enum.TextXAlignment.Right
    SliderValue.BackgroundTransparency = 1
    SliderValue.Parent = SliderFrame
    
    local SliderTrack = Instance.new("Frame")
    SliderTrack.Size = UDim2.new(1, -20, 0, 4)
    SliderTrack.Position = UDim2.new(0, 10, 1, -15)
    SliderTrack.BackgroundColor3 = COLORS.Background
    SliderTrack.BorderSizePixel = 0
    SliderTrack.Parent = SliderFrame
    
    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.BackgroundColor3 = COLORS.Primary
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = SliderTrack
    
    local SliderKnob = Instance.new("Frame")
    SliderKnob.Size = UDim2.new(0, 12, 0, 12)
    SliderKnob.Position = UDim2.new((default - min) / (max - min), -6, 0.5, -6)
    SliderKnob.BackgroundColor3 = COLORS.Primary
    SliderKnob.BorderSizePixel = 0
    SliderKnob.Parent = SliderTrack
    
    local value = default
    local dragging = false
    
    local function updateSlider(newValue)
        value = math.clamp(newValue, min, max)
        local ratio = (value - min) / (max - min)
        
        SliderFill.Size = UDim2.new(ratio, 0, 1, 0)
        SliderKnob.Position = UDim2.new(ratio, -6, 0.5, -6)
        SliderValue.Text = string.format("%.0f", value)
        
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
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = player:GetMouse()
            local relativeX = (mousePos.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X
            local newValue = min + (relativeX * (max - min))
            updateSlider(newValue)
        end
    end)
    
    SliderFrame.MouseEnter:Connect(function()
        TweenService:Create(SliderFrame, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.Surface
        }):Play()
    end)
    
    SliderFrame.MouseLeave:Connect(function()
        TweenService:Create(SliderFrame, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.SurfaceLight
        }):Play()
    end)
    
    return {GetValue = function() return value end, SetValue = updateSlider}
end

-- ========== COMBAT TAB ==========
createToggle(CombatTab, "Aimbot", function(state)
    StatusText.Text = "Aimbot: " .. (state and "ON" or "OFF")
end)

createToggle(CombatTab, "Silent Aim", function(state)
    StatusText.Text = "Silent Aim: " .. (state and "ON" or "OFF")
end)

createToggle(CombatTab, "No Recoil", function(state)
    StatusText.Text = "No Recoil: " .. (state and "ON" or "OFF")
end)

createSlider(CombatTab, "FOV", 70, 120, 90, function(value)
    workspace.CurrentCamera.FieldOfView = value
    StatusText.Text = "FOV: " .. value
end)

-- ========== MOVEMENT TAB ==========
createToggle(MovementTab, "Fly", function(state)
    StatusText.Text = "Fly: " .. (state and "ON" or "OFF")
end)

createToggle(MovementTab, "Noclip", function(state)
    StatusText.Text = "Noclip: " .. (state and "ON" or "OFF")
end)

createToggle(MovementTab, "Inf Jump", function(state)
    StatusText.Text = "Inf Jump: " .. (state and "ON" or "OFF")
end)

createSlider(MovementTab, "Speed", 16, 200, 50, function(value)
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = value
    end
    StatusText.Text = "Speed: " .. value
end)

createSlider(MovementTab, "Jump Power", 50, 300, 50, function(value)
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = value
    end
    StatusText.Text = "Jump Power: " .. value
end)

-- ========== VISUAL TAB ==========
createToggle(VisualTab, "ESP", function(state)
    StatusText.Text = "ESP: " .. (state and "ON" or "OFF")
end)

createToggle(VisualTab, "Chams", function(state)
    StatusText.Text = "Chams: " .. (state and "ON" or "OFF")
end)

createToggle(VisualTab, "Tracers", function(state)
    StatusText.Text = "Tracers: " .. (state and "ON" or "OFF")
end)

createButton(VisualTab, "Fullbright", function()
    local Lighting = game:GetService("Lighting")
    Lighting.Brightness = 2
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    StatusText.Text = "Fullbright: ON"
end)

-- ========== UTILITY TAB ==========
createToggle(UtilityTab, "Anti-AFK", function(state)
    StatusText.Text = "Anti-AFK: " .. (state and "ON" or "OFF")
end)

createToggle(UtilityTab, "Click TP", function(state)
    StatusText.Text = "Click TP: " .. (state and "ON" or "OFF")
end)

createButton(UtilityTab, "God Mode", function()
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        StatusText.Text = "God Mode: ON"
    end
end)

createButton(UtilityTab, "Invisible", function()
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
        StatusText.Text = "Invisible: ON"
    end
end)

createButton(UtilityTab, "Reset Character", function()
    if player.Character then
        player.Character:BreakJoints()
        StatusText.Text = "Character Reset"
    end
end)

-- ========== SETTINGS TAB ==========
createButton(SettingsTab, "Save Settings", function()
    StatusText.Text = "Settings Saved"
end)

createButton(SettingsTab, "Load Settings", function()
    StatusText.Text = "Settings Loaded"
end)

createButton(SettingsTab, "Reset All", function()
    StatusText.Text = "All Settings Reset"
end)

createToggle(SettingsTab, "Auto Save", function(state)
    StatusText.Text = "Auto Save: " .. (state and "ON" or "OFF")
end)

-- ========== FUNCTIONALITY ==========
-- Noclip
spawn(function()
    while true do
        if not player.Character then wait(0.1) continue end
        
        for _, toggle in pairs(getgenv().RyuzToggles or {}) do
            if toggle.GetState and toggle.GetState() and toggle.Name == "Noclip" then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
        RunService.Stepped:Wait()
    end
end)

-- Fly
local flyToggles = {}
createToggle(MovementTab, "Fly", function(state)
    if state then
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
            bodyVelocity.Parent = root
            
            spawn(function()
                while flyToggles["Fly"] and flyToggles["Fly"].GetState() do
                    local cam = workspace.CurrentCamera.CFrame
                    local move = Vector3.new()
                    
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        move = move + cam.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        move = move - cam.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        move = move - cam.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        move = move + cam.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        move = move + Vector3.new(0, 1, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                        move = move + Vector3.new(0, -1, 0)
                    end
                    
                    bodyVelocity.Velocity = move.Unit * 100
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

-- Click TP
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        for _, toggle in pairs(getgenv().RyuzToggles or {}) do
            if toggle.GetState and toggle.GetState() and toggle.Name == "Click TP" then
                local mouse = player:GetMouse()
                local root = player.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 5, 0))
                end
            end
        end
    end
end)

-- ========== WINDOW CONTROLS ==========
local isMinimized = false
local originalSize = Main.Size
local minimizedSize = UDim2.new(0, 400, 0, 35)

-- Minimize Function
MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    
    if isMinimized then
        TweenService:Create(Main, TweenInfo.new(0.3), {
            Size = minimizedSize
        }):Play()
        MinimizeBtn.Text = "+"
        StatusText.Text = "Minimized - Click + to restore"
    else
        TweenService:Create(Main, TweenInfo.new(0.3), {
            Size = originalSize
        }):Play()
        MinimizeBtn.Text = "-"
        StatusText.Text = "Restored"
    end
end)

-- Close Function
CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(Main, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    wait(0.3)
    ScreenGui:Destroy()
    getgenv().RYUZEN_LOADED = false
end)

-- ========== INITIALIZE ==========
-- Auto-adjust content size
for _, tab in pairs(Tabs) do
    tab.Content:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
        tab.Content.CanvasSize = UDim2.new(0, 0, 0, tab.Content.UIListLayout.AbsoluteContentSize.Y + 10)
    end)
end

-- Activate first tab
Tabs["Combat"].Button:Activate()

-- Keybinds
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F1 then
        Main.Visible = not Main.Visible
        StatusText.Text = Main.Visible and "UI: SHOWN" or "UI: HIDDEN"
    elseif input.KeyCode == Enum.KeyCode.Insert then
        isMinimized = not isMinimized
        if isMinimized then
            Main.Size = minimizedSize
            MinimizeBtn.Text = "+"
        else
            Main.Size = originalSize
            MinimizeBtn.Text = "-"
        end
    end
end)

print("╔══════════════════════════════════════╗")
print("║     RYUZEN HUB LOADED SUCCESSFULLY   ║")
print("║        F1: Toggle UI                 ║")
print("║        INSERT: Minimize              ║")
print("║        Coffee ☕ & Frost ❄️         ║")
print("╚══════════════════════════════════════╝")

return {
    Version = "2.0",
    Author = "Coffee & Frost",
    Tabs = Tabs
}
