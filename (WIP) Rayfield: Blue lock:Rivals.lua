local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "★ Blue lock: Rivals ★",
   Icon = 0,
   LoadingTitle = "The Official Hub is loading",
   LoadingSubtitle = "Please Be Patient The Hub Should Load..",
   Theme = "Amethyst",
   
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "FaheemPack", -- Custom folder for your hub/game
      FileName = "FaheemPackScript"
   },

   Discord = {
      Enabled = true,
      Invite = "discord.gg/Arbix", 
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "★Authentication™",
      Subtitle = "The Key System Service | Protected By Gemini™",
      Note = "The Key is = GeminiAi",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"GeminiAi"}
   }
})

local Tab = Window:CreateTab("Main™", 4483362458)
local Section = Tab:CreateSection("LocalPlayer")

-- WalkSpeed Slider
local SpeedSlider = Tab:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 150},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "WalkSpeedSlider",
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

-- JumpPower Slider
local JumpSlider = Tab:CreateSlider({
   Name = "JumpPower",
   Range = {1, 200},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 50,
   Flag = "JumpPowerSlider",
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local AntiAFKToggle = Tab:CreateToggle({
   Name = "Anti-AFK",
   CurrentValue = false,
   Flag = "AntiAFKToggle",
   Callback = function(Value)
      if Value then
         -- Continuously perform an action to avoid being idle
         spawn(function()
            while true do
               -- Wait for idle event
               game:GetService("Players").LocalPlayer.Idled:wait()
               -- Simulate a click to prevent AFK
               game:GetService("VirtualUser"):ClickButton1(Vector2.new(0, 0))
            end
         end)
      end
   end,
})

-- Anti-Ragdoll Toggle
local AntiRagdollToggle = Tab:CreateToggle({
   Name = "Anti-Ragdoll",
   CurrentValue = false,
   Flag = "AntiRagdollToggle",
   Callback = function(Value)
       local playerCharacter = game.Players.LocalPlayer.Character
       if playerCharacter then
           local humanoid = playerCharacter:FindFirstChild("Humanoid")
           if humanoid then
               humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, not Value)
           end
       end
   end,
})

local Section2 = Tab:CreateSection("Usefull")

local Button = Tab:CreateButton({
    Name = "★FE-INVISIBLE",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
    end,
})

local Button = Tab:CreateButton({
    Name = "Infinite Yield!",
    Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
    end,
})

local Button = Tab:CreateButton({
    Name = "★Wsil Universal Hub",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl'i%20Universal%20Project%20Mobile.lua", true))()
    end,
})

local Button = Tab:CreateButton({
    Name = "Inf Stamina",
    Callback = function()
      -- Infinite stamina script (hypothetical example)
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local staminaStat = char:FindFirstChild("Stamina")

if staminaStat then
    while true do
        staminaStat.Value = math.huge -- Set stamina to an extremely high value
        task.wait(0.1) -- Update every 0.1 seconds
    end
else
    warn("Stamina stat not found!")
         end
    end,
})







