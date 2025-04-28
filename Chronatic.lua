--// Chronotic Dark Pro Hub | Simple Fluent UI | Section 1 Only

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

-- Final: Note
StyleTab:AddParagraph({
    Title = "Note:",
    Content = "For the style working please have Reo style!"
})
