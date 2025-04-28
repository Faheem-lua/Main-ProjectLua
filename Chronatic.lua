--// Part 1 - Load RedzLib and Create Main Window (Faheem Only)

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
    Title = "Chronatic Dark Pro Hub | Blye lock: Rivals",
    SubTitle = "Made by Faheem",
    Color = Color3.fromRGB(128, 0, 128), -- Purple Corners
    Background = Color3.fromRGB(0, 0, 0), -- Full Black Background
    ToggleKey = Enum.KeyCode.RightControl
})

--// Part 2 - Create Tabs

local ReadTab = Window:MakeTab({
    Name = "Read",
    Icon = "rbxassetid://7734053494", -- book icon
    Color = Color3.fromRGB(128, 0, 128)
})

local StyleTab = Window:MakeTab({
    Name = "Style",
    Icon = "rbxassetid://7734053494", -- same book icon
    Color = Color3.fromRGB(128, 0, 128)
})

--// Create Useful Tab

local UsefullTab = Window:MakeTab({
    Name = "Usefull",
    Icon = "rbxassetid://7734053494", -- same book icon
    Color = Color3.fromRGB(128, 0, 128)
})

--// Create Credits Tab

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://7734053494",
    Color = Color3.fromRGB(128, 0, 128)
})

--// Part 3 - Read Tab Content

ReadTab:CreateLabel({
    Title = "Welcome to Chronatic Hub!",
    Description = "Made by Faheem"
})

ReadTab:CreateParagraph({
    Title = "How to Use:",
    Content = "This Hub is for changing your Style easily.\n\nUse the Style Tab to type any style you want.\n\nExample: Kaiser, Rin, NEL Isagi, etc."
})

ReadTab:CreateParagraph({
    Title = "Reminder:",
    Content = "[Important]: After changing Style, you must rejoin the game to refresh Skills!"
})

--// Updated Part 4 - Style Tab Full Setup (Textbox + Quick Buttons)

local styleName = ""

StyleTab:CreateTextbox({
    Title = "Enter Style Name",
    Placeholder = "Example: Kaiser, Rin, NEL Isagi",
    Callback = function(text)
        styleName = text
    end
})

StyleTab:CreateButton({
    Title = "Apply Custom Style",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local stats = player:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = styleName
        end
    end
})

StyleTab:CreateButton({
    Title = "Set Style: NEL Isagi",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local stats = player:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = "NEL Isagi"
        end
    end
})

StyleTab:CreateButton({
    Title = "Set Style: NEL Bachira",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local stats = player:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = "NEL Bachira"
        end
    end
})

StyleTab:CreateParagraph({
    Title = "Note:",
    Content = "[Important]: This its Unobtainable Style In textBox, you must have reo for the skills working!"
})

--// Useful Tab - Anti Kick Button

UsefullTab:CreateButton({
    Title = "Enable Anti Kick",
    Callback = function()
        local mt = getrawmetatable(game)
        setreadonly(mt, false)

        local old = mt.__namecall

        mt.__namecall = newcclosure(function(self, ...)
            local args = {...}
            if getnamecallmethod() == "Kick" then
                warn("Faheem Kick Bypass: Prevented kick attempt!")
                return
            end
            return old(self, unpack(args))
        end)

        print(">> Faheem Kick Bypass Loaded Successfully!")
    end
})

--// Useful Tab - Infinite Awakening Button

UsefullTab:CreateButton({
    Title = "Enable Infinite Awakening",
    Callback = function()
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local LocalPlayer = Players.LocalPlayer

        local AbilityController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))

        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "AwakeningGUI"
        ScreenGui.Parent = game.CoreGui

        local Frame = Instance.new("Frame")
        Frame.Parent = ScreenGui
        Frame.Size = UDim2.new(0, 150, 0, 50)
        Frame.Position = UDim2.new(0, 20, 0, 200)
        Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Frame.BorderSizePixel = 0

        local Button = Instance.new("TextButton")
        Button.Parent = Frame
        Button.Size = UDim2.new(1, 0, 1, 0)
        Button.Text = "Force Awakening"
        Button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Font = Enum.Font.GothamBold
        Button.TextScaled = true

        local ForceAwakening = false
        local StyleToForce = "Kaiser" -- or "King", "Kurona"

        Button.MouseButton1Click:Connect(function()
            ForceAwakening = not ForceAwakening
            if ForceAwakening then
                Button.Text = "Awakening ON"
            else
                Button.Text = "Awakening OFF"
            end
        end)

        spawn(function()
            while task.wait(1) do
                if ForceAwakening then
                    LocalPlayer.PlayerStats.Style.Value = StyleToForce
                    if (StyleToForce == "Kaiser") or (StyleToForce == "King") or (StyleToForce == "Kurona") then
                        LocalPlayer.PlayerStats.InAwakening.Value = true
                    end
                    AbilityController:UseAbility("Awakening")
                end
            end
        end)

        print(">> Infinite Awakening Loaded Successfully!")
    end
})

--// Useful Tab - No Cooldown Ability (Short Version)

UsefullTab:CreateButton({
    Title = "Enable No Cooldown Ability",
    Callback = function()
        local C = require(game:GetService("ReplicatedStorage").Controllers.AbilityController)
        local o = C.AbilityCooldown
        C.AbilityCooldown = function(s, n, ...) return o(s, n, 0, ...) end

        print(">> No Cooldown Ability Activated (Short Version)!")
    end
})

--// Create Credits Tab

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://7734053494",
    Color = Color3.fromRGB(128, 0, 128)
})

--// Credits Content (Button)

CreditsTab:CreateButton({
    Title = "This GUI made by RedzHubV5",
    Callback = function()
        -- No action when pressed (just a note)
    end
})

--// Credits Tab Setup with Two Buttons

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://7734053494",
    Color = Color3.fromRGB(128, 0, 128)
})

CreditsTab:CreateButton({
    Title = "This GUI made by RedzHubV5",
    Callback = function()
        -- No action (display only)
    end
})

CreditsTab:CreateButton({
    Title = "Made by Faheem",
    Callback = function()
        -- No action (display only)
    end
})

-- Improve if you want 101jackniku just dont make problem





