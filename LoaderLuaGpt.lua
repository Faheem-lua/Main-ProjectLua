--// Faheem GPT X Hub - Rainbow Loader GUI

-- Variables
local TweenService = game:GetService("TweenService")
local CoreGui = game:FindService("CoreGui")

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.Name = "GPTXHubLoader"

-- Main Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 100)
Frame.Position = UDim2.new(0.5, -150, 0.5, -50)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

-- Loading Text
local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(1, 0, 1, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "Loading GPT X Hub..."
LoadingText.Font = Enum.Font.GothamBold
LoadingText.TextScaled = true
LoadingText.Parent = Frame
LoadingText.TextColor3 = Color3.fromRGB(255, 0, 255)

-- Rainbow Animation
spawn(function()
    while true do
        for hue = 0, 1, 0.01 do
            LoadingText.TextColor3 = Color3.fromHSV(hue, 1, 1)
            task.wait(0.02)
        end
    end
end)

-- Fade in
Frame.BackgroundTransparency = 1
TweenService:Create(Frame, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()

-- Wait and load
task.wait(3) -- wait 3 seconds

-- Fade out
TweenService:Create(Frame, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(LoadingText, TweenInfo.new(1), {TextTransparency = 1}):Play()

task.wait(1.2)

-- Destroy loader
ScreenGui:Destroy()

-- Load your GPTX Hub
loadstring(game:HttpGet("https://raw.githubusercontent.com/Faheem-lua/Main-ProjectLua/refs/heads/main/GPTXHUB.lua"))()
