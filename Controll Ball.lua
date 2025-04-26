-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

-- Player and character references
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRoot = character:WaitForChild("HumanoidRootPart")
local currentCamera = Workspace.CurrentCamera

-- Animation setup
local animator = humanoid:WaitForChild("Animator")
local animationInstance = Instance.new("Animation")
animationInstance.AnimationId = "rbxassetid://125865269944406"
local loadedAnimation = animator:LoadAnimation(animationInstance)

-- Create Screen GUI and UI Elements
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = localPlayer:WaitForChild("PlayerGui")

-- Control button (for toggling control mode)
local controlButton = Instance.new("TextButton")
controlButton.Size = UDim2.new(0.2, 0, 0.1, 0)
controlButton.Position = UDim2.new(0.02, 0, 0.2, 0)
controlButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
controlButton.Text = "Controll Ball"
controlButton.Parent = screenGui

-- Control frame (hidden by default)
local controlFrame = Instance.new("Frame")
controlFrame.Size = UDim2.new(0.3, 0, 0.12, 0)
controlFrame.Position = UDim2.new(0.35, 0, 0.6, 0)
controlFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
controlFrame.Visible = false
controlFrame.Parent = screenGui

-- Speed label inside the control frame
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0.3, 0)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed: 70"
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.TextScaled = true
speedLabel.Parent = controlFrame

-- Slider frame for adjusting control speed
local sliderFrame = Instance.new("Frame")
sliderFrame.Size = UDim2.new(0.9, 0, 0.4, 0)
sliderFrame.Position = UDim2.new(0.05, 0, 0.5, 0)
sliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderFrame.Parent = controlFrame

-- Slider button (the draggable element)
local sliderButton = Instance.new("Frame")
sliderButton.Size = UDim2.new(0.05, 0, 1, 0)
sliderButton.Position = UDim2.new(0.07, 0, 0, 0)
sliderButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
sliderButton.Parent = sliderFrame

-- Credit label (hidden by default)
local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(0.3, 0, 0.1, 0)
creditLabel.Position = UDim2.new(0.35, 0, 0.35, 0)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "Made by Faheem"
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditLabel.TextScaled = true
creditLabel.Parent = screenGui
creditLabel.Visible = false

-- State variables
local isAscending = false
local isControlToggled = false
local ascendHeight = 35
local football = nil
local velocityHeartbeatConnection = nil
local bodyVelocityInstance = nil
local movementFactor = 2.5
local controlSpeed = 70

-- Utility function: get the Football from the workspace
local function getFootball()
	return Workspace:FindFirstChild("Football")
end

-- Continuous update for the local character while ascending

-- Function to activate control mode on the football
local function activateControl()
	if not football then
		return
	end

	-- Cleanup any previous velocity connections/instances.
	if velocityHeartbeatConnection then
		velocityHeartbeatConnection:Disconnect()
		velocityHeartbeatConnection = nil
	end
	if bodyVelocityInstance then
		bodyVelocityInstance:Destroy()
		bodyVelocityInstance = nil
	end

	-- Change the camera subject to the football.
	currentCamera.CameraSubject = football

	-- Create a new BodyVelocity to control the football.
	local controlBodyVelocity = Instance.new("BodyVelocity")
	controlBodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000) -- simplified constant values
	controlBodyVelocity.Parent = football

	-- Connect a heartbeat to update the control velocity.
	local controlConnection
	controlConnection = RunService.Heartbeat:Connect(function()
		if (not isControlToggled) or (not football) or (not football.Parent) then
			controlBodyVelocity:Destroy()
			currentCamera.CameraSubject = character
			if controlConnection then
				controlConnection:Disconnect()
			end
			return
		end
		-- Set the football's velocity based on the camera's look vector.
		controlBodyVelocity.Velocity = currentCamera.CFrame.LookVector * controlSpeed
	end)
end

-- Button click events

controlButton.MouseButton1Click:Connect(function()
	-- Toggle control mode
	if not football then
		football = getFootball()
		if not football then
			warn("No Ball Found!")
			return
		end
	end
	isControlToggled = not isControlToggled
	-- Update UI colors and frame visibility based on control state.
	if isControlToggled then
		controlButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
		controlFrame.Visible = true
		activateControl()
	else
		controlButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		controlFrame.Visible = false
	end
end)

-- Slider drag handling for adjusting control speed
local isDraggingSlider = false

sliderButton.InputBegan:Connect(function(inputEvent)
	if inputEvent.UserInputType == Enum.UserInputType.MouseButton1 or inputEvent.UserInputType == Enum.UserInputType.Touch then
		isDraggingSlider = true
	end
end)

UserInputService.InputEnded:Connect(function(inputEvent)
	if inputEvent.UserInputType == Enum.UserInputType.MouseButton1 or inputEvent.UserInputType == Enum.UserInputType.Touch then
		isDraggingSlider = false
	end
end)

RunService.RenderStepped:Connect(function()
	if isDraggingSlider then
		local mouseX = UserInputService:GetMouseLocation().X
		local framePosX = sliderFrame.AbsolutePosition.X
		local frameEndX = framePosX + sliderFrame.AbsoluteSize.X
		local normalized = (mouseX - framePosX) / (frameEndX - framePosX)
		-- Clamp the slider position to [0,1] (with a small offset)
		sliderButton.Position = UDim2.new(math.clamp(normalized, 0, 1) - 0.025, 0, 0, 0)
		-- Update control speed based on slider value
		controlSpeed = math.floor(20 + (normalized * 240))  -- example: speed in range [20,260]
		speedLabel.Text = "Speed: " .. tostring(controlSpeed)
	end
end)

-- Keyboard shortcuts: Y to toggle ascension, U to toggle control
UserInputService.InputBegan:Connect(function(keyInput, isProcessed)
	if isProcessed then return end
	if keyInput.KeyCode == Enum.KeyCode.U then
		controlButton:Activate()
	end
end)
