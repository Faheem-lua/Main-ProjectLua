local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Blue Lock: Rivals | YETAHUB v2",
   Icon = 7734053494, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Yeta Hub is its on load..",
   LoadingSubtitle = "Made by Faheem X YetaHub Owner",
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = Chronotic, -- Create a custom folder for your hub/game
      FileName = "Strikes"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/Ua9Wxs8W", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "YetaHub Key System Service",
      Subtitle = "Authentication Service",
      Note = "To get the key you must join the discord!", -- Use this to tell the user how to get a key
      FileName = "Key5", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Yetahubv28_wXyZ01aBcD"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

-- Create Tab 1: Get Styles
local GetStyleTab = Window:CreateTab("Get Styles", "sparkles") -- Lucide icon

-- Create Tab 2: Recommend
local RecommendTab = Window:CreateTab("Recommend", "star") -- Lucide icon

local GetStyleTab = Window:CreateTab("Get Styles", "sparkles")

local StyleSection = GetStyleTab:CreateSection("Style Customization")

local styleName = ""

StyleSection:CreateInput({
   Name = "Style Changer",
   PlaceholderText = "Example: Kaiser, Kurona, Rin",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      styleName = Text
   end
})

StyleSection:CreateButton({
   Name = "Apply Style",
   Callback = function()
      local stats = game.Players.LocalPlayer:FindFirstChild("PlayerStats")
      if stats and stats:FindFirstChild("Style") then
         stats.Style.Value = styleName
         Rayfield:Notify({
            Title = "★Chronotic AI Service",
            Content = "Successfully applied: " .. styleName,
            Duration = 5
         })
      end
   end
})

StyleSection:CreateParagraph({
   Title = "Unobtainable Style!",
   Content = "Some styles require specific unlocks or game progress."
})

StyleSection:CreateButton({
   Name = "Get NEL Isagi",
   Callback = function()
      local stats = game.Players.LocalPlayer:FindFirstChild("PlayerStats")
      if stats and stats:FindFirstChild("Style") then
         stats.Style.Value = "NEL Isagi"
         Rayfield:Notify({
            Title = "★Chronotic AI Service",
            Content = "NEL Isagi style applied!",
            Duration = 5
         })
      end
   end
})

StyleSection:CreateButton({
   Name = "Get NEL Bachira",
   Callback = function()
      local stats = game.Players.LocalPlayer:FindFirstChild("PlayerStats")
      if stats and stats:FindFirstChild("Style") then
         stats.Style.Value = "NEL Bachira"
         Rayfield:Notify({
            Title = "★Chronotic AI Service",
            Content = "NEL Bachira style applied!",
            Duration = 5
         })
      end
   end
})

StyleSection:CreateParagraph({
   Title = "Note:",
   Content = "To use the skills properly, your current style must be Reo!"
})

local CoreSection = RecommendTab:CreateSection("Core Utilities")

-- Infinite Awakening (no force style)
CoreSection:CreateButton({
   Name = "Infinite Awakening (No Force Style)",
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
         Content = "Infinite Awakening activated!",
         Duration = 5
      })
   end
})

-- No Cooldown Ability
CoreSection:CreateButton({
   Name = "No Cooldown Ability",
   Callback = function()
      local C = require(game:GetService("ReplicatedStorage").Controllers.AbilityController)
      local o = C.AbilityCooldown
      C.AbilityCooldown = function(s, n, ...) return o(s, n, 0, ...) end
      Rayfield:Notify({
         Title = "★Chronotic AI Service",
         Content = "No Cooldown is now active!",
         Duration = 5
      })
   end
})

-- Anti Kick Protection
CoreSection:CreateButton({
   Name = "Anti Kick OP Guardian",
   Callback = function()
      local mt = getrawmetatable(game)
      setreadonly(mt, false)
      local old = mt.__namecall
      mt.__namecall = newcclosure(function(self, ...)
         if getnamecallmethod() == "Kick" then
            warn("★ Chronotic AI: Kick attempt blocked!")
            return
         end
         return old(self, ...)
      end)
      Rayfield:Notify({
         Title = "★Chronotic AI Service",
         Content = "Anti Kick Guardian Enabled!",
         Duration = 5
      })
   end
})

