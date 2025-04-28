local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/LibraryV2/main/redzLib"))()

local Window = redzlib:MakeWindow({
    Title = "Chronotic Dark Pro Hub",
    SubTitle = "by Faheem",
    Color = Color3.fromRGB(128, 0, 128),
    Background = Color3.fromRGB(0, 0, 0),
    ToggleKey = Enum.KeyCode.RightControl
})

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

local StyleTab = Window:MakeTab({
    Name = "Style",
    Icon = "rbxassetid://7734053494",
    Color = Color3.fromRGB(128, 0, 128)
})

local styleName = ""

StyleTab:CreateTextbox({
    Title = "Enter Style Name",
    Placeholder = "Example: Kaiser, Rin, Kurona",
    Callback = function(text)
        styleName = text
    end
})

StyleTab:CreateButton({
    Title = "Apply Custom Style",
    Callback = function()
        local stats = LocalPlayer:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = styleName
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = "Successfully, Style has been Applied by Chronotic Service System",
            Duration = 5
        })
    end
})

StyleTab:CreateButton({
    Title = "Set Style: NEL Bachira",
    Callback = function()
        local stats = LocalPlayer:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = "NEL Bachira"
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = "Successfully, Style has been Applied by Chronotic Service System",
            Duration = 5
        })
    end
})

StyleTab:CreateButton({
    Title = "Set Style: NEL Isagi",
    Callback = function()
        local stats = LocalPlayer:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = "NEL Isagi"
        end
        StarterGui:SetCore("SendNotification", {
            Title = "★Service Chronotic Ai",
            Text = "Successfully, Style has been Applied by Chronotic Service System",
            Duration = 5
        })
    end
})

StyleTab:CreateParagraph({
    Title = "Important Note:",
    Content = "To properly use the styles and abilities, you must have Reo as your current style."
})
