--// Faheem Simple Universal Aimbot GUI (Purple + Silent Aim + FOV Circle Rainbow)

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "AimbotGUI"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 280)
MainFrame.Position = UDim2.new(0, 20, 0, 100)
MainFrame.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
MainFrame.BorderSizePixel = 4
MainFrame.Active = true
MainFrame.Draggable = true

-- Title
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(100, 0, 100)
Title.Text = "Universal Aimbot"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

-- Variables
local AimbotEnabled = false
local SilentAimEnabled = false
local CurrentFOV = 70
local TargetPart = "Head"

-- Aimbot Toggle Button
local ToggleButton = Instance.new("TextButton", MainFrame)
ToggleButton.Size = UDim2.new(0.8, 0, 0, 40)
ToggleButton.Position = UDim2.new(0.1, 0, 0.2, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(170, 0, 170)
ToggleButton.Text = "Aimbot: OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextScaled = true
ToggleButton.BorderSizePixel = 2

ToggleButton.MouseButton1Click:Connect(function()
    AimbotEnabled = not AimbotEnabled
    if AimbotEnabled then
        ToggleButton.Text = "Aimbot: ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    else
        ToggleButton.Text = "Aimbot: OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(170, 0, 170)
    end
end)

-- FOV Label and Button
local FOVLabel = Instance.new("TextLabel", MainFrame)
FOVLabel.Size = UDim2.new(0.8, 0, 0, 20)
FOVLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
FOVLabel.BackgroundTransparency = 1
FOVLabel.Text = "FOV: 70"
FOVLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FOVLabel.Font = Enum.Font.Gotham
FOVLabel.TextScaled = true

local FOVButton = Instance.new("TextButton", MainFrame)
FOVButton.Size = UDim2.new(0.8, 0, 0, 30)
FOVButton.Position = UDim2.new(0.1, 0, 0.5, 0)
FOVButton.BackgroundColor3 = Color3.fromRGB(170, 0, 170)
FOVButton.Text = "Click to Change FOV"
FOVButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FOVButton.Font = Enum.Font.GothamBold
FOVButton.TextScaled = true
FOVButton.BorderSizePixel = 2

FOVButton.MouseButton1Click:Connect(function()
    if CurrentFOV == 70 then
        CurrentFOV = 90
    elseif CurrentFOV == 90 then
        CurrentFOV = 110
    elseif CurrentFOV == 110 then
        CurrentFOV = 50
    else
        CurrentFOV = 70
    end
    Camera.FieldOfView = CurrentFOV
    FOVLabel.Text = "FOV: "..CurrentFOV
end)

-- Silent Aim Toggle Button
local SilentAimButton = Instance.new("TextButton", MainFrame)
SilentAimButton.Size = UDim2.new(0.8, 0, 0, 30)
SilentAimButton.Position = UDim2.new(0.1, 0, 0.7, 0)
SilentAimButton.BackgroundColor3 = Color3.fromRGB(170, 0, 170)
SilentAimButton.Text = "Silent Aim: OFF"
SilentAimButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SilentAimButton.Font = Enum.Font.GothamBold
SilentAimButton.TextScaled = true
SilentAimButton.BorderSizePixel = 2

SilentAimButton.MouseButton1Click:Connect(function()
    SilentAimEnabled = not SilentAimEnabled
    if SilentAimEnabled then
        SilentAimButton.Text = "Silent Aim: ON"
        SilentAimButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    else
        SilentAimButton.Text = "Silent Aim: OFF"
        SilentAimButton.BackgroundColor3 = Color3.fromRGB(170, 0, 170)
    end
end)

-- Credits Label
local Credits = Instance.new("TextLabel", MainFrame)
Credits.Size = UDim2.new(1, -10, 0, 25)
Credits.Position = UDim2.new(0, 5, 1, -30)
Credits.BackgroundTransparency = 1
Credits.Text = "Credits: Made by Faheem"
Credits.TextColor3 = Color3.fromRGB(200, 200, 200)
Credits.Font = Enum.Font.Gotham
Credits.TextScaled = true

-- Notifications
StarterGui:SetCore("SendNotification", {
    Title = "Nofications",
    Text = "This Scirpt Made By Faheem",
    Duration = 5
})

task.wait(1)

StarterGui:SetCore("SendNotification", {
    Title = "Bot Aimbot",
    Text = "More updates soon!",
    Duration = 5
})

-- FOV Circle Drawing
local DrawingFOV = Drawing.new("Circle")
DrawingFOV.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
DrawingFOV.Radius = CurrentFOV
DrawingFOV.Visible = true
DrawingFOV.Color = Color3.fromRGB(255, 0, 0)
DrawingFOV.Transparency = 0.5
DrawingFOV.Thickness = 2
DrawingFOV.Filled = false

-- Get Closest Player Function
local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild(TargetPart) and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
            local pos, visible = Camera:WorldToViewportPoint(v.Character[TargetPart].Position)
            if visible then
                local distance = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                if distance < shortestDistance and distance < CurrentFOV then
                    shortestDistance = distance
                    closestPlayer = v
                end
            end
        end
    end
    return closestPlayer
end

-- RunService Loop
RunService.RenderStepped:Connect(function()
    -- Update FOV Circle
    DrawingFOV.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    DrawingFOV.Radius = CurrentFOV
    DrawingFOV.Visible = AimbotEnabled

    -- Rainbow Color
    local hue = tick() % 5 / 5
    DrawingFOV.Color = Color3.fromHSV(hue, 1, 1)

    -- Normal Aimbot
    if AimbotEnabled and not SilentAimEnabled then
        local target = GetClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild(TargetPart) then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character[TargetPart].Position)
        end
    end
end)

-- Silent Aim Advanced (Prediction)
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if SilentAimEnabled and AimbotEnabled and method == "FindPartOnRayWithIgnoreList" then
        local target = GetClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild(TargetPart) then
            local part = target.Character[TargetPart]
            local partVelocity = part.Velocity or Vector3.zero

            local PredictionMultiplier = 0.165

            local predictedPosition = part.Position + (partVelocity * PredictionMultiplier)
            args[1] = Ray.new(Camera.CFrame.Position, (predictedPosition - Camera.CFrame.Position).Unit * 1000)
            return oldNamecall(self, unpack(args))
        end
    end

    return oldNamecall(self, ...)
end)
