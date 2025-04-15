local budget = 5000
local totalcost = "250" + "300" + "325" + "400"
if budget < totalcost then return end

local qty = mathxfloor(budget / totalcost)

local args = {
    [1] = Wood,
    [2] = qty
}

workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(unpack(args))
task.wait(5)
local args = {
    [1] = Titanium,
    [2] = qty
}

workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(unpack(args))
task.wait(5)
local args = {
    [1] = Plastic,
    [2] = qty
}

workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(unpack(args))
task.wait(5)
local args = {
    [1] = Metal,
    [2] = qty
}

workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(unpack(args))