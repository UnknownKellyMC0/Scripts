local TweenService = game:GetService("TweenService")

-- Create a new ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame to hold the text and button
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.3, 0) -- 50% width and 30% height of the screen
frame.Position = UDim2.new(0.25, 0, 0.35, 0) -- Centered position
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
frame.BackgroundTransparency = 0.5 -- 50% transparency
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Add a UICorner to the frame to make it rounded
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = frame

-- Create a TextLabel to display the warning message
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, -20, 0.7, -20) -- Slight padding
textLabel.Position = UDim2.new(0, 10, 0, 10)
textLabel.BackgroundTransparency = 1 -- Transparent background
textLabel.TextWrapped = true -- Enable text wrapping
textLabel.Text = "This version of game may cause bugs the Scripture GUI, if you want stable, then play the official one."
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
textLabel.TextScaled = true -- Scale text to fit
textLabel.Parent = frame

-- Add a UICorner to the TextLabel to make it rounded
local textLabelCorner = Instance.new("UICorner")
textLabelCorner.CornerRadius = UDim.new(0, 12)
textLabelCorner.Parent = textLabel

-- Create a Button to close the GUI
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.3, 0, 0.2, 0) -- 30% width and 20% height of the frame
closeButton.Position = UDim2.new(0.35, 0, 0.75, 0) -- Centered horizontally at the bottom
closeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green background
closeButton.Text = "Ok"
closeButton.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text
closeButton.TextScaled = true -- Scale text to fit
closeButton.Parent = frame

-- Add a UICorner to the closeButton to make it rounded
local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 12)
closeButtonCorner.Parent = closeButton

-- Function to close the GUI with a doorway transition
closeButton.MouseButton1Click:Connect(function()
    -- Create a tween to shrink the frame horizontally
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
    local tweenGoals = {Size = UDim2.new(0, 0, frame.Size.Y.Scale, frame.Size.Y.Offset)}
    local tween = TweenService:Create(frame, tweenInfo, tweenGoals)
    
    tween:Play()
    tween.Completed:Connect(function()
        screenGui:Destroy()
        --//--
        loadstring(game:HttpGet("https://raw.githubusercontent.com/UnknownKellyMC0/Scripts/main/Scripture_Hub/CustomModules/6553871117.lua"))()
    end)
end)
