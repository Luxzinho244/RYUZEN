-- ⛩️ RYUZEN HUB | MOBILE + PC
-- by Ryuzen

-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "RyuzenHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN FRAME
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,450,0,280)
frame.Position = UDim2.new(0.5,-225,0.5,-140)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0,14)

-- TOP BAR
local topBar = Instance.new("Frame")
topBar.Parent = frame
topBar.Size = UDim2.new(1,0,0,40)
topBar.BackgroundColor3 = Color3.fromRGB(15,15,15)
topBar.BorderSizePixel = 0

local topCorner = Instance.new("UICorner", topBar)
topCorner.CornerRadius = UDim.new(0,14)

-- TITLE
local title = Instance.new("TextLabel")
title.Parent = topBar
title.Size = UDim2.new(1,0,1,0)
title.Text = "⛩️ RYUZEN HUB"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18

-- SIDE BAR
local sideBar = Instance.new("Frame")
sideBar.Parent = frame
sideBar.Size = UDim2.new(0,90,1,-40)
sideBar.Position = UDim2.new(0,0,0,40)
sideBar.BackgroundColor3 = Color3.fromRGB(25,25,25)
sideBar.BorderSizePixel = 0

-- CONTENT
local contentFrame = Instance.new("Frame")
contentFrame.Parent = frame
contentFrame.Size = UDim2.new(1,-90,1,-40)
contentFrame.Position = UDim2.new(0,90,0,40)
contentFrame.BackgroundTransparency = 1

-- CREATE TAB
local function createTab()
	local f = Instance.new("Frame")
	f.Size = UDim2.new(1,0,1,0)
	f.BackgroundTransparency = 1
	f.Visible = false
	f.Parent = contentFrame
	return f
end

local mainFrame = createTab()
local funFrame = createTab()
local creditFrame = createTab()

-- HIDE ALL
local function hideAllTabs()
	mainFrame.Visible = false
	funFrame.Visible = false
	creditFrame.Visible = false
end

-- DEFAULT TAB
hideAllTabs()
mainFrame.Visible = true

-- BUTTON CREATOR
local function createButton(text,y)
	local btn = Instance.new("TextButton")
	btn.Parent = sideBar
	btn.Size = UDim2.new(1,-10,0,32)
	btn.Position = UDim2.new(0,5,0,y)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.BorderSizePixel = 0

	local c = Instance.new("UICorner", btn)
	c.CornerRadius = UDim.new(0,8)

	return btn
end

local btnMain = createButton("Main",10)
local btnFun = createButton("Fun",50)
local btnCredits = createButton("Créditos",90)

-- BUTTON LOGIC
btnMain.MouseButton1Click:Connect(function()
	hideAllTabs()
	mainFrame.Visible = true
end)

btnFun.MouseButton1Click:Connect(function()
	hideAllTabs()
	funFrame.Visible = true
end)

btnCredits.MouseButton1Click:Connect(function()
	hideAllTabs()
	creditFrame.Visible = true
end)

-- LABEL CREATOR
local function createLabel(parent,text,y)
	local lbl = Instance.new("TextLabel")
	lbl.Parent = parent
	lbl.Size = UDim2.new(1,-20,0,40)
	lbl.Position = UDim2.new(0,10,0,y)
	lbl.Text = text
	lbl.TextColor3 = Color3.new(1,1,1)
	lbl.BackgroundTransparency = 1
	lbl.Font = Enum.Font.GothamBold
	lbl.TextSize = 18
	return lbl
end

-- MAIN CONTENT
createLabel(mainFrame,"Bem-vindo ao RYUZEN HUB ⛩️",20)

-- FUN CONTENT
createLabel(funFrame,"Área FUN",20)

-- CREDITS CONTENT
createLabel(creditFrame,"Créditos",20)
createLabel(creditFrame,"Coffe | Pedro | Emilly | Ester",60)

-- FPS
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Parent = topBar
fpsLabel.Size = UDim2.new(0,80,1,0)
fpsLabel.Position = UDim2.new(1,-90,0,0)
fpsLabel.Text = "FPS: 0"
fpsLabel.TextColor3 = Color3.new(1,1,1)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Font = Enum.Font.GothamBold
fpsLabel.TextSize = 14
fpsLabel.TextXAlignment = Enum.TextXAlignment.Right

local frames = 0
local last = tick()

RunService.RenderStepped:Connect(function()
	frames += 1
	if tick() - last >= 1 then
		fpsLabel.Text = "FPS: "..frames
		frames = 0
		last = tick()
	end
end)
