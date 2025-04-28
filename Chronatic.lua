--// Chronatic MS Paint Hub | FINAL EXTENDED VERSION | By Faheem | ★Service Chronotic Ai

local MSPaint = loadstring(game:HttpGet('https://raw.githubusercontent.com/REDzHUB/MSPaintUI/main/MSPaintSource.lua'))()

local Window = MSPaint:CreateWindow({
   Title = "Chronatic MS Paint Hub | Blue Lock: Rivals",
   Theme = "MSPaint", -- Cartoon colorful
})

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StyleTab = Window:CreateTab("Style")

-- Variables
local styleName = ""

--// Section 1: Style Controls
local StyleSection = StyleTab:CreateSection("Style Controls")

StyleSection:CreateInput({
    Name = "Enter Style Name",
    PlaceholderText = "Example: Kaiser, Rin, Kurona",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        styleName = Text
    end,
})

StyleSection:CreateButton({
    Name = "Apply Custom Style",
    Callback = function()
        local player = Players.LocalPlayer
        local stats = player:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = styleName
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = "Style Applied Successfully!",
            Duration = 5
        })
    end,
})

StyleSection:CreateButton({
    Name = "Set Style: NEL Bachira",
    Callback = function()
        local player = Players.LocalPlayer
        local stats = player:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = "NEL Bachira"
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = "Set Style to NEL Bachira Successfully!",
            Duration = 5
        })
    end,
})

StyleSection:CreateButton({
    Name = "Set Style: NEL Isagi",
    Callback = function()
        local player = Players.LocalPlayer
        local stats = player:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = "NEL Isagi"
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = "Set Style to NEL Isagi Successfully!",
            Duration = 5
        })
    end,
})

--// Section 2: Player Settings
local PlayerSection = StyleTab:CreateSection("Player Settings")

PlayerSection:CreateSlider({
    Name = "WalkSpeed",
    Range = {10,150},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Callback = function(Value)
        local player = Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

PlayerSection:CreateButton({
    Name = "Anti Ragdoll",
    Callback = function()
        local player = Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Ragdolled") then
            player.Character.Ragdolled:Destroy()
        end
        player.CharacterAdded:Connect(function(character)
            task.wait(0.5)
            local rag = character:FindFirstChild("Ragdolled")
            if rag then
                rag:Destroy()
            end
        end)
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = "Anti Ragdoll Enabled!",
            Duration = 5
        })
    end,
})

PlayerSection:CreateButton({
    Name = "Anti Breaker",
    Callback = function()
        local player = Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Breaker") then
            player.Character.Breaker:Destroy()
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = "Anti Breaker Enabled!",
            Duration = 5
        })
    end,
})

local InfiniteFlowEnabled = false

PlayerSection:CreateToggle({
    Name = "Infinite Flow",
    CurrentValue = false,
    Callback = function(Value)
        InfiniteFlowEnabled = Value
        if InfiniteFlowEnabled then
            spawn(function()
                while InfiniteFlowEnabled do
                    task.wait(1)
                    local player = Players.LocalPlayer
                    if player and player:FindFirstChild("PlayerStats") then
                        player.PlayerStats.InFlow.Value = true
                    end
                end
            end)
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = InfiniteFlowEnabled and "Infinite Flow Enabled!" or "Infinite Flow Disabled!",
            Duration = 5
        })
    end,
})

--// Section 3: Recommend
local RecommendSection = StyleTab:CreateSection("Recommend")

local NoCooldownEnabled = false
RecommendSection:CreateToggle({
    Name = "No Cooldown Ability",
    CurrentValue = false,
    Callback = function(Value)
        NoCooldownEnabled = Value
        if NoCooldownEnabled then
            local C = require(ReplicatedStorage.Controllers.AbilityController)
            local o = C.AbilityCooldown
            C.AbilityCooldown = function(s, n, ...) return o(s, n, 0, ...) end
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = NoCooldownEnabled and "No Cooldown Enabled!" or "No Cooldown Disabled!",
            Duration = 5
        })
    end,
})

local InfiniteAwakeningEnabled = false
RecommendSection:CreateToggle({
    Name = "Infinite Awakening",
    CurrentValue = false,
    Callback = function(Value)
        InfiniteAwakeningEnabled = Value
        if InfiniteAwakeningEnabled then
            spawn(function()
                while InfiniteAwakeningEnabled do
                    task.wait(1)
                    local player = Players.LocalPlayer
                    local AbilityController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))
                    player.PlayerStats.InAwakening.Value = true
                    AbilityController:UseAbility("Awakening")
                end
            end)
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = InfiniteAwakeningEnabled and "Infinite Awakening Enabled!" or "Infinite Awakening Disabled!",
            Duration = 5
        })
    end,
})

--// Section 4: Protection
local ProtectionSection = StyleTab:CreateSection("Protection")

local AntiKickEnabled = false
ProtectionSection:CreateToggle({
    Name = "Anti Kick (Op Power)",
    CurrentValue = false,
    Callback = function(Value)
        AntiKickEnabled = Value
        if AntiKickEnabled then
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            local old = mt.__namecall
            mt.__namecall = newcclosure(function(self, ...)
                if getnamecallmethod() == "Kick" then
                    warn("★Service Chronotic Ai: Kick Blocked!")
                    return
                end
                return old(self, ...)
            end)
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = AntiKickEnabled and "Anti Kick Enabled!" or "Anti Kick Disabled!",
            Duration = 5
        })
    end,
})

local AntiBanEnabled = false
ProtectionSection:CreateToggle({
    Name = "Anti Ban (Op Power)",
    CurrentValue = false,
    Callback = function(Value)
        AntiBanEnabled = Value
        if AntiBanEnabled then
            spawn(function()
                while AntiBanEnabled do
                    local player = Players.LocalPlayer
                    if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                        player.Character:FindFirstChildOfClass("Humanoid").BreakJointsOnDeath = false
                    end
                    task.wait(1)
                end
            end)
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = AntiBanEnabled and "Anti Ban Enabled!" or "Anti Ban Disabled!",
            Duration = 5
        })
    end,
})

--// Final: Important Reo Note
StyleTab:CreateParagraph({
    Title = "Note:",
    Content = "For the style working please have Reo style!"
})
