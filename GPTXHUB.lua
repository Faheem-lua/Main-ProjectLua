--// Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

--// Create Window
local Window = Rayfield:CreateWindow({
    Name = "GPT ⚡ X Hub",
    LoadingTitle = "GPT ⚡ X Hub",
    LoadingSubtitle = "Made specially for Faheem",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "GPTXHub",
        FileName = "FaheemConfig"
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false,
})

--// Tabs
local MainTab = Window:CreateTab("Main™", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)
local FunTab = Window:CreateTab("Fun", 4483362458)
local RageTab = Window:CreateTab("Rage", 4483362458)
local StyleTab = Window:CreateTab("Style Changer", 4483362458)

--// MAIN TAB - LocalPlayer Section
local LocalPlayerSection = MainTab:CreateSection("LocalPlayer")

LocalPlayerSection:CreateButton({
    Name = "No Cooldown Script",
    Callback = function()
        local C = require(game:GetService("ReplicatedStorage").Controllers.AbilityController)
        local o = C.AbilityCooldown
        C.AbilityCooldown = function(s, n, ...) return o(s, n, 0, ...) end
        Rayfield:Notify({
            Title = "NoCooldown Enabled",
            Content = "Cooldowns are now removed!",
            Duration = 5,
            Image = 4483362458,
            Actions = { Ignore = { Name = "Okay", Callback = function() end } }
        })
    end,
})

LocalPlayerSection:CreateButton({
    Name = "Infinite Awakening",
    Callback = function()
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local LocalPlayer = Players.LocalPlayer
        local AbilityController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))
        
        Rayfield:Notify({
            Title = "InfAwakening",
            Content = "Infinite Awakening Activated!",
            Duration = 5,
            Image = 4483362458,
            Actions = { Ignore = { Name = "Okay", Callback = function() end } }
        })

        spawn(function()
            while task.wait(1) do
                LocalPlayer.PlayerStats.InAwakening.Value = true
                AbilityController:UseAbility("Awakening")
            end
        end)
    end,
})

--// MISC TAB
local MiscSection = MiscTab:CreateSection("Utilities")

MiscSection:CreateButton({
    Name = "Noclip",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        game:GetService("RunService").Stepped:Connect(function()
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
        Rayfield:Notify({
            Title = "Noclip Enabled",
            Content = "You can walk through everything!",
            Duration = 5,
        })
    end,
})

MiscSection:CreateButton({
    Name = "Anti Ragdoll",
    Callback = function()
        for _,v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("Constraint") then
                v:Destroy()
            end
        end
        Rayfield:Notify({
            Title = "Anti-Ragdoll",
            Content = "No ragdoll effects anymore!",
            Duration = 5,
        })
    end,
})

--// FUN TAB
local FunSection = FunTab:CreateSection("Fun Stuff")

FunSection:CreateButton({
    Name = "Give Ball (Force Pickup)",
    Callback = function()
        local args = {
            [1] = workspace.Balls:FindFirstChildOfClass("Part")
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("GetBall"):FireServer(unpack(args))
        Rayfield:Notify({
            Title = "Ball Grabbed!",
            Content = "Ball is now with you!",
            Duration = 5,
        })
    end,
})

--// RAGE TAB - (Coming soon)

--// STYLE CHANGER TAB
local StyleChangerSection = StyleTab:CreateSection("Change Your Style")

StyleChangerSection:CreateDropdown({
    Name = "Choose Style",
    Options = {
        "NEL Isagi: Direct Shot",
        "NEL Bachira: Monster",
        "Kunigami: Power Shot",
        "Nagi: Genius Trapper",
        "Baro: King",
        "Rin: Calculated Precision",
        "Sae: Maestro",
        "Kaiser: Emperor's Vision",
        "Lorenzo: Shadow Defense",
        "Shidou: Wild Card",
    },
    CurrentOption = "NEL Isagi: Direct Shot",
    Callback = function(StyleChosen)
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        if LocalPlayer:FindFirstChild("PlayerStats") then
            LocalPlayer.PlayerStats.Style.Value = StyleChosen
            Rayfield:Notify({
                Title = "Style Changed!",
                Content = "Now using: " .. StyleChosen,
                Duration = 5,
            })
        end
    end,
})

--// Final Notification
Rayfield:Notify({
    Title = "GPT ⚡ X Hub",
    Content = "Successfully Loaded! Enjoy Faheem bhai!",
    Duration = 7,
    Image = 4483362458,
    Actions = { Ignore = { Name = "Thanks", Callback = function() end } }
})
