local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

local adminList = {1, 154123, "AdminName1"} 

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AdminCLegit_Final_Pro"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = pGui

StarterGui:SetCore("SendNotification", {
    Title = "ADMINCLEGIT",
    Text = "Tool is running...",
    Duration = 5,
})

local function addFooter(parent)
    local footer = Instance.new("TextLabel")
    footer.Size = UDim2.new(1, 0, 0.08, 0)
    footer.Position = UDim2.new(0, 0, 0.92, 0)
    footer.Text = "visit adminclegit.com now!"
    footer.Font = Enum.Font.GothamMedium
    footer.TextScaled = true 
    footer.TextColor3 = Color3.fromRGB(150, 150, 150)
    footer.BackgroundTransparency = 1
    footer.Parent = parent
end

local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0.2, 0, 0.05, 0)
openButton.Position = UDim2.new(0.5, 0, 0.05, 0)
openButton.AnchorPoint = Vector2.new(0.5, 0)
openButton.Text = "OPEN ADMIN_CLEGIT TOOL"
openButton.Font = Enum.Font.GothamBold
openButton.TextScaled = true
openButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
openButton.TextColor3 = Color3.new(1, 1, 1)
openButton.Parent = screenGui
Instance.new("UICorner", openButton).CornerRadius = UDim.new(0.2, 0)

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.35, 0, 0.5, 0) 
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0.05, 0)

local aspectConstraint = Instance.new("UIAspectRatioConstraint")
aspectConstraint.AspectRatio = 1.3
aspectConstraint.Parent = mainFrame

local leftPanel = Instance.new("Frame")
leftPanel.Size = UDim2.new(0.45, 0, 1, 0)
leftPanel.Position = UDim2.new(-0.48, 0, 0, 0)
leftPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
leftPanel.Parent = mainFrame
Instance.new("UICorner", leftPanel).CornerRadius = UDim.new(0.05, 0)

local avatarImg = Instance.new("ImageLabel")
avatarImg.Size = UDim2.new(0.45, 0, 0.35, 0)
avatarImg.Position = UDim2.new(0.5, 0, 0.05, 0)
avatarImg.AnchorPoint = Vector2.new(0.5, 0)
avatarImg.BackgroundTransparency = 1
avatarImg.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..player.UserId.."&width=420&height=420&format=png"
avatarImg.Parent = leftPanel
Instance.new("UICorner", avatarImg).CornerRadius = UDim.new(1, 0)

local nameLabel = Instance.new("TextLabel")
nameLabel.Size = UDim2.new(0.9, 0, 0.1, 0)
nameLabel.Position = UDim2.new(0.05, 0, 0.42, 0)
nameLabel.Text = player.DisplayName
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextScaled = true
nameLabel.TextColor3 = Color3.new(1, 1, 1)
nameLabel.BackgroundTransparency = 1
nameLabel.Parent = leftPanel

local function createStatLabel(parent, pos, color)
    local lab = Instance.new("TextLabel")
    lab.Size = UDim2.new(0.9, 0, 0.07, 0)
    lab.Position = pos
    lab.Font = Enum.Font.Code
    lab.TextScaled = true
    lab.TextColor3 = color
    lab.TextXAlignment = Enum.TextXAlignment.Left
    lab.BackgroundTransparency = 1
    lab.Parent = parent
    return lab
end

local pingLabel = createStatLabel(leftPanel, UDim2.new(0.1, 0, 0.52, 0), Color3.fromRGB(255, 200, 0))
local fpsLabel = createStatLabel(leftPanel, UDim2.new(0.1, 0, 0.60, 0), Color3.fromRGB(0, 255, 150))
local ageLabel = createStatLabel(leftPanel, UDim2.new(0.1, 0, 0.68, 0), Color3.fromRGB(0, 180, 255))
local onlineLabel = createStatLabel(leftPanel, UDim2.new(0.1, 0, 0.76, 0), Color3.fromRGB(255, 255, 255))

local checkAdminBtn = Instance.new("TextButton")
checkAdminBtn.Size = UDim2.new(0.85, 0, 0.1, 0)
checkAdminBtn.Position = UDim2.new(0.5, 0, 0.88, 0)
checkAdminBtn.AnchorPoint = Vector2.new(0.5, 0.5)
checkAdminBtn.Text = "KIỂM TRA ADMIN"
checkAdminBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
checkAdminBtn.TextColor3 = Color3.new(1, 1, 1)
checkAdminBtn.Font = Enum.Font.GothamBold
checkAdminBtn.TextScaled = true
checkAdminBtn.Parent = leftPanel
Instance.new("UICorner", checkAdminBtn).CornerRadius = UDim.new(0.2, 0)

local rightPanel = Instance.new("Frame")
rightPanel.Size = UDim2.new(0.45, 0, 1, 0)
rightPanel.Position = UDim2.new(1.03, 0, 0, 0)
rightPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
rightPanel.Parent = mainFrame
Instance.new("UICorner", rightPanel).CornerRadius = UDim.new(0.05, 0)

local function ApplyOptimizations()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    local function OptimizeObj(obj)
        if obj:IsA("Part") or obj:IsA("UnionOperation") or obj:IsA("MeshPart") then
            obj.Material = Enum.Material.Plastic
            obj.Reflectance = 0
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            obj.Transparency = 1
        elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
            obj.Enabled = false
        elseif obj:IsA("PostEffect") or obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("SunRaysEffect") or obj:IsA("ColorCorrectionEffect") then
            obj.Enabled = false
        end
    end
    for _, v in ipairs(game:GetDescendants()) do OptimizeObj(v) end
    workspace.DescendantAdded:Connect(OptimizeObj)
end
task.spawn(ApplyOptimizations)

local function TeleportLow()
    local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local s, res = pcall(function() return HttpService:JSONDecode(game:HttpGet(url)) end)
    if s and res and res.data then
        for _, srv in ipairs(res.data) do
            if srv.id ~= game.JobId and (srv.maxPlayers - srv.playing) >= 4 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, srv.id, player)
                return true
            end
        end
    end
    return false
end

local function RunCheckLogic()
    local overlay = Instance.new("Frame")
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.new(0, 0, 0)
    overlay.BackgroundTransparency = 0.5
    overlay.ZIndex = 10000
    overlay.Parent = screenGui

    local box = Instance.new("Frame")
    box.Size = UDim2.new(0, 300, 0, 300)
    box.Position = UDim2.new(0.5, 0, 0.5, 0)
    box.AnchorPoint = Vector2.new(0.5, 0.5)
    box.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    box.ZIndex = 10001
    box.Parent = overlay
    Instance.new("UICorner", box)

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0.3, 0)
    t.Text = "ADMINCLEGIT BOT"
    t.TextColor3 = Color3.fromRGB(255, 50, 50)
    t.Font = Enum.Font.GothamBold
    t.TextScaled = true
    t.BackgroundTransparency = 1
    t.ZIndex = 10002
    t.Parent = box

    local st = Instance.new("TextLabel")
    st.Size = UDim2.new(0.9, 0, 0.4, 0)
    st.Position = UDim2.new(0.05, 0, 0.4, 0)
    st.Text = "Đang kiểm tra admin.."
    st.TextColor3 = Color3.new(1, 1, 1)
    st.Font = Enum.Font.Gotham
    st.TextScaled = true
    st.BackgroundTransparency = 1
    st.ZIndex = 10002
    st.Parent = box

    task.wait(5)

    local count = 0
    for _, p in ipairs(Players:GetPlayers()) do
        for _, id in ipairs(adminList) do
            if p.UserId == id or p.Name == id then count = count + 1 end
        end
    end

    if count == 0 then
        st.Text = "Không có admin nào trong server"
        task.wait(3)
        overlay:Destroy()
    else
        st.Text = "Chúng tôi phát hiện có " .. count .. " admin, đang dịch chuyển"
        task.wait(3)
        TeleportLow()
        overlay:Destroy()
    end
end

local lowServerBtn = Instance.new("TextButton")
lowServerBtn.Size = UDim2.new(0.9, 0, 0.25, 0)
lowServerBtn.Position = UDim2.new(0.05, 0, 0.1, 0)
lowServerBtn.Text = "TÌM SERVER VẮNG"
lowServerBtn.BackgroundColor3 = Color3.fromRGB(120, 50, 200)
lowServerBtn.TextColor3 = Color3.new(1, 1, 1)
lowServerBtn.Font = Enum.Font.GothamBold
lowServerBtn.TextScaled = true
lowServerBtn.Parent = rightPanel
Instance.new("UICorner", lowServerBtn).CornerRadius = UDim.new(0.2, 0)

local boostBtn = Instance.new("TextButton")
boostBtn.Size = UDim2.new(0.9, 0, 0.25, 0)
boostBtn.Position = UDim2.new(0.05, 0, 0.4, 0)
boostBtn.Text = "BOOST FPS (ON)"
boostBtn.BackgroundColor3 = Color3.fromRGB(200, 150, 0)
boostBtn.TextColor3 = Color3.new(1, 1, 1)
boostBtn.Font = Enum.Font.GothamBold
boostBtn.TextScaled = true
boostBtn.Parent = rightPanel
Instance.new("UICorner", boostBtn).CornerRadius = UDim.new(0.2, 0)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.12, 0)
titleLabel.Position = UDim2.new(0, 0, 0.02, 0)
titleLabel.Text = "ADMINCLEGIT TOOL"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextScaled = true
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = mainFrame

local jobIdBox = Instance.new("TextBox")
jobIdBox.Size = UDim2.new(0.85, 0, 0.18, 0)
jobIdBox.Position = UDim2.new(0.5, 0, 0.45, 0)
jobIdBox.AnchorPoint = Vector2.new(0.5, 0.5)
jobIdBox.PlaceholderText = "Nhập JobId tại đây..."
jobIdBox.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
jobIdBox.TextColor3 = Color3.new(1, 1, 1)
jobIdBox.Font = Enum.Font.Gotham
jobIdBox.TextScaled = true
jobIdBox.Parent = mainFrame
Instance.new("UICorner", jobIdBox).CornerRadius = UDim.new(0.2, 0)

local joinBtn = Instance.new("TextButton")
joinBtn.Size = UDim2.new(0.85, 0, 0.2, 0)
joinBtn.Position = UDim2.new(0.5, 0, 0.72, 0)
joinBtn.AnchorPoint = Vector2.new(0.5, 0.5)
joinBtn.Text = "THAM GIA"
joinBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
joinBtn.TextColor3 = Color3.new(1, 1, 1)
joinBtn.Font = Enum.Font.GothamBold
joinBtn.TextScaled = true
joinBtn.Parent = mainFrame
Instance.new("UICorner", joinBtn).CornerRadius = UDim.new(0.2, 0)

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
closeButton.Position = UDim2.new(1, -2, 0, 2)
closeButton.AnchorPoint = Vector2.new(1, 0)
closeButton.Text = "×"
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextScaled = true
closeButton.Parent = mainFrame
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(1, 0)

task.spawn(function()
    while task.wait(1) do
        local p = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        pingLabel.Text = "Ping: " .. p .. "ms"
        local f = math.floor(1 / RunService.RenderStepped:Wait())
        fpsLabel.Text = "FPS: " .. f
        onlineLabel.Text = "Online: " .. #Players:GetPlayers() .. " / " .. game.Players.MaxPlayers
    end
end)

task.spawn(function()
    while true do
        task.wait(15 * 60)
        RunCheckLogic()
    end
end)

openButton.MouseButton1Click:Connect(function() mainFrame.Visible = true openButton.Visible = false end)
closeButton.MouseButton1Click:Connect(function() mainFrame.Visible = false openButton.Visible = true end)
checkAdminBtn.MouseButton1Click:Connect(RunCheckLogic)

local dragging, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true dragStart = input.Position startPos = mainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)

joinBtn.MouseButton1Click:Connect(function()
    local id = jobIdBox.Text:gsub("%s+", "")
    if #id > 5 then TeleportService:TeleportToPlaceInstance(game.PlaceId, id, player) end
end)

lowServerBtn.MouseButton1Click:Connect(function()
    lowServerBtn.Text = "ĐANG DÒ..."
    TeleportLow()
    task.wait(1)
    lowServerBtn.Text = "TÌM SERVER VẮNG"
end)

boostBtn.MouseButton1Click:Connect(function()
    boostBtn.Text = "ĐANG BOOST..."
    ApplyOptimizations()
    task.wait(1)
    boostBtn.Text = "BOOST FPS (ON)"
end)

addFooter(mainFrame)
addFooter(leftPanel)
addFooter(rightPanel)
