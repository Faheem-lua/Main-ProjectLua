local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local AbilityController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))

local AutoGoal = true

-- fuction to detect its there a real goal
local function GetEnemyGoal()
    local team = LocalPlayer.Team.Name
    if team == "Red" then
        return Workspace:FindFirstChild("BlueGoal") or Workspace:FindFirstChild("GoalBlue") or Workspace:FindFirstChild("Goal")
    elseif team == "Blue" then
        return Workspace:FindFirstChild("RedGoal") or Workspace:FindFirstChild("GoalRed") or Workspace:FindFirstChild("Goal")
    else
        return Workspace:FindFirstChild("Goal")
    end
end

spawn(function()
    while AutoGoal do
        task.wait(2)

        -- Step 1: Find Ball
        local Ball = Workspace:FindFirstChild("Ball") or Workspace:FindFirstChild("SoccerBall") or Workspace:FindFirstChild("Football")

        -- Step 2: Find Goal
        local Goal = GetEnemyGoal()

        if Ball and Goal and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then

            -- Step 3: Teleport to the Ball
            LocalPlayer.Character.HumanoidRootPart.CFrame = Ball.CFrame * CFrame.new(0, 3, 0) -- Teleport slightly above Ball

            task.wait(0.5)

            -- Step 4: Teleport to Goal
            LocalPlayer.Character.HumanoidRootPart.CFrame = Goal.CFrame * CFrame.new(0, 0, -5) -- Stand in front of goal

            task.wait(0.5)

            -- Step 5: Face Goal
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(
                LocalPlayer.Character.HumanoidRootPart.Position,
                Goal.Position
            )

            task.wait(0.2)

            -- Step 6: Shoot!
            AbilityController:UseAbility("Precision Shot")
            AbilityController:UseAbility("Sniper Shot")

            task.wait(3) -- wait before next goal try
        end
    end
end)

--Hello if you see this 101jackniku i love you script (PEAK HUB) so i invite you to my project,
--This its auto goal you have problem on youre script the goal not working so i make new one with my iq
-- I DONT IF ITS WORKS im still study lua code So if there a bug/error/wrong please tell me or fix it ill pachted it..
