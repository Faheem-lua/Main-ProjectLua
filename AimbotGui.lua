--// Faheem Advanced Universal Aimbot with Loader

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Variables
local AimbotEnabled = false
local SilentAimEnabled = false
local CurrentFOV = 70
local Prediction = 0.13

-- Rainbow Loader GUI
local LoaderGui = Instance.new("ScreenGui", game.CoreGui)
LoaderGui.Name = "FaheemLoaderGUI"

local LoaderFrame = Instance.new("Frame", LoaderGui)
LoaderFrame.Size = UDim2.new(0, 300, 0, 100)
LoaderFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
LoaderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoaderFrame.BorderSizePixel = 4
LoaderFrame.Active = true
LoaderFrame.Draggable = true

local LoaderTitle = Instance.new("TextLabel", LoaderFrame)
LoaderTitle.Size = UDim2.new(1, 0, 0, 50)
LoaderTitle.Position = UDim2.new(0, 0, 0, 0)
LoaderTitle.BackgroundTransparency = 1
LoaderTitle.Text = "Loading Faheem Aimbot..."
LoaderTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
LoaderTitle.Font = Enum.Font.GothamBold
LoaderTitle.TextScaled = true

local Rainbow = 0
RunService.RenderStepped:Connect(function()
    Rainbow = Rainbow + 1
    if Rainbow >= 255 then Rainbow = 0 end
    LoaderFrame.BackgroundColor3 = Color3.fromHSV(Rainbow/255, 1, 1)
end)

task.wait(4)
LoaderGui:Destroy()

-- Main GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "FaheemSimpleAimbotGUI"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Position = UDim2.new(0, 20, 0, 100)
MainFrame.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
MainFrame.BorderSizePixel = 4
MainFrame.Active = true
MainFrame.Draggable = true

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(100, 0, 100)
Title.Text = "Faheem Simple Aimbot"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

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
    ToggleButton.Text = AimbotEnabled and "Aimbot: ON" or "Aimbot: OFF"
    ToggleButton.BackgroundColor3 = AimbotEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(170, 0, 170)
end)

local SilentButton = Instance.new("TextButton", MainFrame)
SilentButton.Size = UDim2.new(0.8, 0, 0, 40)
SilentButton.Position = UDim2.new(0.1, 0, 0.4, 0)
SilentButton.BackgroundColor3 = Color3.fromRGB(170, 0, 170)
SilentButton.Text = "Silent Aim: OFF"
SilentButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SilentButton.Font = Enum.Font.GothamBold
SilentButton.TextScaled = true
SilentButton.BorderSizePixel = 2

SilentButton.MouseButton1Click:Connect(function()
    SilentAimEnabled = not SilentAimEnabled
    SilentButton.Text = SilentAimEnabled and "Silent Aim: ON" or "Silent Aim: OFF"
    SilentButton.BackgroundColor3 = SilentAimEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(170, 0, 170)
end)

local FOVLabel = Instance.new("TextLabel", MainFrame)
FOVLabel.Size = UDim2.new(0.8, 0, 0, 20)
FOVLabel.Position = UDim2.new(0.1, 0, 0.63, 0)
FOVLabel.BackgroundTransparency = 1
FOVLabel.Text = "FOV: 70"
FOVLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FOVLabel.Font = Enum.Font.Gotham
FOVLabel.TextScaled = true

local FOVButton = Instance.new("TextButton", MainFrame)
FOVButton.Size = UDim2.new(0.8, 0, 0, 30)
FOVButton.Position = UDim2.new(0.1, 0, 0.76, 0)
FOVButton.BackgroundColor3 = Color3.fromRGB(170, 0, 170)
FOVButton.Text = "Change FOV"
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

local Credits = Instance.new("TextLabel", MainFrame)
Credits.Size = UDim2.new(1, -10, 0, 25)
Credits.Position = UDim2.new(0, 5, 1, -30)
Credits.BackgroundTransparency = 1
Credits.Text = "Credits: Made by Faheem"
Credits.TextColor3 = Color3.fromRGB(200, 200, 200)
Credits.Font = Enum.Font.Gotham
Credits.TextScaled = true

StarterGui:SetCore("SendNotification", {
    Title = "Faheem Aimbot",
    Text = "Made by Faheem",
    Duration = 5
})

task.wait(1)

StarterGui:SetCore("SendNotification", {
    Title = "Faheem Aimbot",
    Text = "More updates soon!",
    Duration = 5
})

-- Aimbot Core
local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
            local pos, visible = Camera:WorldToViewportPoint(v.Character.Head.Position)
            if visible then
                local distance = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                if distance < shortestDistance and distance <= CurrentFOV then
                    shortestDistance = distance
                    closestPlayer = v
                end
            end
        end
    end
    return closestPlayer
end

-- Silent Aim Hook
local __index
__index = hookmetamethod(game, "__index", function(self, key)
    if SilentAimEnabled and not checkcaller() and key == "Hit" then
        local target = GetClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            local pred = target.Character.Head.Velocity * Prediction
            return (target.Character.Head.Position + pred)
        end
    end
    return __index(self, key)
end)

-- FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Color = Color3.fromHSV(0, 1, 1)
FOVCircle.Thickness = 2
FOVCircle.Radius = CurrentFOV
FOVCircle.Filled = false
FOVCircle.Transparency = 1

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = UserInputService:GetMouseLocation()
    FOVCircle.Radius = CurrentFOV
    FOVCircle.Color = Color3.fromHSV(tick()%5/5, 1, 1)

    if AimbotEnabled then
        local target = GetClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end
end)
