local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Chronotic Dark Pro",
    LoadingTitle = "Chronotic Dark Pro",
    LoadingSubtitle = "By Faheem",
    Theme = "Amethyst",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ChronoticConfig",
        FileName = "ChronoticSave"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

-- Tab 1: Style
local StyleTab = Window:CreateTab("Style", 4483362458)

local styleName = ""

StyleTab:CreateInput({
    Name = "Enter Style Name",
    PlaceholderText = "Example: Kaiser, Rin, Kurona",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        styleName = Text
    end
})

StyleTab:CreateButton({
    Name = "Apply Custom Style",
    Callback = function()
        local stats = game.Players.LocalPlayer:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = styleName
        end
        Rayfield:Notify({
            Title = "★Chronotic AI Service",
            Content = "Successfully applied custom style!",
            Duration = 5
        })
    end
})

StyleTab:CreateButton({
    Name = "GET NEL Bachira Style",
    Callback = function()
        local stats = game.Players.LocalPlayer:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = "NEL Bachira"
        end
        Rayfield:Notify({
            Title = "★Chronotic AI Service",
            Content = "Successfully set NEL Bachira Style!",
            Duration = 5
        })
    end
})

StyleTab:CreateButton({
    Name = "GET NEL Isagi Style",
    Callback = function()
        local stats = game.Players.LocalPlayer:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = "NEL Isagi"
        end
        Rayfield:Notify({
            Title = "★Chronotic AI Service",
            Content = "Successfully set NEL Isagi Style!",
            Duration = 5
        })
    end
})

-- Add Paragraph under buttons
StyleTab:CreateParagraph({
    Title = "Important Note:",
    Content = "To the skills working, you need Style Reo to work!"
})

-- Tab 2: Recommend
local RecommendTab = Window:CreateTab("Recommend", 4483362458)

RecommendTab:CreateButton({
    Name = "Enable Infinite Awakening (No Force Style)",
    Callback = function()
        local AbilityController = require(game:GetService("ReplicatedStorage"):WaitForChild("Controllers"):WaitForChild("AbilityController"))
        spawn(function()
            while true do
                task.wait(1)
                game.Players.LocalPlayer.PlayerStats.InAwakening.Value = true
                AbilityController:UseAbility("Awakening")
            end
        end)
        Rayfield:Notify({
            Title = "★Chronotic AI Service",
            Content = "Infinite Awakening Activated!",
            Duration = 5
        })
    end
})

RecommendTab:CreateButton({
    Name = "Enable No Cooldown Ability",
    Callback = function()
        local C = require(game:GetService("ReplicatedStorage").Controllers.AbilityController)
        local o = C.AbilityCooldown
        C.AbilityCooldown = function(s, n, ...) return o(s, n, 0, ...) end
        Rayfield:Notify({
            Title = "★Chronotic AI Service",
            Content = "No Cooldown Activated!",
            Duration = 5
        })
    end
})

RecommendTab:CreateButton({
    Name = "Enable Anti Kick OP Power Guardian",
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
        Rayfield:Notify({
            Title = "★Chronotic AI Service",
            Content = "Anti Kick OP Guardian Activated!",
            Duration = 5
        })
    end
})
