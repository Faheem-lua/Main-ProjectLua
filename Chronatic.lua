--// Chronatic Dark Pro Hub | Rayfield V4 Sirius | Anti Ragdoll + Anti Ankle Break + WalkSpeed + Control Ball + Full Hub

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "★Chronatic Dark Pro Hub | Blue Lock: Rivals★",
   Icon = "Gem",
   LoadingTitle = "Chronatic Hub Loading...",
   LoadingSubtitle = "+Made by Faheem+",
   Theme = "Amethyst",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ChronaticHub",
      FileName = "ChronaticDarkPro"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "Chronatic Service Authentication",
      Subtitle = "Authentication Private+",
      Note = "Allowed Keys: Chrollo, Faheem, OpHub",
      FileName = "ChronaticKeySave",
      SaveKey = true,
      GrabKeyFromSite = false,
      AcceptedKeys = {"Chrollo", "Faheem", "OpHub"}
   }
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

-- Tabs
local PlayerTab = Window:CreateTab("Player", 4483362458)
local FunTab = Window:CreateTab("Fun", 4483362458)

-- Sections inside Player Tab
local StyleManagerSection = PlayerTab:CreateSection("Style Manager")
local TrollSection = PlayerTab:CreateSection("Troll")

local styleName = ""

StyleManagerSection:CreateInput({
	Name = "Enter Style Name",
	PlaceholderText = "Example: Kaiser, King, Kurona",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		styleName = Text
	end,
})

StyleManagerSection:CreateButton({
	Name = "Apply Style",
	Callback = function()
		local player = Players.LocalPlayer
		local stats = player:FindFirstChild("PlayerStats")
		if stats and stats:FindFirstChild("Style") then
			stats.Style.Value = styleName
		end
		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Successfully Applied by Faheem!",
			Duration = 5
		})
	end,
})

StyleManagerSection:CreateButton({
	Name = "Set Style: NEL Bachira",
	Callback = function()
		local player = Players.LocalPlayer
		local stats = player:FindFirstChild("PlayerStats")
		if stats and stats:FindFirstChild("Style") then
			stats.Style.Value = "NEL Bachira"
		end
		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Successfully Applied by Faheem!",
			Duration = 5
		})
	end,
})

StyleManagerSection:CreateButton({
	Name = "Set Style: NEL ISAGI",
	Callback = function()
		local player = Players.LocalPlayer
		local stats = player:FindFirstChild("PlayerStats")
		if stats and stats:FindFirstChild("Style") then
			stats.Style.Value = "NEL Isagi"
		end
		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Successfully Applied by Faheem!",
			Duration = 5
		})
	end,
})

-- Troll Section (Body Lock Toggle)
local BodyLockEnabled = false

TrollSection:CreateToggle({
	Name = "Kunigami Reo Body Lock",
	CurrentValue = false,
	Callback = function(Value)
		BodyLockEnabled = Value
		if BodyLockEnabled then
			spawn(function()
				while BodyLockEnabled do
					task.wait(0.1)
					local player = Players.LocalPlayer
					local closest = nil
					local shortestDistance = math.huge
					for _, v in pairs(Players:GetPlayers()) do
						if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
							local dist = (player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
							if dist < shortestDistance then
								shortestDistance = dist
								closest = v
							end
						end
					end
					if closest then
						player.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position, closest.Character.HumanoidRootPart.Position)
					end
				end
			end)
		end
		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Body Lock: "..(BodyLockEnabled and "Enabled" or "Disabled"),
			Duration = 5
		})
	end,
})

-- Sections inside Fun Tab
local LocalPlayerSection = FunTab:CreateSection("LocalPlayer Settings")
local FunSection = FunTab:CreateSection("Fun")
local UsefulFeaturesSection = FunTab:CreateSection("Useful Features")
local Opv2Section = FunTab:CreateSection("Opv2")

-- Infinite Flow
local InfiniteFlowEnabled = false

LocalPlayerSection:CreateToggle({
	Name = "Infinite Flow Mode",
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
			Title = "Chronatic Hub",
			Text = "Successfully Applied by Faheem!",
			Duration = 5
		})
	end,
})

-- Fun Section (WalkSpeed + Anti Ragdoll + Anti Ankle Break)
FunSection:CreateSlider({
	Name = "WalkSpeed Controller",
	Range = {10, 150},
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 16,
	Callback = function(Value)
		local character = Players.LocalPlayer.Character
		if character and character:FindFirstChild("Humanoid") then
			character.Humanoid.WalkSpeed = Value
		end
	end,
})

FunSection:CreateButton({
	Name = "Anti Ragdoll",
	Callback = function()
		local player = Players.LocalPlayer
		player.CharacterAdded:Connect(function(character)
			character:WaitForChild("Ragdolled", 5)
			local rag = character:FindFirstChild("Ragdolled")
			if rag then
				rag:Destroy()
			end
		end)
		if player.Character and player.Character:FindFirstChild("Ragdolled") then
			player.Character.Ragdolled:Destroy()
		end
		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Anti Ragdoll Activated by Faheem!",
			Duration = 5
		})
	end,
})

FunSection:CreateButton({
	Name = "Anti Ankle Break",
	Callback = function()
		local player = Players.LocalPlayer
		local antiRagdollEnabled = true
		local function disableRagdoll()
			while antiRagdollEnabled do
				if player.Character and player.Character:FindFirstChild("Ragdolled") then
					player.Character.Ragdolled:Destroy()
				end
				task.wait()
			end
		end
		task.spawn(disableRagdoll)
		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Anti Ankle Break Activated by Faheem!",
			Duration = 5
		})
	end,
})

-- Useful Features Section
UsefulFeaturesSection:CreateButton({
	Name = "Enable Infinite Awakening",
	Callback = function()
		local AbilityController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))
		local LocalPlayer = Players.LocalPlayer

		StarterGui:SetCore("SendNotification", {
			Title = "InfAwakening",
			Text = "Only works if Style is Kaiser, King, or Kurona!",
			Duration = 7
		})

		spawn(function()
			while true do
				task.wait(1)
				LocalPlayer.PlayerStats.InAwakening.Value = true
				AbilityController:UseAbility("Awakening")
			end
		end)

		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Successfully Applied by Faheem!",
			Duration = 5
		})
	end,
})

UsefulFeaturesSection:CreateButton({
	Name = "Enable Anti Kick BLR",
	Callback = function()
		local mt = getrawmetatable(game)
		setreadonly(mt, false)
		local old = mt.__namecall
		mt.__namecall = newcclosure(function(self, ...)
			if getnamecallmethod() == "Kick" then
				warn("Faheem Kick Bypass: Prevented kick attempt!")
				return
			end
			return old(self, ...)
		end)
		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Successfully Applied by Faheem!",
			Duration = 5
		})
	end,
})

UsefulFeaturesSection:CreateButton({
	Name = "Enable No Cooldown Ability",
	Callback = function()
		local C = require(ReplicatedStorage.Controllers.AbilityController)
		local o = C.AbilityCooldown
		C.AbilityCooldown = function(s, n, ...) return o(s, n, 0, ...) end
		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Successfully Applied by Faheem!",
			Duration = 5
		})
	end,
})

-- Opv2 Section
Opv2Section:CreateButton({
	Name = "Control Ball (Faheem)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Faheem-lua/Main-ProjectLua/refs/heads/main/Controll%20Ball.lua"))()
		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Successfully Loaded Control Ball by Faheem!",
			Duration = 5
		})
	end,
})
