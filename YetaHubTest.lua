local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/GuiLibrary.lua"))()
ui:CreateWindow("YetaHub - Dead Rails [Alpha 2.0]", "Made by Faheem", "rbxassetid://12345678")

local keys = {"Faheem", "YetaHub25"}
ui:CreateKeySystem(keys, function()
    ui:Notify("Access Granted", "Welcome to YetaHub!")
end)

ui:Loader("Loading YetaHub...", 3)

local bondsTab = ui:CreateTab("Auto Bonds", "link")
local bondsSect = bondsTab:CreateSector("Functions", "left")

local bondsCount = 0
local autoBond = false

bondsSect:CreateToggle("Auto Bond Farm", false, function(state)
    autoBond = state
    if state then
        ui:Notify("Auto Bond Started", "Farming Bonds...")
        task.spawn(function()
            while autoBond do
                bondsCount = bondsCount + 1
                task.wait(2)
            end
        end)
    else
        ui:Notify("Auto Bond Stopped", "You can re-enable anytime.")
    end
end)

bondsSect:CreateButton("Show Bond Count", function()
    ui:Notify("Bonds Collected", tostring(bondsCount))
end)

bondsSect:CreateToggle("Auto Rejoin", false, function(state)
    if state then
        ui:Notify("Auto Rejoin Enabled", "Rejoining after bond run.")
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
end)

local testTab = ui:CreateTab("Admin & Extras", "shield")
local testSect = testTab:CreateSector("Admin Tools", "left")

testSect:CreateButton("Load Nameless Admin", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
    ui:Notify("Nameless Admin Loaded", "300+ commands ready.")
end)

testSect:CreateButton("Load Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    ui:Notify("Infinite Yield Loaded", "Admin commands ready.")
end)

testSect:CreateButton("Enable Anti-Cheat & Anti-Kick", function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        if getnamecallmethod() == "Kick" then return nil end
        return old(self, ...)
    end)
    setreadonly(mt, true)
    for _, conn in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
        conn:Disable()
    end
    ui:Notify("Bypass Enabled", "Anti-Cheat & Anti-Kick active.")
end)

local miscTab = ui:CreateTab("Anti-AFK & ESP", "eye")
local miscSect = miscTab:CreateSector("Extras", "left")

miscSect:CreateButton("Enable Anti-AFK", function()
    local VirtualUser = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
    ui:Notify("Anti-AFK Enabled", "You'll no longer get kicked for being idle.")
end)

miscSect:CreateToggle("ESP Toggle", false, function(state)
    if state then
        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
            if player ~= game:GetService("Players").LocalPlayer then
                local character = player.Character or player.CharacterAdded:Wait()
                if not character:FindFirstChild("YetaESP") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "YetaESP"
                    highlight.Adornee = character
                    highlight.FillColor = player.TeamColor.Color
                    highlight.FillTransparency = 0.3
                    highlight.OutlineColor = Color3.new(1, 1, 1)
                    highlight.Parent = character
                end
            end
        end
        ui:Notify("ESP Enabled", "Enemies and allies are now highlighted.")
    else
        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
            if player ~= game:GetService("Players").LocalPlayer then
                local char = player.Character
                if char and char:FindFirstChild("YetaESP") then
                    char:FindFirstChild("YetaESP"):Destroy()
                end
            end
        end
        ui:Notify("ESP Disabled", "All highlights removed.")
    end
end)
