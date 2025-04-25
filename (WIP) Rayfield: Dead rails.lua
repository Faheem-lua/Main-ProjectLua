local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Dead Rails | Glorious Emperor's Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Glorious Emperor's Hub Interface..",
   LoadingSubtitle = "Made By Faheem",
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

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
   Name = "NpcLockin",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})

