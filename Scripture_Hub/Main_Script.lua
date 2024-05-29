local PlaceIdHandler = loadstring(game:HttpGet("https://raw.githubusercontent.com/UnknownKellyMC0/Scripts/main/Scripture_Hub/PlaceIDHandler.lua"))()

PlaceIdHandler:RegisterCallback(6553871117, function(placeId)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UnknownKellyMC0/Scripts/main/Scripture_Hub/CustomModules/6553871117.lua"))()
end)

PlaceIdHandler:RegisterCallback(14722542056, function(placeId)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UnknownKellyMC0/Scripts/main/Scripture_Hub/CustomModules/14722542056.lua"))()
end)

PlaceIdHandler:RegisterCallback(6781255886, function(placeId)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UnknownKellyMC0/Scripts/main/Scripture_Hub/CustomModules/6781255886.lua"))()
end)

PlaceIdHandler:SetMissingPlaceCallback(function()
    local TweenService = game:GetService("TweenService")

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	
	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.new(0.5, 0, 0.3, 0)
	Frame.Position = UDim2.new(0.25, 0, 0.35, 0)
	Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BackgroundTransparency = 0.5
	Frame.BorderSizePixel = 0
	Frame.Parent = ScreenGui
	
	local FrameCorner = Instance.new("UICorner")
	FrameCorner.CornerRadius = UDim.new(0, 12)
	FrameCorner.Parent = Frame
	
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Size = UDim2.new(1, -20, 0.7, -20)
	TextLabel.Position = UDim2.new(0, 10, 0, 10)
	TextLabel.BackgroundTransparency = 1
	TextLabel.TextWrapped = true
	TextLabel.Text = "Looks like the script didnt support this game, if you want to support this, request them on youtube or discord!"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.Parent = Frame
	
	local TextLabelCorner = Instance.new("UICorner")
	TextLabelCorner.CornerRadius = UDim.new(0, 12)
	TextLabelCorner.Parent = TextLabel
	
	local CloseButton = Instance.new("TextButton")
	CloseButton.Size = UDim2.new(0.3, 0, 0.2, 0)
	CloseButton.Position = UDim2.new(0.35, 0, 0.75, 0)
	CloseButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	CloseButton.Text = "OK"
	CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	CloseButton.TextScaled = true
	CloseButton.Parent = Frame
	
	local CloseButtonCorner = Instance.new("UICorner")
	CloseButtonCorner.CornerRadius = UDim.new(0, 12)
	CloseButtonCorner.Parent = CloseButton
	
	CloseButton.MouseButton1Click:Connect(function()
	    local TweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
	    local TweenGoals = {Size = UDim2.new(0, 0, Frame.Size.Y.Scale, Frame.Size.Y.Offset)}
	    local Tween = TweenService:Create(Frame, TweenInfo, TweenGoals)
	    
	    Tween:Play()
	    Tween.Completed:Connect(function()
	        ScreenGui:Destroy()
	    end)
	end)
end)

PlaceIdHandler:DetectPlaceId()
