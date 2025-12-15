--[[
    ⭐ HIJACKED STORY ⭐
    Custom UI Built from Scratch (No External Libraries)
    Premium Dark Theme | Draggable | Optimized
]]

-- // SERVICES
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- // UI SETUP
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HijackedStoryGUI"
ScreenGui.ResetOnSpawn = false

-- Attempt to protect GUI from game detection/clearing (Executor dependent)
if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end

-- // MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 480, 0, 320)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(60, 60, 60)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

-- // TITLE BAR
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

local TitleCover = Instance.new("Frame")
TitleCover.Size = UDim2.new(1, 0, 0, 10)
TitleCover.Position = UDim2.new(0, 0, 1, -10)
TitleCover.BackgroundColor3 = TitleBar.BackgroundColor3
TitleCover.BorderSizePixel = 0
TitleCover.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -20, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Hijacked Story"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 20
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

-- // NOTIFICATION SYSTEM
local function notify(msg)
    task.spawn(function()
        local notif = Instance.new("TextLabel")
        notif.Text = msg
        notif.Size = UDim2.new(1, -40, 0, 30)
        notif.Position = UDim2.new(0, 20, 1, 10)
        notif.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        notif.TextColor3 = Color3.fromRGB(255, 255, 255)
        notif.Font = Enum.Font.Gotham
        notif.TextSize = 14
        notif.Parent = MainFrame
        notif.ZIndex = 10
        
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, 6)
        c.Parent = notif
        
        notif:TweenPosition(UDim2.new(0, 20, 1, -40), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3)
        task.wait(2)
        notif:TweenPosition(UDim2.new(0, 20, 1, 10), Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.3)
        task.wait(0.3)
        notif:Destroy()
    end)
end

-- // LOGIC FUNCTIONS
local function spawnItem(item)
    if not item then return end
    if item == "Hammer" then
        ReplicatedStorage.RemoteEvents.BasementWeapon:FireServer(true, "Hammer")
    else
        ReplicatedStorage.RemoteEvents.GiveTool:FireServer(item)
    end
    notify("Spawned: " .. item)
end

local function setRole(roleName, itemName)
    ReplicatedStorage.RemoteEvents.OutsideRole:FireServer(roleName, true)
    if itemName then
        ReplicatedStorage.RemoteEvents.GiveTool:FireServer(itemName)
    end
    notify("Role Set: " .. roleName)
end

-- // SIDEBAR (TABS)
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 120, 1, -45)
TabContainer.Position = UDim2.new(0, 0, 0, 45)
TabContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
TabContainer.BorderSizePixel = 0
TabContainer.Parent = MainFrame

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 10)
TabCorner.Parent = TabContainer

local TabCoverTop = Instance.new("Frame")
TabCoverTop.Size = UDim2.new(1, 0, 0, 10)
TabCoverTop.Position = UDim2.new(0, 0, 0, 0)
TabCoverTop.BackgroundColor3 = TabContainer.BackgroundColor3
TabCoverTop.BorderSizePixel = 0
TabCoverTop.Parent = TabContainer

local TabCoverRight = Instance.new("Frame")
TabCoverRight.Size = UDim2.new(0, 10, 1, 0)
TabCoverRight.Position = UDim2.new(1, -5, 0, 0)
TabCoverRight.BackgroundColor3 = TabContainer.BackgroundColor3
TabCoverRight.BorderSizePixel = 0
TabCoverRight.Parent = TabContainer

-- // CONTENT AREA
local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -135, 1, -60)
ContentContainer.Position = UDim2.new(0, 130, 0, 55)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

local Pages = {}
local Tabs = {}

local function createPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 4
    page.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 90)
    page.Visible = false
    page.Parent = ContentContainer
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 8)
    layout.Parent = page
    
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.Parent = page
    
    return page
end

Pages.Items = createPage("Items")
Pages.Roles = createPage("Roles")
Pages.Items.Visible = true

local function createSection(text, parent)
    local label = Instance.new("TextLabel")
    label.Text = text:upper()
    label.Size = UDim2.new(1, 0, 0, 25)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(150, 150, 160)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = parent
end

local function createItemRow(name, itemsList, parent)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    frame.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local currentIdx = 1
    
    local selectBtn = Instance.new("TextButton")
    selectBtn.Size = UDim2.new(0.7, -10, 1, -10)
    selectBtn.Position = UDim2.new(0, 5, 0, 5)
    selectBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    selectBtn.Text = itemsList[currentIdx]
    selectBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectBtn.Font = Enum.Font.GothamSemibold
    selectBtn.TextSize = 13
    selectBtn.Parent = frame
    
    local sCorner = Instance.new("UICorner")
    sCorner.CornerRadius = UDim.new(0, 4)
    sCorner.Parent = selectBtn
    
    selectBtn.MouseButton1Click:Connect(function()
        currentIdx = currentIdx + 1
        if currentIdx > #itemsList then currentIdx = 1 end
        selectBtn.Text = itemsList[currentIdx]
    end)
    
    local spawnBtn = Instance.new("TextButton")
    spawnBtn.Size = UDim2.new(0.3, -5, 1, -10)
    spawnBtn.Position = UDim2.new(0.7, 5, 0, 5)
    spawnBtn.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
    spawnBtn.Text = "GET"
    spawnBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    spawnBtn.Font = Enum.Font.GothamBold
    spawnBtn.TextSize = 12
    spawnBtn.Parent = frame
    
    local spCorner = Instance.new("UICorner")
    spCorner.CornerRadius = UDim.new(0, 4)
    spCorner.Parent = spawnBtn
    
    spawnBtn.MouseButton1Click:Connect(function()
        spawnItem(selectBtn.Text)
    end)
end

local function createRoleButton(roleName, subText, callback, parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    btn.Text = ""
    btn.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    
    local title = Instance.new("TextLabel")
    title.Text = roleName
    title.Size = UDim2.new(1, -15, 0.5, 0)
    title.Position = UDim2.new(0, 10, 0, 4)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = btn
    
    local desc = Instance.new("TextLabel")
    desc.Text = subText
    desc.Size = UDim2.new(1, -15, 0.4, 0)
    desc.Position = UDim2.new(0, 10, 0.5, 0)
    desc.BackgroundTransparency = 1
    desc.TextColor3 = Color3.fromRGB(160, 160, 170)
    desc.Font = Enum.Font.Gotham
    desc.TextSize = 11
    desc.TextXAlignment = Enum.TextXAlignment.Left
    desc.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        callback()
    end)
end

createSection("Consumables", Pages.Items)
createItemRow("Food", {"Chips", "BloxyCola", "Apple", "Pizza3", "Cookie", "Lollipop"}, Pages.Items)
createSection("Weaponry", Pages.Items)
createItemRow("Weapons", {"Bat", "LinkedSword", "TeddyBloxpin", "Hammer"}, Pages.Items)
createSection("Utilities", Pages.Items)
createItemRow("Items", {"MedKit", "Cure", "Key", "Plank"}, Pages.Items)

createSection("Select a Role", Pages.Roles)
createRoleButton("Police Officer", "Equip Gun Role", function() setRole("Gun") end, Pages.Roles)
createRoleButton("SWAT Unit", "Equip SwatGun Role", function() setRole("SwatGun") end, Pages.Roles)
createRoleButton("Hungry Person", "Chips + Hungry Role", function() setRole("Hungry", "bag of chips") end, Pages.Roles)
createRoleButton("Fighter", "Toy Sword + Fighter Role", function() setRole("Fighter", "toy sword") end, Pages.Roles)
createRoleButton("Hyper Kid", "Lollipop + Hyper Role", function() setRole("Hyper", "Lollipop") end, Pages.Roles)

local function createTab(name, page)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    btn.BackgroundTransparency = 1
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(150, 150, 150)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 14
    btn.Parent = TabContainer
    
    if not TabContainer:FindFirstChild("Layout") then
        local l = Instance.new("UIListLayout")
        l.Name = "Layout"
        l.Padding = UDim.new(0, 5)
        l.HorizontalAlignment = Enum.HorizontalAlignment.Center
        l.SortOrder = Enum.SortOrder.LayoutOrder
        l.Parent = TabContainer
        
        local p = Instance.new("UIPadding")
        p.PaddingTop = UDim.new(0, 10)
        p.Parent = TabContainer
    end
    
    local indicator = Instance.new("Frame")
    indicator.Name = "Indicator"
    indicator.Size = UDim2.new(0, 3, 0.6, 0)
    indicator.Position = UDim2.new(0, 0, 0.2, 0)
    indicator.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
    indicator.BackgroundTransparency = 1
    indicator.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(Tabs) do
            t.TextColor3 = Color3.fromRGB(150, 150, 150)
            t.Indicator.BackgroundTransparency = 1
        end
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        indicator.BackgroundTransparency = 0
        
        for _, p in pairs(Pages) do p.Visible = false end
        page.Visible = true
    end)
    
    table.insert(Tabs, btn)
    return btn
end

local tab1 = createTab("Items", Pages.Items)
local tab2 = createTab("Roles", Pages.Roles)

tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
tab1.Indicator.BackgroundTransparency = 0

local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)