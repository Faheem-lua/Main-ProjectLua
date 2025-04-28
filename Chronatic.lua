--// Chronatic Dark Pro Hub - Rayfield V4 Version

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "Chronatic Dark Pro Hub | Blue Lock: Rivals",
	LoadingTitle = "Chronatic Hub Loading...",
	LoadingSubtitle = "Made by Faheem",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "ChronaticHub", -- Save configs here
		FileName = "ChronaticDarkPro"
	},
	KeySystem = false,
})

-- Tabs
local ReadTab = Window:CreateTab("Read", 4483362458)
local StyleTab = Window:CreateTab("Style", 4483362458)
local UsefulTab = Window:CreateTab("Useful", 4483362458)
local CreditsTab = Window:CreateTab("Credits", 4483362458)

-- Read Tab
local StarterGui = game:GetService("StarterGui")

ReadTab:CreateParagraph({
	Title = "Welcome to Chronatic Hub!",
	Content = "Made by Faheem. Use the Style Tab to change your Style easily.\nExample: Kaiser, Rin, NEL Isagi."
})

ReadTab:CreateParagraph({
	Title = "Reminder",
	Content = "[Important]: After changing Style, you must rejoin the game to refresh Skills!"
})

-- Style Tab
local styleName = ""

StyleTab:CreateInput({
	Name = "Enter Style Name",
	PlaceholderText = "Example: Kaiser, Rin, NEL Isagi",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		styleName = Text
	end,
})

StyleTab:CreateButton({
	Name = "Apply Custom Style",
	Callback = function()
		local player = game.Players.LocalPlayer
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
	Name = "Set Style: NEL Isagi",
	Callback = function()
		local player = game.Players.LocalPlayer
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

StyleTab:CreateButton({
	Name = "Set Style: NEL Bachira",
	Callback = function()
		local player = game.Players.LocalPlayer
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

StyleTab:CreateParagraph({
	Title = "Note",
	Content = "[Important]: You must have Reo to use the style skills!"
})

-- Useful Tab
UsefulTab:CreateButton({
	Name = "Enable Anti Kick",
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

UsefulTab:CreateButton({
	Name = "Enable Infinite Awakening",
	Callback = function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local AbilityController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))
		local LocalPlayer = game.Players.LocalPlayer

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
	Name = "Enable No Cooldown Ability",
	Callback = function()
		local C = require(game:GetService("ReplicatedStorage").Controllers.AbilityController)
		local o = C.AbilityCooldown
		C.AbilityCooldown = function(s, n, ...) return o(s, n, 0, ...) end
		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Successfully Applied by Faheem!",
			Duration = 5
		})
	end,
})

-- Credits Tab
CreditsTab:CreateButton({
	Name = "This GUI made by RedzHubV5",
	Callback = function()
		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Thanks to RedzHubV5!",
			Duration = 5
		})
	end,
})

CreditsTab:CreateButton({
	Name = "Made by Faheem",
	Callback = function()
		StarterGui:SetCore("SendNotification", {
			Title = "Chronatic Hub",
			Text = "Created by Faheem!",
			Duration = 5
		})
	end,
})
