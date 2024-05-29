local Material = loadstring(game:HttpGet("https://pastebin.com/raw/DkWSV3wS"))()

local Windows = Material.Load({
    Title = "Scripture Hub",
    Style = 3,
    SizeX = 500,
    SizeY = 350,
    Theme = "Light",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(235, 235, 235)
    }
})

local Settings = {
    Hitbox_Expansion = {
        Toggle = false,
        Size = 10
    }
}

local hitboxParts = {}

local loopEnabled = false
local loopConnection

local function updateHitboxParts()
    hitboxParts = {}
    for _, part in pairs(game.Workspace:GetDescendants()) do
        if part:IsA("MeshPart") and part.Name == "collision" and part.Parent.Name == "torso" then
            table.insert(hitboxParts, part)
        end
    end
end

game.Workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("MeshPart") and descendant.Name == "collision" and descendant.Parent.Name == "torso" then
        table.insert(hitboxParts, descendant)
    end
end)

game.Workspace.DescendantRemoving:Connect(function(descendant)
    for i, part in ipairs(hitboxParts) do
        if part == descendant then
            table.remove(hitboxParts, i)
            break
        end
    end
end)

local function startHitboxAndLoop()
    loopEnabled = true
    loopConnection = game:GetService('RunService').RenderStepped:Connect(function()
        if Settings.Hitbox_Expansion.Toggle then
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                if player ~= game:GetService("Players").LocalPlayer then
                    for _, part in ipairs(hitboxParts) do
                        local partPlayer = game:GetService('Players'):GetPlayerFromCharacter(part.Parent.Parent)
                        if partPlayer == player then
                            part.Size = Vector3.new(Settings.Hitbox_Expansion.Size, Settings.Hitbox_Expansion.Size, Settings.Hitbox_Expansion.Size)
                            part.Transparency = 0.5
                            part.BrickColor = BrickColor.new("Really blue")
                            part.Material = "Neon"
                            part.CanCollide = false
                        end
                    end
                end
            end
        else
            stopLoop()
        end
    end)
end

local function stopLoop()
    loopEnabled = false
    if loopConnection then
        loopConnection:Disconnect()
    end
end

updateHitboxParts()

local Main = Windows.New({
    Title = "Main"
})

local Main_Label = Main.Label({
    Text = "Hitbox Expansion"
})

local Hitboxxer = Main.Toggle({
    Text = "Toggle",
    Callback = function(Value)
        Settings.Hitbox_Expansion.Toggle = Value
        if Value then
            startHitboxAndLoop()
        else
            stopLoop()
            for _, part in ipairs(hitboxParts) do
                local partPlayer = game:GetService('Players'):GetPlayerFromCharacter(part.Parent.Parent)
                if partPlayer and partPlayer ~= game:GetService('Players').LocalPlayer then
                    part.Size = Vector3.new(2, 2, 1)
                    part.Transparency = 1
                end
            end
        end
    end,
    Enabled = Settings.Hitbox_Expansion.Toggle
})

local Hitboxxer_Size = Main.Slider({
    Text = "Size",
    Callback = function(Value)
        Settings.Hitbox_Expansion.Size = Value
        if loopEnabled then
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                if player ~= game:GetService("Players").LocalPlayer then
                    for _, part in ipairs(hitboxParts) do
                        local partPlayer = game:GetService('Players'):GetPlayerFromCharacter(part.Parent.Parent)
                        if partPlayer == player then
                            part.Size = Vector3.new(Settings.Hitbox_Expansion.Size, Settings.Hitbox_Expansion.Size, Settings.Hitbox_Expansion.Size)
                        end
                    end
                end
            end
        end
    end,
    Min = 4,
    Max = 25,
    Def = Settings.Hitbox_Expansion.Size
})
