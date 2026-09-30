-- TANNY HUB | Egg Steal
-- Roblox Studio - Own Game
-- Version 1.0

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "TANNY_HUB"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 300, 0, 230)
main.Position = UDim2.new(0.5, -150, 0.5, -115)
main.BackgroundColor3 = Color3.fromRGB(24, 17, 40)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundColor3 = Color3.fromRGB(110, 50, 210)
title.Text = "🔥 TANNY HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.Parent = main

Instance.new("UICorner", title).CornerRadius = UDim.new(0, 12)

local function createButton(text, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 260, 0, 45)
    button.Position = UDim2.new(0, 20, 0, y)
    button.BackgroundColor3 = Color3.fromRGB(55, 40, 80)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 16
    button.Font = Enum.Font.GothamBold
    button.Text = text
    button.Parent = main

    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

    return button
end

local eggButton = createButton("🥚 Fast Collection: OFF", 65)
local petButton = createButton("🐾 Pet Follow: OFF", 120)
local closeButton = createButton("❌ Close Hub", 175)

local fastCollection = false
local petFollow = false

eggButton.MouseButton1Click:Connect(function()
    fastCollection = not fastCollection

    eggButton.Text = fastCollection
        and "🥚 Fast Collection: ON"
        or "🥚 Fast Collection: OFF"

    eggButton.BackgroundColor3 = fastCollection
        and Color3.fromRGB(40, 150, 90)
        or Color3.fromRGB(55, 40, 80)

    player:SetAttribute("FastCollectionEnabled", fastCollection)
end)

petButton.MouseButton1Click:Connect(function()
    petFollow = not petFollow

    petButton.Text = petFollow
        and "🐾 Pet Follow: ON"
        or "🐾 Pet Follow: OFF"

    petButton.BackgroundColor3 = petFollow
        and Color3.fromRGB(40, 150, 90)
        or Color3.fromRGB(55, 40, 80)

    player:SetAttribute("PetFollowEnabled", petFollow)
end)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
