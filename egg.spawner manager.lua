local Player = game:GetService("Players").LocalPlayer
local function simpleNotify(text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Egg Manager",
        Text = text,
        Duration = 3
    })
end

local function spawnEgg(name)
    local egg = Instance.new("Part")
    egg.Name = name .. " Egg"
    egg.Size = Vector3.new(2,2,2)
    egg.Position = Player.Character and Player.Character.HumanoidRootPart.Position + Vector3.new(0,5,0) or Vector3.new(0,10,0)
    egg.Anchored = true
    egg.Shape = Enum.PartType.Ball
    egg.BrickColor = BrickColor.Random()
    egg.Parent = workspace
    simpleNotify("Spawned " .. egg.Name)
end

-- Spawn example egg
spawnEgg("Night")
