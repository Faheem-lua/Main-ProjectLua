--// Chronatic.lua Pro Dark Edition by Faheem

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local Camera = workspace.CurrentCamera

-- Main UI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ChronaticHub"
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black Background
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0) -- Red Border
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.25, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BackgroundTransparency = 1 -- for fade-in animation

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TitleBar.Size = UDim2.new(1, 0, 0, 40)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TitleBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.Text = "Chronatic.lua PRO DARK"
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextScaled = true
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Tabs Frame
local TabsFrame = Instance.new("Frame")
TabsFrame.Parent = MainFrame
TabsFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TabsFrame.Position = UDim2.new(0, 10, 0, 50)
TabsFrame.Size = UDim2.new(0, 120, 1, -60)
TabsFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ContentFrame.Position = UDim2.new(0, 140, 0, 50)
ContentFrame.Size = UDim2.new(1, -150, 1, -60)
ContentFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)

--// Part 2 - Tab Buttons Setup

local function CreateTabButton(name, positionY)
    local button = Instance.new("TextButton")
    button.Parent = TabsFrame
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = UDim2.new(0, 0, 0, positionY)
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black base
    button.BorderColor3 = Color3.fromRGB(255, 0, 0) -- Red border
    button.Text = name
    button.Font = Enum.Font.SourceSansBold
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextScaled = true

    -- Red Hover Effect
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    end)

    return button
end

-- Creating all Tab Buttons
local HomeButton = CreateTabButton("Home", 0)
local FunButton = CreateTabButton("Fun", 50)
local MiscButton = CreateTabButton("Misc", 100)
local PlayerButton = CreateTabButton("Player", 150)
local StyleButton = CreateTabButton("Style", 200)
local RageButton = CreateTabButton("Rage", 250)

--// Part 3 - Page Functions Setup

-- Clear old page content
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
    HomeLabel.BackgroundTransparency = 1
    HomeLabel.Text = "Welcome to Chronatic.lua DARK!"
    HomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    HomeLabel.Font = Enum.Font.SourceSansBold
    HomeLabel.TextScaled = true

    local CreditsLabel = Instance.new("TextLabel")
    CreditsLabel.Parent = ContentFrame
    CreditsLabel.Size = UDim2.new(1, 0, 0, 40)
    CreditsLabel.Position = UDim2.new(0, 0, 0, 60)
    CreditsLabel.BackgroundTransparency = 1
    CreditsLabel.Text = "Made by Faheem & ChatGPT 2025"
    CreditsLabel.TextColor3 = Color3.fromRGB(200, 0, 0)
    CreditsLabel.Font = Enum.Font.SourceSansItalic
    CreditsLabel.TextScaled = true
end

-- Fun Page (Ball ESP)
local function CreateFunPage()
    ClearContent()

    local FunButton = Instance.new("TextButton")
    FunButton.Parent = ContentFrame
    FunButton.Size = UDim2.new(0, 250, 0, 50)
    FunButton.Position = UDim2.new(0, 20, 0, 20)
    FunButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    FunButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
    FunButton.Text = "Enable Ball ESP"
    FunButton.Font = Enum.Font.SourceSansBold
    FunButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    FunButton.TextScaled = true

    FunButton.MouseEnter:Connect(function()
        FunButton.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    end)
    FunButton.MouseLeave:Connect(function()
        FunButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    end)

    FunButton.MouseButton1Click:Connect(function()
        local ball = workspace:FindFirstChild("Ball")
        if ball then
            local highlight = Instance.new("Highlight")
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
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
    RagdollButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    RagdollButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
    RagdollButton.Text = "Anti-Ragdoll"
    RagdollButton.Font = Enum.Font.SourceSansBold
    RagdollButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    RagdollButton.TextScaled = true

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
    BreakerButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    BreakerButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
    BreakerButton.Text = "Anti-Breaker"
    BreakerButton.Font = Enum.Font.SourceSansBold
    BreakerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    BreakerButton.TextScaled = true

    BreakerButton.MouseButton1Click:Connect(function()
        local char = Players.LocalPlayer.Character
        if char:FindFirstChild("Breaker") then
            char.Breaker:Destroy()
        end
    end)
end

--// Part 4 - Full Proper Pages Setup (Player, Style, Rage)

-- Player Tab Page (Speed Hack + Fly Mode)
local function CreatePlayerPage()
    ClearContent()

    local SpeedButton = Instance.new("TextButton")
    SpeedButton.Parent = ContentFrame
    SpeedButton.Size = UDim2.new(0, 250, 0, 40)
    SpeedButton.Position = UDim2.new(0, 20, 0, 20)
    SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    SpeedButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
    SpeedButton.Text = "Speed Hack (100 WalkSpeed)"
    SpeedButton.Font = Enum.Font.SourceSansBold
    SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedButton.TextScaled = true

    SpeedButton.MouseButton1Click:Connect(function()
        Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end)

    local FlyButton = Instance.new("TextButton")
    FlyButton.Parent = ContentFrame
    FlyButton.Size = UDim2.new(0, 250, 0, 40)
    FlyButton.Position = UDim2.new(0, 20, 0, 80)
    FlyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    FlyButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
    FlyButton.Text = "Fly Mode Toggle"
    FlyButton.Font = Enum.Font.SourceSansBold
    FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    FlyButton.TextScaled = true

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
                    if bodyVelocity then
                        bodyVelocity:Destroy()
                    end
                end
            end)
        end
    end)
end

-- Style Tab Page (Textbox Style Changer)
local function CreateStylePage()
    ClearContent()

    local StyleBox = Instance.new("TextBox")
    StyleBox.Parent = ContentFrame
    StyleBox.Size = UDim2.new(0, 250, 0, 40)
    StyleBox.Position = UDim2.new(0, 20, 0, 20)
    StyleBox.PlaceholderText = "Type Style Name Here..."
    StyleBox.Font = Enum.Font.SourceSans
    StyleBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    StyleBox.TextScaled = true
    StyleBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

    local ApplyButton = Instance.new("TextButton")
    ApplyButton.Parent = ContentFrame
    ApplyButton.Size = UDim2.new(0, 250, 0, 40)
    ApplyButton.Position = UDim2.new(0, 20, 0, 80)
    ApplyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ApplyButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
    ApplyButton.Text = "Apply Style"
    ApplyButton.Font = Enum.Font.SourceSansBold
    ApplyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ApplyButton.TextScaled = true

    ApplyButton.MouseButton1Click:Connect(function()
        local styleName = StyleBox.Text
        local stats = Players.LocalPlayer:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = styleName
        end
    end)
end

-- Rage Tab Page (Coming Soon)
local function CreateRagePage()
    ClearContent()

    local RageLabel = Instance.new("TextLabel")
    RageLabel.Parent = ContentFrame
    RageLabel.Size = UDim2.new(1, 0, 0, 50)
    RageLabel.Position = UDim2.new(0, 0, 0, 0)
    RageLabel.BackgroundTransparency = 1
    RageLabel.Text = "Rage Tab (Coming Soon!)"
    RageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    RageLabel.Font = Enum.Font.SourceSansBold
    RageLabel.TextScaled = true
end

--// Part 5 - Connect Tab Buttons to Their Pages

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



