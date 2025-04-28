--// Chronatic.lua Hub PRO Version - Made for Faheem

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local Camera = workspace.CurrentCamera

-- Main UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Chronatic Hub"
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(245, 230, 255)
MainFrame.BorderColor3 = Color3.fromRGB(128, 0, 128)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.25, 0, 0.5, 0) -- Start lower for animation
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BackgroundTransparency = 1 -- Hidden for animation start

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
TitleBar.Size = UDim2.new(1, 0, 0, 40)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TitleBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.Text = "Chronatic.lua Hub PRO"
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextScaled = true
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Tabs Panel
local TabsFrame = Instance.new("Frame")
TabsFrame.Parent = MainFrame
TabsFrame.BackgroundColor3 = Color3.fromRGB(220, 210, 250)
TabsFrame.Position = UDim2.new(0, 10, 0, 50)
TabsFrame.Size = UDim2.new(0, 120, 1, -60)
TabsFrame.BorderColor3 = Color3.fromRGB(128, 0, 128)

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ContentFrame.Position = UDim2.new(0, 140, 0, 50)
ContentFrame.Size = UDim2.new(1, -150, 1, -60)
ContentFrame.BorderColor3 = Color3.fromRGB(128, 0, 128)

--// Part 2 - Tab Buttons Setup

-- Home Tab Button
local HomeButton = Instance.new("TextButton")
HomeButton.Parent = TabsFrame
HomeButton.Size = UDim2.new(1, 0, 0, 40)
HomeButton.Position = UDim2.new(0, 0, 0, 0)
HomeButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
HomeButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
HomeButton.Text = "Home"
HomeButton.Font = Enum.Font.SourceSansBold
HomeButton.TextColor3 = Color3.fromRGB(50, 0, 50)
HomeButton.TextScaled = true

-- Fun Tab Button
local FunButton = Instance.new("TextButton")
FunButton.Parent = TabsFrame
FunButton.Size = UDim2.new(1, 0, 0, 40)
FunButton.Position = UDim2.new(0, 0, 0, 50)
FunButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
FunButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
FunButton.Text = "Fun"
FunButton.Font = Enum.Font.SourceSansBold
FunButton.TextColor3 = Color3.fromRGB(50, 0, 50)
FunButton.TextScaled = true

-- Misc Tab Button
local MiscButton = Instance.new("TextButton")
MiscButton.Parent = TabsFrame
MiscButton.Size = UDim2.new(1, 0, 0, 40)
MiscButton.Position = UDim2.new(0, 0, 0, 100)
MiscButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
MiscButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
MiscButton.Text = "Misc"
MiscButton.Font = Enum.Font.SourceSansBold
MiscButton.TextColor3 = Color3.fromRGB(50, 0, 50)
MiscButton.TextScaled = true

-- Player Tab Button
local PlayerButton = Instance.new("TextButton")
PlayerButton.Parent = TabsFrame
PlayerButton.Size = UDim2.new(1, 0, 0, 40)
PlayerButton.Position = UDim2.new(0, 0, 0, 150)
PlayerButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
PlayerButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
PlayerButton.Text = "Player"
PlayerButton.Font = Enum.Font.SourceSansBold
PlayerButton.TextColor3 = Color3.fromRGB(50, 0, 50)
PlayerButton.TextScaled = true

-- Style Tab Button
local StyleButton = Instance.new("TextButton")
StyleButton.Parent = TabsFrame
StyleButton.Size = UDim2.new(1, 0, 0, 40)
StyleButton.Position = UDim2.new(0, 0, 0, 200)
StyleButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
StyleButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
StyleButton.Text = "Style"
StyleButton.Font = Enum.Font.SourceSansBold
StyleButton.TextColor3 = Color3.fromRGB(50, 0, 50)
StyleButton.TextScaled = true

-- Rage Tab Button
local RageButton = Instance.new("TextButton")
RageButton.Parent = TabsFrame
RageButton.Size = UDim2.new(1, 0, 0, 40)
RageButton.Position = UDim2.new(0, 0, 0, 250)
RageButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
RageButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
RageButton.Text = "Rage"
RageButton.Font = Enum.Font.SourceSansBold
RageButton.TextColor3 = Color3.fromRGB(50, 0, 50)
RageButton.TextScaled = true

--// Part 3 - Create Pages for Each Tab

-- Clear Old Content Function
local function ClearContent()
    for _, child in pairs(ContentFrame:GetChildren()) do
        child:Destroy()
    end
end

-- Home Page
local function CreateHomePage()
    ClearContent()

    local HomeLabel = Instance.new("TextLabel")
    HomeLabel.Parent = ContentFrame
    HomeLabel.Size = UDim2.new(1, 0, 0, 50)
    HomeLabel.Position = UDim2.new(0, 0, 0, 0)
    HomeLabel.Text = "Welcome to Chronatic.lua Hub!"
    HomeLabel.Font = Enum.Font.SourceSansBold
    HomeLabel.TextScaled = true
    HomeLabel.TextColor3 = Color3.fromRGB(128, 0, 128)
    HomeLabel.BackgroundTransparency = 1

    local CreditsLabel = Instance.new("TextLabel")
    CreditsLabel.Parent = ContentFrame
    CreditsLabel.Size = UDim2.new(1, 0, 0, 40)
    CreditsLabel.Position = UDim2.new(0, 0, 0, 60)
    CreditsLabel.Text = "Made by Faheem & ChatGPT - 2025"
    CreditsLabel.Font = Enum.Font.SourceSansItalic
    CreditsLabel.TextScaled = true
    CreditsLabel.TextColor3 = Color3.fromRGB(100, 0, 150)
    CreditsLabel.BackgroundTransparency = 1
end

-- Fun Page (Ball ESP)
local function CreateFunPage()
    ClearContent()

    local FunButton = Instance.new("TextButton")
    FunButton.Parent = ContentFrame
    FunButton.Size = UDim2.new(0, 250, 0, 50)
    FunButton.Position = UDim2.new(0, 20, 0, 20)
    FunButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
    FunButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
    FunButton.Text = "Enable Ball ESP"
    FunButton.Font = Enum.Font.SourceSansBold
    FunButton.TextScaled = true
    FunButton.TextColor3 = Color3.fromRGB(50, 0, 50)

    FunButton.MouseButton1Click:Connect(function()
        local ball = workspace:FindFirstChild("Ball")
        if ball then
            local highlight = Instance.new("Highlight")
            highlight.FillColor = Color3.fromRGB(255, 0, 255)
            highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
            highlight.Parent = ball
        end
    end)
end

-- Misc Page (Anti Ragdoll + Anti Breaker)
local function CreateMiscPage()
    ClearContent()

    local RagdollButton = Instance.new("TextButton")
    RagdollButton.Parent = ContentFrame
    RagdollButton.Size = UDim2.new(0, 250, 0, 40)
    RagdollButton.Position = UDim2.new(0, 20, 0, 20)
    RagdollButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
    RagdollButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
    RagdollButton.Text = "Anti-Ragdoll"
    RagdollButton.Font = Enum.Font.SourceSansBold
    RagdollButton.TextScaled = true
    RagdollButton.TextColor3 = Color3.fromRGB(50, 0, 50)

    RagdollButton.MouseButton1Click:Connect(function()
        local char = Players.LocalPlayer.Character
        if char:FindFirstChild("RagdollRemote") then
            char.RagdollRemote:Destroy()
        end
    end)

    local BreakerButton = Instance.new("TextButton")
    BreakerButton.Parent = ContentFrame
    BreakerButton.Size = UDim2.new(0, 250, 0, 40)
    BreakerButton.Position = UDim2.new(0, 20, 0, 80)
    BreakerButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
    BreakerButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
    BreakerButton.Text = "Anti-Breaker"
    BreakerButton.Font = Enum.Font.SourceSansBold
    BreakerButton.TextScaled = true
    BreakerButton.TextColor3 = Color3.fromRGB(50, 0, 50)

    BreakerButton.MouseButton1Click:Connect(function()
        local char = Players.LocalPlayer.Character
        if char:FindFirstChild("Breaker") then
            char.Breaker:Destroy()
        end
    end)
end

--// Part 4 - Continue Pages (Player, Style, Rage)

-- Player Page (Speed Hack + Fly Mode)
local function CreatePlayerPage()
    ClearContent()

    local SpeedButton = Instance.new("TextButton")
    SpeedButton.Parent = ContentFrame
    SpeedButton.Size = UDim2.new(0, 250, 0, 40)
    SpeedButton.Position = UDim2.new(0, 20, 0, 20)
    SpeedButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
    SpeedButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
    SpeedButton.Text = "Speed Hack"
    SpeedButton.Font = Enum.Font.SourceSansBold
    SpeedButton.TextScaled = true
    SpeedButton.TextColor3 = Color3.fromRGB(50, 0, 50)

    SpeedButton.MouseButton1Click:Connect(function()
        Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end)

    local FlyButton = Instance.new("TextButton")
    FlyButton.Parent = ContentFrame
    FlyButton.Size = UDim2.new(0, 250, 0, 40)
    FlyButton.Position = UDim2.new(0, 20, 0, 80)
    FlyButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
    FlyButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
    FlyButton.Text = "Toggle Fly Mode"
    FlyButton.Font = Enum.Font.SourceSansBold
    FlyButton.TextScaled = true
    FlyButton.TextColor3 = Color3.fromRGB(50, 0, 50)

    local flying = false
    local flyspeed = 50

    FlyButton.MouseButton1Click:Connect(function()
        flying = not flying
        local player = Players.LocalPlayer
        local character = player.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

        if flying and humanoidRootPart then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Name = "FlyVelocity"
            bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            bodyVelocity.Parent = humanoidRootPart

            RunService.RenderStepped:Connect(function()
                if flying then
                    bodyVelocity.Velocity = (Camera.CFrame.LookVector) * flyspeed
                else
                    bodyVelocity:Destroy()
                end
            end)
        end
    end)
end

-- Style Page (Style Dropdown)
local function CreateStylePage()
    ClearContent()

    local StyleBox = Instance.new("TextBox")
    StyleBox.Parent = ContentFrame
    StyleBox.Size = UDim2.new(0, 250, 0, 40)
    StyleBox.Position = UDim2.new(0, 20, 0, 20)
    StyleBox.PlaceholderText = "Enter Style (Isagi, Rin, Kaiser...)"
    StyleBox.Font = Enum.Font.SourceSans
    StyleBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    StyleBox.TextScaled = true
    StyleBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

    local ApplyButton = Instance.new("TextButton")
    ApplyButton.Parent = ContentFrame
    ApplyButton.Size = UDim2.new(0, 250, 0, 40)
    ApplyButton.Position = UDim2.new(0, 20, 0, 80)
    ApplyButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
    ApplyButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
    ApplyButton.Text = "Apply Style"
    ApplyButton.Font = Enum.Font.SourceSansBold
    ApplyButton.TextScaled = true
    ApplyButton.TextColor3 = Color3.fromRGB(50, 0, 50)

    ApplyButton.MouseButton1Click:Connect(function()
        local styleName = StyleBox.Text
        local stats = Players.LocalPlayer:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = styleName
        end
    end)
end

-- Rage Page (Auto Score)
local function CreateRagePage()
    ClearContent()

    local RageButton = Instance.new("TextButton")
    RageButton.Parent = ContentFrame
    RageButton.Size = UDim2.new(0, 250, 0, 40)
    RageButton.Position = UDim2.new(0, 20, 0, 20)
    RageButton.BackgroundColor3 = Color3.fromRGB(200, 180, 255)
    RageButton.BorderColor3 = Color3.fromRGB(128, 0, 128)
    RageButton.Text = "Auto Score (Coming Soon)"
    RageButton.Font = Enum.Font.SourceSansBold
    RageButton.TextScaled = true
    RageButton.TextColor3 = Color3.fromRGB(50, 0, 50)

    RageButton.MouseButton1Click:Connect(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Chronatic.lua",
            Text = "Auto Score coming soon!",
            Duration = 4
        })
    end)
end

--// Part 5 - Connect Tab Buttons to Open Pages

HomeButton.MouseButton1Click:Connect(function()
    CreateHomePage()
end)

FunButton.MouseButton1Click:Connect(function()
    CreateFunPage()
end)

MiscButton.MouseButton1Click:Connect(function()
    CreateMiscPage()
end)

PlayerButton.MouseButton1Click:Connect(function()
    CreatePlayerPage()
end)

StyleButton.MouseButton1Click:Connect(function()
    CreateStylePage()
end)

RageButton.MouseButton1Click:Connect(function()
    CreateRagePage()
end)

--// Part 6 - Rainbow Title, Fade Animation, Key System

-- Rainbow Title Color Effect
spawn(function()
    while task.wait(0.1) do
        TitleLabel.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    end
end)

-- Smooth Fade-In Animation
local FadeInfo = TweenInfo.new(
    1, -- Time
    Enum.EasingStyle.Sine,
    Enum.EasingDirection.Out
)

local FadeGoal = {
    BackgroundTransparency = 0,
    Position = UDim2.new(0.25, 0, 0.25, 0)
}

local FadeTween = TweenService:Create(MainFrame, FadeInfo, FadeGoal)
FadeTween:Play()

-- Key System
local ValidKeys = {
    ["FaheemItsBest"] = true,
    ["Chrollo"] = true,
    ["FaheemPro"] = true,
}

-- Key GUI Frame
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = ScreenGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(220, 210, 250)
KeyFrame.BorderColor3 = Color3.fromRGB(128, 0, 128)
KeyFrame.BorderSizePixel = 2
KeyFrame.Size = UDim2.new(0, 300, 0, 150)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -75)

local KeyBox = Instance.new("TextBox")
KeyBox.Parent = KeyFrame
KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
KeyBox.Position = UDim2.new(0.1, 0, 0.2, 0)
KeyBox.PlaceholderText = "Enter Key Here"
KeyBox.Font = Enum.Font.SourceSans
KeyBox.TextColor3 = Color3.fromRGB(0, 0, 0)
KeyBox.TextScaled = true
KeyBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

local SubmitButton = Instance.new("TextButton")
SubmitButton.Parent = KeyFrame
SubmitButton.Size = UDim2.new(0.8, 0, 0, 40)
SubmitButton.Position = UDim2.new(0.1, 0, 0.6, 0)
SubmitButton.Text = "Submit Key"
SubmitButton.Font = Enum.Font.SourceSansBold
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
SubmitButton.TextScaled = true

SubmitButton.MouseButton1Click:Connect(function()
    if ValidKeys[KeyBox.Text] then
        KeyFrame.Visible = false
        MainFrame.Visible = true

        StarterGui:SetCore("SendNotification", {
            Title = "Chronatic.lua Hub",
            Text = "Welcome, Faheem!",
            Duration = 5
        })
    else
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "Wrong Key! Try Again."
    end
end)

-- Hide MainFrame until Key Correct
MainFrame.Visible = false





