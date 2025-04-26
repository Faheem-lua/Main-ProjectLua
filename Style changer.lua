local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the Main Window
local Window = Rayfield:CreateWindow({
    Name = "Style & Flow Changed | Blue Loc: Rivals",
    LoadingTitle = "Welcome to Faheem Alpha script..",
    LoadingSubtitle = "Style and Flow Management",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "RayfieldConfigs", -- Folder to save configurations
        FileName = "StyleFlowSettings"
    },
    KeySystem = true,
    KeySettings = {
        Title = "Authentication Required",
        Subtitle = "Enter your key to access",
        Note = "Key its supported ",
        FileName = "UserKey",
        SaveKey = true, -- Save key locally for convenience
        GrabKeyFromSite = false,
        Key = {"say"}
    }
})

-- Create the Styles Tab
local StylesTab = Window:CreateTab("Styles", 4483362458)

-- Function to Dynamically Create Style Buttons
local function createStyleButton(styleName)
    StylesTab:CreateButton({
        Name = "Select style!" .. styleName,
        Callback = function()
            game.Players.LocalPlayer.PlayerStats.Style.Value = styleName
        end
    })
end

-- List of Available Styles
local styles = {
    "Aiku", "Bachira", "Chigiri", "Don Lorenzo", "Gagamaru", "Hiori", "Isagi",
    "Karasu", "King", "Kunigami", "Nagi", "Otoya", "Rin", "Reo", "Sae",
    "Shidou", "Yukimiya", "Kurona", "NEL Isagi"
}

-- Generate Buttons for Each Style
for _, style in ipairs(styles) do
    createStyleButton(style)
end

-- Reset Style to Default
StylesTab:CreateButton({
    Name = "Reset to Default Style",
    Callback = function()
        game.Players.LocalPlayer.PlayerStats.Style.Value = "Default"
    end
})

-- Create the Flow Tab
local FlowTab = Window:CreateTab("Flow", 4483362458)

-- Function to Activate a Flow
local function activateFlow(flowName)
    game.Players.LocalPlayer.PlayerStats.Flow.Value = flowName
    game.Players.LocalPlayer.PlayerStats.inFlow.Value = true
end

-- List of Available Flows
local flows = {
    "Prodigy", "Awakened Genius", "Dribbler", "Snake", "Ice", "Soul Harvester", "Wild Card"
}

-- Generate Buttons for Each Flow
for _, flow in ipairs(flows) do
    FlowTab:CreateButton({
        Name = "Activate " .. flow,
        Callback = function()
            activateFlow(flow)
        end
    })
end

-- Add Flow Management Section
FlowTab:CreateSection("Flow Management")

-- Toggle to Maintain Flow State
FlowTab:CreateToggle({
    Name = "Keep Flow Always Active",
    CurrentValue = true,
    Callback = function(value)
        game.Players.LocalPlayer.PlayerStats.inFlow.Value = value
    end
})

-- Reset Flow
FlowTab:CreateButton({
    Name = "Reset Flow",
    Callback = function()
        game.Players.LocalPlayer.PlayerStats.Flow.Value = "None"
        game.Players.LocalPlayer.PlayerStats.inFlow.Value = false
    end
})
