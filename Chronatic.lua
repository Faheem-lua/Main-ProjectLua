--// Chronatic Dark Pro Hub | Rayfield V4 Sirius Clean Version

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "Chronatic Dark Pro Hub | Blue Lock: Rivals",
	LoadingTitle = "Chronatic Hub Loading...",
	LoadingSubtitle = "Made by Faheem",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "ChronaticHub",
		FileName = "ChronaticDarkPro"
	},
	KeySystem = false,
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

-- Tabs
local StyleTab = Window:CreateTab("Get Any Styles", 4483362458)
local UsefulTab = Window:CreateTab("Useful", 4483362458)

-- Get Any Styles Tab
local styleName = ""

StyleTab:CreateInput({
	Name = "Enter Style Name",
	PlaceholderText = "Example: Kaiser, King, Kurona",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		styleName = Text
	end,
})

StyleTab:CreateButton({
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

StyleTab:CreateButton({
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

StyleTab:CreateButton({
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

-- Useful Tab
UsefulTab:CreateButton({
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

UsefulTab:CreateButton({
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

		StarterGui:SetCore("SetCore", {
			Title = "Chronatic Hub",
			Text = "Successfully Applied by Faheem!",
			Duration = 5
		})
	end,
})

UsefulTab:CreateButton({
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
