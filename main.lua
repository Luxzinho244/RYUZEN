-- ⛩️ RYUZEN ADMIN GUI | MAIN LOADER
-- Compatível: Mobile + PC
-- Executor: RYUZEN / Delta / outros

if getgenv().RYUZEN_LOADED then return end
getgenv().RYUZEN_LOADED = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- ================= GUI =================
local gui = Instance.new("ScreenGui")
gui.Name = "RYUZEN_GUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Frame principal
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 360, 0, 220)
main.Position = UDim2.new(0.5, -180, 0.5, -130)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.BackgroundTransparency = 1

-- Animação
TweenService:Create(
	main,
	TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
	{BackgroundTransparency = 0}
):Play()

-- Borda vermelha
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(170, 0, 0)

-- ================= TÍTULO =================
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "⛩️ RYUZEN HUB"
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(220, 0, 0)

-- ================= STATUS =================
local status = Instance.new("TextLabel", main)
status.Position = UDim2.new(0, 0, 0, 50)
status.Size = UDim2.new(1, 0, 0, 30)
status.Text = "Inicializando..."
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(200, 200, 200)

-- ================= BOTÃO =================
local loadBtn = Instance.new("TextButton", main)
loadBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
loadBtn.Size = UDim2.new(0.8, 0, 0, 45)
loadBtn.Text = "CARREGAR HUB"
loadBtn.Font = Enum.Font.GothamBold
loadBtn.TextSize = 16
loadBtn.TextColor3 = Color3.new(1,1,1)
loadBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
loadBtn.BorderSizePixel = 0

local corner = Instance.new("UICorner", loadBtn)
corner.CornerRadius = UDim.new(0, 10)

-- ================= LOADER =================
local function loadModules()
	status.Text = "Carregando módulos..."

	local base = "https://raw.githubusercontent.com/Luxzinho244/RYUZEN/main/modules/"

	local modules = {
		"noclip.lua",
		"fly.lua"
	}

	for _, file in ipairs(modules) do
		pcall(function()
			loadstring(game:HttpGet(base .. file))()
		end)
	end

	status.Text = "✔ Hub carregado"
	wait(0.6)
	gui:Destroy()
end

loadBtn.MouseButton1Click:Connect(loadModules)

-- Auto execute
task.delay(0.5, loadModules)

