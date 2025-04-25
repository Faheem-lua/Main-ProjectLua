Kaitun: Blox Fruits 
lua =
-- Max level, godhuman, cdk, sgt
script_key = "Cracked_By_PWNYard" -- premium only, u can leave it blank if ur not -- (Idea By PWNYard)
getgenv().Shutdown = false -- Turn on if u are farming bulk accounts
getgenv().Configs = {
    ["Team"] = "Marines", -- Pick Any ["Team"] Example = Pirates,Marines
    ["FPS Boost"] = {
        ["Enable"] = false, -- Enabling Fps Booster for Low-End Device
        ["FPS Cap"] = 30, -- Framerate will change..
    },
    ["Farm Boss Drops"] = {
        ["Enable"] = false,
        ["When x2 Exp Expired"] = false -- Recommend On Off
    },
    ["Hop"] = { -- premium only
        ["Enable"] = true,
        ["Hop Find Tushita"] = true,
        ["Hop Find Valkyrie Helm"] = true,
        ["Hop Find Mirror Fractal"] = true
    },
    ["Farm Mastery"] = {
        ["Enable"] = true,
        ["Farm Mastery Weapons"] = {"Sword", "Gun", "Blox Fruit"}, -- Blox Fruit, Gun (left -> right: High -> Low Priority)
        ["Swords To Farm"] = {"Cursed Dual Katana"},
        ["Guns To Farm"] = {"Skull Guitar"},
        ["Mastery Health (%)"] = 40 -- For Blox Fruit, Gun
    },
    ["Auto Collect Berry"] = false,
    ["Auto Evo Race"] = true,
    ["Awaken Fruit"] = true,
    ["Rainbow Haki"] = true,
    ["Hop Player Near"] = true,
    ["Skull Guitar"] = true,
    ["Find Fruit"] = false, -- Will find 1m+ fruit to unlock swan door to access third sea
    ["Cursed Dual Katana"] = true,
    ["Switch Melee"] = true,
    ["Eat Fruit"] = "", -- leave blank for none, put the fruit name like this example: Smoke Fruit, T-Rex Fruit, ...
    ["Snipe Fruit"] = "", -- leave blank for none, put the fruit name like this example: Smoke Fruit, T-Rex Fruit, ...
    ["Lock Fragment"] = 0,
    ["Buy Stuffs"] = true -- buso, geppo, soru, ken haki, ...
}

-- this is the premium vers btw
repeat task.wait() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/PWNYard/Xero/refs/heads/main/Kaitun/PWN.lua"))() end) until getgenv().Check_Execute
-- Credits() = PWNYard = Design, Faheem = Scripting Advance Lua Coding, Broccoli = Idea Lua language.
-- This Script Made By Me...
