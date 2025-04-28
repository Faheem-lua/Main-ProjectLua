--// Chronatic Dark Pro Hub - Fixed Final Version

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
    Title = "Chronatic Dark Pro Hub | Blue Lock: Rivals",
    SubTitle = "Made by Faheem",
    Color = Color3.fromRGB(128, 0, 128), -- Purple Corners
    Background = Color3.fromRGB(0, 0, 0), -- Full Black Background
    ToggleKey = Enum.KeyCode.RightControl
})

-- Tabs
local ReadTab = Window:MakeTab({
    Name = "Read",
    Icon = "rbxassetid://7734053494",
    Color = Color3.fromRGB(128, 0, 128)
})

local StyleTab = Window:MakeTab({
    Name = "Style",
    Icon = "rbxassetid://7734053494",
    Color = Color3.fromRGB(128, 0, 128)
})

local UsefulTab = Window:MakeTab({
    Name = "Useful",
    Icon = "rbxassetid://7734053494",
    Color = Color3.fromRGB(128, 0, 128)
})

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://7734053494",
    Color = Color3.fromRGB(128, 0, 128)
})

-- Read Tab
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

-- Style Tab
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
        local player = Players.LocalPlayer
        local stats = player:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = styleName
        end
        StarterGui:SetCore("SendNotification", {
            Title = "Chronatic Hub",
            Text = "Successfully Applied by Faheem!",
            Duration = 5
        })
    end
})

StyleTab:CreateButton({
    Title = "Set Style: NEL Isagi",
    Callback = function()
        local player = Players.LocalPlayer
        local stats = player:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = "NEL Isagi"
        end
        StarterGui:SetCore("SendNotification", {
            Title = "Chronatic Hub",
            Text = "Successfully Applied by Faheem!",
            Duration = 5
        })
    end
})

StyleTab:CreateButton({
    Title = "Set Style: NEL Bachira",
    Callback = function()
        local player = Players.LocalPlayer
        local stats = player:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = "NEL Bachira"
        end
        StarterGui:SetCore("SendNotification", {
            Title = "Chronatic Hub",
            Text = "Successfully Applied by Faheem!",
            Duration = 5
        })
    end
})

StyleTab:CreateParagraph({
    Title = "Note:",
    Content = "[Important]: This is an Unobtainable Style. You must rejoin for the skills to work!"
})

-- Useful Tab
UsefulTab:CreateButton({
    Title = "Enable Anti Kick",
    Callback = function()
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local old = mt.__namecall
        mt.__namecall = newcclosure(function(self, ...)
            if getnamecallmethod() == "Kick" then
                warn("Faheem Kick Bypass: Prevented kick attempt!")
                return
            end
            return old(self, ...)
        end)

        StarterGui:SetCore("SendNotification", {
            Title = "Chronatic Hub",
            Text = "Successfully Applied by Faheem!",
            Duration = 5
        })
    end
})

UsefulTab:CreateButton({
    Title = "Enable Infinite Awakening",
    Callback = function()
        local AbilityController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))
        local LocalPlayer = Players.LocalPlayer

        local ScreenGui = Instance.new("ScreenGui", CoreGui)
        ScreenGui.Name = "AwakeningGUI"

        local Frame = Instance.new("Frame", ScreenGui)
        Frame.Size = UDim2.new(0, 150, 0, 50)
        Frame.Position = UDim2.new(0, 20, 0, 200)
        Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

        local Button = Instance.new("TextButton", Frame)
        Button.Size = UDim2.new(1, 0, 1, 0)
        Button.Text = "Force Awakening"
        Button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Font = Enum.Font.GothamBold
        Button.TextScaled = true

        local ForceAwakening = false
        local StyleToForce = "Kaiser"

        Button.MouseButton1Click:Connect(function()
            ForceAwakening = not ForceAwakening
            if ForceAwakening then
                Button.Text = "Awakening ON"
            else
                Button.Text = "Awakening OFF"
            end
        end)

        task.spawn(function()
            while task.wait(1) do
                if ForceAwakening then
                    LocalPlayer.PlayerStats.Style.Value = StyleToForce
                    LocalPlayer.PlayerStats.InAwakening.Value = true
                    AbilityController:UseAbility("Awakening")
                end
            end
        end)

        StarterGui:SetCore("SendNotification", {
            Title = "Chronatic Hub",
            Text = "Successfully Applied by Faheem!",
            Duration = 5
        })
    end
})

UsefulTab:CreateButton({
    Title = "Enable No Cooldown Ability",
    Callback = function()
        local C = require(ReplicatedStorage.Controllers.AbilityController)
        local o = C.AbilityCooldown
        C.AbilityCooldown = function(s, n, ...) return o(s, n, 0, ...) end

        StarterGui:SetCore("SendNotification", {
            Title = "Chronatic Hub",
            Text = "Successfully Applied by Faheem!",
            Duration = 5
        })
    end
})

-- Credits Tab
CreditsTab:CreateButton({
    Title = "This GUI made by RedzHubV5",
    Callback = function()
    end
})

CreditsTab:CreateButton({
    Title = "Made by Faheem",
    Callback = function()
    end
})
