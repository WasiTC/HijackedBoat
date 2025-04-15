local budget = 5000
local totalcost = 1275
if budget < totalcost then return end

local qty = math.floor(budget / totalcost)

local args = {
    [1] = "WoodBlock",
    [2] = qty
}

workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(unpack(args))
task.wait(5)
local args = {
    [1] = "TitaniumBlock",
    [2] = qty
}

workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(unpack(args))
task.wait(5)
local args = {
    [1] = "PlasticBlock",
    [2] = qty
}

workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(unpack(args))
task.wait(5)
local args = {
    [1] = "MetalBlock",
    [2] = qty
}

workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(unpack(args))