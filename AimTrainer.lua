
-- AIM TRAINER GUI
-- For your own Roblox experience

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "AimTrainer"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(250, 220)
frame.Position = UDim2.new(0.5, -125, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(15, 20, 35)
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius =
    UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(0, 145, 210)
title.Text = "AIM TRAINER"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 20
title.Parent = frame

local function button(name, y)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.86, 0, 0, 38)
    b.Position = UDim2.new(0.07, 0, 0, y)
    b.BackgroundColor3 = Color3.fromRGB(20, 110, 160)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextSize = 15
    b.Text = name
    b.Parent = frame
    Instance.new("UICorner", b)
    return b
end

local crossButton = button("Crosshair: OFF", 55)
local targetButton = button("Spawn Target", 105)
local closeButton = button("CLOSE", 155)

local cross = Instance.new("TextLabel")
cross.Size = UDim2.fromOffset(50, 50)
cross.AnchorPoint = Vector2.new(0.5, 0.5)
cross.Position = UDim2.fromScale(0.5, 0.5)
cross.BackgroundTransparency = 1
cross.Text = "+"
cross.TextColor3 = Color3.fromRGB(0, 255, 255)
cross.TextSize = 38
cross.Visible = false
cross.Parent = gui

local enabled = false

crossButton.MouseButton1Click:Connect(function()
    enabled = not enabled
    cross.Visible = enabled
    crossButton.Text = enabled and
        "Crosshair: ON" or "Crosshair: OFF"
end)

targetButton.MouseButton1Click:Connect(function()
    local target = Instance.new("TextButton")
    target.Size = UDim2.fromOffset(55, 55)
    target.AnchorPoint = Vector2.new(0.5, 0.5)
    target.Position = UDim2.new(
        math.random(15, 85) / 100, 0,
        math.random(20, 80) / 100, 0
    )
    target.BackgroundColor3 = Color3.fromRGB(255, 45, 45)
    target.Text = "●"
    target.TextSize = 30
    target.TextColor3 = Color3.new(1, 1, 1)
    target.Parent = gui
    Instance.new("UICorner", target).CornerRadius =
        UDim.new(1, 0)

    target.MouseButton1Click:Connect(function()
        target:Destroy()
    end)
end)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
