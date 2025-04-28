--// InfAwakening GUI - Made by 101jackniku and Faheem

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local AbilityController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))

-- Notifications
StarterGui:SetCore("SendNotification", {
    Title = "InfAwakening GUI",
    Text = "This script only works on Blue Lock Rivals (BLR)!",
    Duration = 5
})

task.wait(1)

StarterGui:SetCore("SendNotification", {
    Title = "Force Style Info",
    Text = "Default is Kaiser. Now you can choose your Style!",
    Duration = 5
})

StarterGui:SetCore("SendNotification", {
    Title = "Creator Info",
    Text = "Made by 101jackniku and Faheem",
    Duration = 5
})

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "InfAwakeningGUI"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 250, 0, 250) -- Bigger for dropdown
MainFrame.Position = UDim2.new(0, 20, 0, 200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BackgroundTransparency = 1

-- Music Sound
local Sound = Instance.new("Sound", ScreenGui)
Sound.SoundId = "rbxassetid://9127150941"
Sound.Volume = 2
Sound:Play()

-- Fade-In Animation
local tween = TweenService:Create(MainFrame, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0
})
tween:Play()

-- Title
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Title.Text = "InfAwakening | 101jackniku & Faheem"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

-- Dropdown (TextBox)
local StyleDropDown = Instance.new("TextBox", MainFrame)
StyleDropDown.Size = UDim2.new(0.8, 0, 0, 30)
StyleDropDown.Position = UDim2.new(0.1, 0, 0.2, 0)
StyleDropDown.PlaceholderText = "Enter Style: (Kaiser, King, etc)"
StyleDropDown.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
StyleDropDown.TextColor3 = Color3.fromRGB(255, 255, 255)
StyleDropDown.Font = Enum.Font.GothamSemibold
StyleDropDown.TextScaled = true
StyleDropDown.BorderSizePixel = 0

-- Toggle Awakening Button
local ToggleButton = Instance.new("TextButton", MainFrame)
ToggleButton.Size = UDim2.new(0.8, 0, 0, 30)
ToggleButton.Position = UDim2.new(0.1, 0, 0.45, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
ToggleButton.Text = "InfAwakening: OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamSemibold
ToggleButton.TextScaled = true
ToggleButton.BorderSizePixel = 0

-- Destroy GUI Button
local DestroyButton = Instance.new("TextButton", MainFrame)
DestroyButton.Size = UDim2.new(0.8, 0, 0, 30)
DestroyButton.Position = UDim2.new(0.1, 0, 0.7, 0)
DestroyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
DestroyButton.Text = "Destroy GUI"
DestroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DestroyButton.Font = Enum.Font.GothamSemibold
DestroyButton.TextScaled = true
DestroyButton.BorderSizePixel = 0

-- Credits Label
local Credits = Instance.new("TextLabel", MainFrame)
Credits.Size = UDim2.new(1, -10, 0, 25)
Credits.Position = UDim2.new(0, 5, 1, -30)
Credits.BackgroundTransparency = 1
Credits.Text = "Made by 101jackniku and Faheem"
Credits.TextColor3 = Color3.fromRGB(200, 200, 200)
Credits.Font = Enum.Font.Gotham
Credits.TextScaled = true

-- Variables
local InfAwakeningEnabled = false
local v171 = "Kaiser" -- Default Style

-- Dropdown Update
StyleDropDown.FocusLost:Connect(function()
    if StyleDropDown.Text ~= "" then
        v171 = StyleDropDown.Text
        StarterGui:SetCore("SendNotification", {
            Title = "Style Changed!",
            Text = "Now using: "..v171,
            Duration = 4
        })
    end
end)

-- Toggle Behavior
ToggleButton.MouseButton1Click:Connect(function()
    InfAwakeningEnabled = not InfAwakeningEnabled
    if InfAwakeningEnabled then
        ToggleButton.Text = "InfAwakening: ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    else
        ToggleButton.Text = "InfAwakening: OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    end
end)

-- Destroy Button Behavior
DestroyButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Awakening Loop
spawn(function()
    while task.wait(1) do
        if InfAwakeningEnabled then
            LocalPlayer.PlayerStats.Style.Value = v171
            if (v171 == "Kaiser") or (v171 == "King") or (v171 == "Kurona") then
                LocalPlayer.PlayerStats.InAwakening.Value = true
            end
            AbilityController:UseAbility("Awakening")
        end
    end
end)

-- Close / Open GUI (RightControl)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightControl and not gameProcessed then
        MainFrame.Visible = not MainFrame.Visible
    end
end)
