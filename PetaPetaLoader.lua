local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ESPAndSpeedGUI"
gui.ResetOnSpawn = false

local function style(instance)
	instance.BackgroundTransparency = 0
	instance.BorderSizePixel = 0
	if instance:IsA("TextButton") or instance:IsA("TextLabel") then
		instance.Font = Enum.Font.GothamSemibold
		instance.TextScaled = true
		instance.TextWrapped = true
	end
end

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 240, 0, 360)
frame.Position = UDim2.new(0.35, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true
frame.Parent = gui
style(frame)
Instance.new("UICorner", frame)

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 30, 0, 30)
toggleBtn.Position = UDim2.new(1, -35, 0, 5)
toggleBtn.Text = "X"
toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextColor3 = Color3.new(0, 0, 0)
toggleBtn.Parent = frame
style(toggleBtn)

local isOpen = true
toggleBtn.MouseButton1Click:Connect(function()
	isOpen = not isOpen
	frame.Visible = isOpen
end)

local function createButton(name, yOffset, color)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 35)
	btn.Position = UDim2.new(0, 10, 0, yOffset)
	btn.Text = name
	btn.BackgroundColor3 = color
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Parent = frame
	style(btn)
	Instance.new("UICorner", btn)
	return btn
end

local espBtn = createButton("ESP Peta Peta", 40, Color3.fromRGB(255, 100, 100))
local speedBtn = createButton("Local Speed", 80, Color3.fromRGB(100, 100, 255))
local boxBtn = createButton("ESP Box", 120, Color3.fromRGB(100, 255, 100))
local safeBtn = createButton("ESP Safe", 160, Color3.fromRGB(255, 255, 0))
local dollBtn = createButton("ESP Doll", 200, Color3.fromRGB(255, 255, 255))
local infoBtn = createButton("Info", 240, Color3.fromRGB(180, 180, 180))

local function applyHighlight(object, color)
	if not object:FindFirstChildOfClass("Highlight") then
		local hl = Instance.new("Highlight")
		hl.FillColor = color
		hl.FillTransparency = 0.2
		hl.OutlineTransparency = 1
		hl.Parent = object
	end
end

espBtn.MouseButton1Click:Connect(function()
	for _, model in ipairs(workspace:GetDescendants()) do
		if model:IsA("Model") and (model.Name == "EnemyModel" or model.Name == "EnemyModels") then
			applyHighlight(model, Color3.fromRGB(255, 100, 100))
		end
	end
end)

speedBtn.MouseButton1Click:Connect(function()
	local char = player.Character or player.CharacterAdded:Wait()
	local hum = char:FindFirstChildWhichIsA("Humanoid")
	if hum then
		hum.WalkSpeed = 64
	end
end)

boxBtn.MouseButton1Click:Connect(function()
	for _, part in ipairs(workspace:GetDescendants()) do
		if part:IsA("BasePart") and part.Name == "BoxBottom" then
			applyHighlight(part, Color3.fromRGB(100, 255, 100))
		end
	end
end)

safeBtn.MouseButton1Click:Connect(function()
	for _, part in ipairs(workspace:GetDescendants()) do
		if part:IsA("BasePart") and part.Name == "Meshes/safe_Safe" then
			applyHighlight(part, Color3.fromRGB(255, 255, 0))
		end
	end
end)

dollBtn.MouseButton1Click:Connect(function()
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") and obj.Name == "DollHead" then
			applyHighlight(obj, Color3.fromRGB(255, 255, 255))
		end
	end
end)

infoBtn.MouseButton1Click:Connect(function()
	local infoGui = Instance.new("TextLabel")
	infoGui.Size = UDim2.new(0.6, 0, 0.25, 0)
	infoGui.Position = UDim2.new(0.2, 0, 0.35, 0)
	infoGui.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	infoGui.TextColor3 = Color3.new(1, 1, 1)
	infoGui.Text = [[
⚠️ Info:
- Speed resets when you hide and load
- ESPs may need reactivating after peta peta gone.
- ESP Doll affects all dolls globally
]]
	infoGui.Parent = gui
	style(infoGui)
	Instance.new("UICorner", infoGui)
	task.delay(6, function()
		infoGui:Destroy()
	end)
end)

local function rainbowCycle(obj)
	coroutine.wrap(function()
		while obj and obj.Parent do
			for hue = 0, 1, 0.01 do
				obj.TextColor3 = Color3.fromHSV(hue, 1, 1)
				task.wait(0.03)
			end
		end
	end)()
end

local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(1, -20, 0, 20)
credit.Position = UDim2.new(0, 10, 1, -45)
credit.BackgroundTransparency = 1
credit.Text = "Made by Faheem"
credit.Font = Enum.Font.GothamBold
credit.TextStrokeTransparency = 0.5
credit.TextStrokeColor3 = Color3.new(0, 0, 0)
credit.Parent = frame
style(credit)
rainbowCycle(credit)

local discordBtn = Instance.new("TextButton")
discordBtn.Size = UDim2.new(1, -20, 0, 25)
discordBtn.Position = UDim2.new(0, 10, 1, -20)
discordBtn.Text = "📬 Discord user: foxlowx#1337"
discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordBtn.TextColor3 = Color3.new(1, 1, 1)
discordBtn.Font = Enum.Font.Gotham
discordBtn.TextStrokeTransparency = 0.5
discordBtn.TextStrokeColor3 = Color3.new(0, 0, 0)
discordBtn.Parent = frame
style(discordBtn)
Instance.new("UICorner", discordBtn)

local stroke = Instance.new("UIStroke", discordBtn)
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 1.5
stroke.Transparency = 0.2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

discordBtn.MouseButton1Click:Connect(function()
	setclipboard("foxlowx#1337")
	discordBtn.Text = "Copied to Clipboard!"
	task.wait(2)
	discordBtn.Text = "Discord: foxlowx#1337"
end)
