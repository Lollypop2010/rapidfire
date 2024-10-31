-- Rapid Fire Script for Roblox

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local shooting = false

-- Function to shoot a bullet
local function shoot()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local bullet = Instance.new("Part") -- Create a bullet part
        bullet.Size = Vector3.new(0.2, 0.2, 1)
        bullet.BrickColor = BrickColor.new("Bright red")
        bullet.Material = Enum.Material.Neon
        bullet.CFrame = player.Character.Head.CFrame * CFrame.new(0, 0, -2) -- Position in front of the player's head
        bullet.Parent = workspace

        -- Adding velocity to the bullet
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = (mouse.Hit.p - bullet.Position).unit * 50 -- Adjust speed as needed
        bodyVelocity.Parent = bullet
        
        -- Remove the bullet after a short time
        game:GetService("Debris"):AddItem(bullet, 2)
    end
end

-- Key down event to start shooting
mouse.Button1Down:Connect(function()
    shooting = true
    while shooting do
        shoot()
        wait(0.1) -- Adjust delay for rapid firing speed
    end
end)

-- Key up event to stop shooting
mouse.Button1Up:Connect(function()
    shooting = false
end)
