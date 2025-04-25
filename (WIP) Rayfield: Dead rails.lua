local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Dead Rails | Glorious Emperor's Hub",
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
   Name = "NpcLockin",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Faheem-lua/Key-fluent-ui/refs/heads/main/LockinByMe.lua.txt"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Auto Farm Bonds",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Emplic/deathrails/refs/heads/main/bond"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Auto Farm Bonds v1.5",
   Callback = function()
     --// Bonds Farm V1.5

local Cooldown = 0.1

local TrackCount = 1
local BondCount = 0
local TrackPassed = false
local FoundLobby = false

if game.PlaceId == 116495829188952 then

    local CreateParty = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("CreatePartyClient")
    local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart

    while task.wait(Cooldown) do
        if FoundLobby == false then
            print("Finding Lobby...")
            for i,v in pairs(game:GetService("Workspace").TeleportZones:GetChildren()) do
                if v.Name == "TeleportZone" and v.BillboardGui.StateLabel.Text == "Waiting for players..." then
                    print("Lobby Found!")
                    HRP.CFrame = v.ZoneContainer.CFrame
                    FoundLobby = true
                    task.wait(1)
                    CreateParty:FireServer({["maxPlayers"] = 1})
                end
            end
        end
    end

elseif game.PlaceId == 70876832253163 then

    local StartingTrack = game:GetService("Workspace").RailSegments:FindFirstChild("RailSegment")
    local CollectBond = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("ActivateObjectClient")
    local Items = game:GetService("Workspace").RuntimeItems
    local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart

    HRP.Anchored = true

    while task.wait(Cooldown) do
    if TrackPassed == false then
        print("Teleporting to track", TrackCount)
        TrackPassed = true
    end
    HRP.CFrame = StartingTrack.Guide.CFrame + Vector3.new(0,250,0)
    if StartingTrack.NextTrack.Value ~= nil then
        StartingTrack = StartingTrack.NextTrack.Value
        TrackCount += 1
    else
        game:GetService("TeleportService"):Teleport(116495829188952, game:GetService("Players").LocalPlayer)
    end
    repeat
        for i,v in pairs(Items:GetChildren()) do
            if v.Name == "Bond" or v.Name == "BondCalculated" then
                spawn(function()
                    for i = 1, 1000 do
                        pcall(function()
                            v.Part.CFrame = HRP.CFrame
                        end)
                    end
                    CollectBond:FireServer(v)
                end)
                if v.Name == "Bond" then
                    BondCount += 1
                    print("Got", BondCount, "Bonds")
                    v.Name = "BondCalculated"
                end
            end
        end
        task.wait()
    until Items:FindFirstChild("Bond") == nil
    TrackPassed = false
    end

         end
   end,
})

local Button = Tab:CreateButton({
   Name = "Sometimes its not working Auto Farm Bonds v1.5..",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})

local Button = Tab:CreateButton({
   Name = "",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})




