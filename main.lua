-- ⛩️ RYUZEN HUB | MENU COM ABAS
-- Dark + Red | Mobile + PC | Estável

if getgenv().RYUZEN_LOADED then return end
getgenv().RYUZEN_LOADED = true

-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "RYUZEN_HUB"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 500, 0, 300)
main.Position = UDim2.new(0.5,-250,0.5,-150)
main.BackgroundColor3 = Color3.fromRGB(14,14,14)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(170,0,0)
stroke.Thickness = 2

-- TOP BAR
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,40)
top.BackgroundTransparency = 1

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,0,1,0)
title.Text = "⛩️ RYUZEN HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(220,0,0)
title.BackgroundTransparency = 1

-- CLOSE BUTTON
local close = Instance.new("TextButton", top)
close.Size = UDim2.new(0,40,1,0)
close.Position = UDim2.new(1,-40,0,0)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.TextColor3 = Color3.fromRGB(255,80,80)
close.BackgroundTransparency = 1

close.MouseButton1Click:Connect(function()
	gui.Enabled = false
end)

-- OPEN BUTTON (quando fecha)
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0,120,0,40)
openBtn.Position = UDim2.new(0,20,0.5,-20)
openBtn.Text = "⛩️ RYUZEN"
openBtn.Font = Enum.Font.GothamBold
openBtn.TextSize = 14
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.BackgroundColor3 = Color3.fromRGB(170,0,0)
openBtn.Visible = false
openBtn.BorderSizePixel = 0
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0,12)

openBtn.MouseButton1Click:Connect(function()
	gui.Enabled = true
	openBtn.Visible = false
end)

-- SIDEBAR
local sidebar = Instance.new("Frame", main)
sidebar.Position = UDim2.new(0,0,0,40)
sidebar.Size = UDim2.new(0,120,1,-40)
sidebar.BackgroundColor3 = Color3.fromRGB(18,18,18)
sidebar.BorderSizePixel = 0

-- CONTENT
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,120,0,40)
content.Size = UDim2.new(1,-120,1,-40)
content.BackgroundTransparency = 1

-- FUNÇÃO CRIAR ABA
local tabs = {}

local function createTab(name, order)
	local btn = Instance.new("TextButton", sidebar)
	btn.Size = UDim2.new(1,-10,0,40)
	btn.Position = UDim2.new(0,5,0,(order-1)*45+10)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(30,30,30)
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

	local frame = Instance.new("Frame", content)
	frame.Size = UDim2.new(1,0,1,0)
	frame.Visible = false
	frame.BackgroundTransparency = 1

	tabs[name] = frame

	btn.MouseButton1Click:Connect(function()
		for _,v in pairs(tabs) do
			v.Visible = false
		end
		frame.Visible = true
	end)

	return frame
end

-- ABAS
local mainTab = createTab("Main",1)
local funTab = createTab("Fun",2)
local creditsTab = createTab("Créditos",3)

mainTab.Visible = true

-- CONTEÚDO MAIN
local mainLabel = Instance.new("TextLabel", mainTab)
mainLabel.Size = UDim2.new(1,0,0,40)
mainLabel.Position = UDim2.new(0,0,0,20)
mainLabel.Text = "Bem-vindo ao RYUZEN HUB"
mainLabel.Font = Enum.Font.GothamBold
mainLabel.TextSize = 18
mainLabel.TextColor3 = Color3.new(1,1,1)
mainLabel.BackgroundTransparency = 1

-- FUN TAB
local funLabel = mainLabel:Clone()
funLabel.Parent = funTab
funLabel.Text = "Funções divertidas em breve"

-- CRÉDITOS
local credLabel = mainLabel:Clone()
credLabel.Parent = creditsTab
credLabel.Text = "Criado por Luxzinho & Equipe ⛩️"

local join = Instance.new("TextButton", creditsTab)
join.Size = UDim2.new(0,180,0,40)
join.Position = UDim2.new(0.5,-90,0,80)
join.Text = "Discord"
join.Font = Enum.Font.GothamBold
join.TextSize = 14
join.TextColor3 = Color3.new(1,1,1)
join.BackgroundColor3 = Color3.fromRGB(170,0,0)
join.BorderSizePixel = 0
Instance.new("UICorner", join).CornerRadius = UDim.new(0,10)

join.MouseButton1Click:Connect(function()
	setclipboard("https://discord.gg/SEU_LINK")
end)

-- FECHAR MENU
close.MouseButton1Click:Connect(function()
	gui.Enabled = false
	openBtn.Visible = true
end)
