local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Blue Lock: Rivals | Glorious Emperor's Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Glorious Emperor's Hub Interface..",
   LoadingSubtitle = "Made By Faheem",
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = Kaiser-- Create a custom folder for your hub/game
      FileName = "Emperor's Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "discord.user/foxlowx", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Keysystem",
      Subtitle = "Get system by completely the  link below..",
      Note = "For Glorious Emperor's Hub link should not be take last long!", -- Use this to tell the user how to get a key
      FileName = "Ketse", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = https://pastefy.app/LZ2bAcGv/raw, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"StrongerGloriusKey_a9b2Kd*7Lm&pQx!R3zEw#Fv6Cy$tUj%oHn^iS1gBk(4Dr)Ym<5Ws>qZf{0Xu}jTc[8Vb]lN-2Po+9Gh;sA/eJ:"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Get Style",
   Callback = function()
     game.Players.LocalPlayer.PlayerStats.Style.Value = styleName
   end,
})
-- Style List
local styles = {
    "Isagi", "Chigiri", "Bachira", "Igaguri", "Hiori", "Otoya", "Reo",
    "Karasu", "Nagi", "Kurona", "King", "Rin", "Yukimiya", "Kunigami", "Shidou",
    "Sae", "Don Lorenzo", "Kaiser", "NEL Isagi"
}

-- Create Style Buttons
for _, style in ipairs(styles) do
    createStyleButton(style)
end

local Button = Tab:CreateButton({
   Name = "Reset Style",
   Callback = function()
     game.Players.LocalPlayer.PlayerStats.Style.Value = "Default"
   end,
})

local Tab = Window:CreateTab("Flow Maintenance", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Note!!",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})

local Button = Tab:CreateButton({
   Name = "!Read This! To use Maintained Flow You Must Active the buttons bellows!",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})

local Button = Tab:CreateButton({
   Name = "Flow Activation Function",
   Callback = function()
     local function activateFlow(flowName)
    game.Players.LocalPlayer.PlayerStats.Flow.Value = flowName
    game.Players.LocalPlayer.PlayerStats.inFlow.Value = true
         end
   end,
})

Rayfield:Notify({
   Title = "Flow Activation Function Has Been !ACTIVe!",
   Content = "Successfully Applied By Gemini!",
   Duration = 6.5,
   Image = "badge-alert",
})

-- Flow List
local flows = {
    "Prodigy",
    "Awakened Genius",
    "Dribbler",
    "Snake",
    "Ice",
    "Soul Harvester",
    "Wild Card"
}

for _, flow in ipairs(flows) do
   local Button = Flow Maintenance:CreateButton({
   Name = "Activated Flow",
   Callback = function()
     activateFlow(flow)
   end,
})

local Section = Tab:CreateSection("Flow Management")

local Toggle = Tab:CreateToggle({
   Name = "Maintain Flow State",
   CurrentValue = false,
   Flag = "StateFlow", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     game.Players.LocalPlayer.PlayerStats.inFlow.Value = value
   end,
})

local Button = Tab:CreateButton({
   Name = "Reset Flow",
   Callback = function()
     game.Players.LocalPlayer.PlayerStats.Flow.Value = "None"
        game.Players.LocalPlayer.PlayerStats.inFlow.Value = false
   end,
})

