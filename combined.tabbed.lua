# Saving the fully combined Grow a Garden spawner script with dropdown tab selection and complete egg functionality
final_combined_script = """
-- 🌱 Grow a Garden - Full Egg Spawner UI with Dropdown Tabs (Delta-Compatible)

local Player = game:GetService("Players").LocalPlayer
local Gui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
Gui.Name = "GrowGardenSpawnerUI"
Gui.ResetOnSpawn = false

local eggs = {
    Night = {"Hedgehog", "Mole", "Frog", "Echo Frog", "Night Owl", "Raccoon"},
    Mythical = {"Red Giant Ant", "Squirrel", "Red Fox"},
    Paradise = {"Ostrich", "Peacock", "Capybara", "Scarlet Macaw", "Mimic Octopus"},
    Bug = {"Caterpillar", "Giant Mantis", "Giant Ant", "Dragon Fly"},
    Oasis = {"Meerkat", "Sand Snake", "Axolotl", "Hyacinth Macaw", "Fennec Fox"},
}

-- Main UI Frame
local main = Instance.new("Frame", Gui)
main.Size = UDim2.new(0, 320, 0, 380)
main.Position = UDim2.new(0, 20, 0.5, -190)
main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
main.BorderSizePixel = 0

-- Title
local title = Instance.new("TextLabel", main)
title.Text = "🌿 Grow a Garden - Egg Spawner"
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18

-- Dropdown Button
local categoryDropdown = Instance.new("TextButton", main)
categoryDropdown.Size = UDim2.new(1, -20, 0, 30)
categoryDropdown.Position = UDim2.new(0, 10, 0, 40)
categoryDropdown.Text = "Select Category"
categoryDropdown.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
categoryDropdown.TextColor3 = Color3.new(1, 1, 1)
categoryDropdown.Font = Enum.Font.SourceSans
categoryDropdown.TextSize = 16

-- Dropdown List
local dropdownFrame = Instance.new("Frame", main)
dropdownFrame.Position = UDim2.new(0, 10, 0, 75)
dropdownFrame.Size = UDim2.new(1, -20, 0, 120)
dropdownFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
dropdownFrame.Visible = false
dropdownFrame.ClipsDescendants = true

-- Clear old spawn buttons
local function clearButtons()
    for _, obj in pairs(main:GetChildren()) do
        if obj:IsA("TextButton") and obj.Name == "SpawnBtn" then
            obj:Destroy()
        end
    end
end

-- Create and spawn full 3D egg
local function spawnEgg(name)
    local egg = Instance.new("Part")
    egg.Name = name .. " Egg"
    egg.Size = Vector3.new(2, 2, 2)
    egg.Position = Player.Character.HumanoidRootPart.Position + Vector3.new(math.random(-10,10), 5, math.random(-10,10))
    egg.Anchored = true
    egg.Shape = Enum.PartType.Ball
    egg.Material = Enum.Material.SmoothPlastic
    egg.BrickColor = BrickColor.Random()
    egg.Parent = workspace
end

-- Populate dropdown
local y = 5
for category, animals in pairs(eggs) do
    local option = Instance.new("TextButton", dropdownFrame)
    option.Size = UDim2.new(1, 0, 0, 25)
    option.Position = UDim2.new(0, 0, 0, y)
    option.Text = category
    option.TextColor3 = Color3.new(1, 1, 1)
    option.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    option.Font = Enum.Font.SourceSans
    option.TextSize = 14

    option.MouseButton1Click:Connect(function()
        categoryDropdown.Text = "Selected: " .. category
        dropdownFrame.Visible = false
        clearButtons()

        local offsetY = 200
        for _, animal in ipairs(animals) do
            local btn = Instance.new("TextButton", main)
            btn.Name = "SpawnBtn"
            btn.Size = UDim2.new(1, -20, 0, 30)
            btn.Position = UDim2.new(0, 10, 0, offsetY)
            btn.Text = "Spawn " .. animal
            btn.BackgroundColor3 = Color3.fromRGB(90, 150, 200)
            btn.TextColor3 = Color3.new(1, 1, 1)
            btn.Font = Enum.Font.SourceSans
            btn.TextSize = 14

            btn.MouseButton1Click:Connect(function()
                spawnEgg(animal)
            end)

            offsetY = offsetY + 35
        end
    end)

    y = y + 28
end

-- Toggle dropdown
categoryDropdown.MouseButton1Click:Connect(function()
    dropdownFrame.Visible = not dropdownFrame.Visible
end)
"""

# Save to file
file_path = "/mnt/data/grow_garden_combined_tabbed.lua"
with open(file_path, "w") as file:
    file.write(final_combined_script)

file_path

