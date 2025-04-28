--// Chronotic Dark Pro Hub | Fluent UI | King Faheem Special

local Fluent = loadstring(game:HttpGet("https://github.com/REDzHUB/FluentUI/raw/main/Source.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Chronotic Dark Pro",
    SubTitle = "by Faheem",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 400),
    Acrylic = true,
    Theme = "Dark"
})

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local StyleTab = Window:AddTab({ Name = "Style" })

-- Variables
local styleName = ""

--// Section 1: Style Controls
local StyleSection = StyleTab:AddSection("Style Controls")

StyleSection:AddTextbox({
    Name = "Enter Style Name",
    Default = "",
    Placeholder = "Example: Kaiser, Rin, Kurona",
    Callback = function(Text)
        styleName = Text
    end,
})

StyleSection:AddButton({
    Name = "Apply Custom Style",
    Callback = function()
        local stats = LocalPlayer:FindFirstChild("PlayerStats")
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

StyleSection:AddButton({
    Name = "Set Style: NEL Bachira",
    Callback = function()
        local stats = LocalPlayer:FindFirstChild("PlayerStats")
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

StyleSection:AddButton({
    Name = "Set Style: NEL Isagi",
    Callback = function()
        local stats = LocalPlayer:FindFirstChild("PlayerStats")
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
local PlayerSection = StyleTab:AddSection("Player Settings")

PlayerSection:AddSlider({
    Name = "WalkSpeed",
    Min = 10,
    Max = 150,
    Default = 16,
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

PlayerSection:AddButton({
    Name = "Anti Ragdoll",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Ragdolled") then
            LocalPlayer.Character.Ragdolled:Destroy()
        end
        LocalPlayer.CharacterAdded:Connect(function(character)
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

PlayerSection:AddButton({
    Name = "Anti Breaker",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Breaker") then
            LocalPlayer.Character.Breaker:Destroy()
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = "Anti Breaker Enabled!",
            Duration = 5
        })
    end,
})

local InfiniteFlowEnabled = false

PlayerSection:AddToggle({
    Name = "Infinite Flow",
    Default = false,
    Callback = function(Value)
        InfiniteFlowEnabled = Value
        if InfiniteFlowEnabled then
            spawn(function()
                while InfiniteFlowEnabled do
                    task.wait(1)
                    if LocalPlayer and LocalPlayer:FindFirstChild("PlayerStats") then
                        LocalPlayer.PlayerStats.InFlow.Value = true
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
local RecommendSection = StyleTab:AddSection("Recommend")

RecommendSection:AddToggle({
    Name = "No Cooldown Ability",
    Default = false,
    Callback = function(Value)
        if Value then
            local C = require(ReplicatedStorage.Controllers.AbilityController)
            local o = C.AbilityCooldown
            C.AbilityCooldown = function(s, n, ...) return o(s, n, 0, ...) end
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = Value and "No Cooldown Enabled!" or "No Cooldown Disabled!",
            Duration = 5
        })
    end,
})

RecommendSection:AddToggle({
    Name = "Infinite Awakening",
    Default = false,
    Callback = function(Value)
        if Value then
            spawn(function()
                while Value do
                    task.wait(1)
                    local AbilityController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))
                    LocalPlayer.PlayerStats.InAwakening.Value = true
                    AbilityController:UseAbility("Awakening")
                end
            end)
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = Value and "Infinite Awakening Enabled!" or "Infinite Awakening Disabled!",
            Duration = 5
        })
    end,
})

--// Section 4: Protection
local ProtectionSection = StyleTab:AddSection("Protection")

ProtectionSection:AddToggle({
    Name = "Anti Kick (Op Power)",
    Default = false,
    Callback = function(Value)
        if Value then
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
            Text = Value and "Anti Kick Enabled!" or "Anti Kick Disabled!",
            Duration = 5
        })
    end,
})

ProtectionSection:AddToggle({
    Name = "Anti Ban (Op Power)",
    Default = false,
    Callback = function(Value)
        if Value then
            spawn(function()
                while Value do
                    if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").BreakJointsOnDeath = false
                    end
                    task.wait(1)
                end
            end)
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = Value and "Anti Ban Enabled!" or "Anti Ban Disabled!",
            Duration = 5
        })
    end,
})

-- Final Note about Reo
StyleTab:AddParagraph({
    Title = "Note:",
    Content = "For the style working please have Reo style!"
})
