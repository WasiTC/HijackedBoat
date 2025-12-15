-- Hijacked Story Hub - CodeWare UI - IMPROVED VERSION

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/PlayerZN-Gaming/PlayerZN----Roblox-UI-Libraries/refs/heads/main/CodewareLib"))()
local win = ui:CreateWindow("[⭐] Hijacked Story Hub")

local items    = win:AddTab("Items")
local roles    = win:AddTab("Roles")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- ========= ITEMS TAB =========
items:AddLabel("Food Items")
local foodList = {"Chips", "BloxyCola", "Apple", "Pizza3", "Cookie", "Lollipop"}
local selectedFood = foodList[1]
items:AddDropdown("Select Food", foodList, function(v) 
    selectedFood = v
    selectedCategory = "food"
    selectedItem = v
end)

items:AddLabel("Weapons")
local weaponList = {"Bat", "LinkedSword", "TeddyBloxpin", "Hammer"}
local selectedWeapon = weaponList[1]
items:AddDropdown("Select Weapon", weaponList, function(v) 
    selectedWeapon = v
    selectedCategory = "weapon"
    selectedItem = v
end)

items:AddLabel("Other Items")
local otherList = {"MedKit", "Cure", "Key", "Plank"}
local selectedOther = otherList[1]
items:AddDropdown("Select Other", otherList, function(v) 
    selectedOther = v
    selectedCategory = "other"
    selectedItem = v
end)

-- Track the last selected item and category
local selectedItem = selectedFood
local selectedCategory = "food"

items:AddLabel("→ Spawn Selected Item")
items:AddButton("Spawn Item", "Gives the selected item", function()
    if selectedItem then
        if selectedItem == "Hammer" then
            ReplicatedStorage.RemoteEvents.BasementWeapon:FireServer(true, "Hammer")
        else
            ReplicatedStorage.RemoteEvents.GiveTool:FireServer(selectedItem)
        end
        
        game.StarterGui:SetCore("SendNotification",{
            Title = "Item Spawned!";
            Text = selectedItem .. " (" .. selectedCategory .. ")";
            Duration = 2;
        })
    end
end)

-- ========= ROLES TAB =========
roles:AddLabel("Outside Roles")
roles:AddButton("Police Role", "Gun + Police", function() ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Gun", true) end)
roles:AddButton("SWAT Role", "SWAT Gun", function() ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("SwatGun", true) end)
roles:AddButton("Hungry Role", "Chips + Role", function()
    ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Hungry", true)
    ReplicatedStorage.RemoteEvents.GiveTool:FireServer("bag of chips")
end)
roles:AddButton("Fighter Role", "Toy Sword", function()
    ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Fighter", true)
    ReplicatedStorage.RemoteEvents.GiveTool:FireServer("toy sword")
end)
roles:AddButton("Hyper Role", "Lollipop + Speed", function()
    ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Hyper", true)
    ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Lollipop")
end)