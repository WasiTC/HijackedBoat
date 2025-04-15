local month = tonumber(os.date("%m")) -- %m = month (01-12)
local day = tonumber(os.date("%d"))   -- %d = day (01-31)

if month == 7 and day == 4 then
    local budget = 5000
local totalcost = 250 + 300 + 325 + 400
if budget < totalcost then return end

local qty = math.floor(budget / totalcost)
local items = {"FireworkA", "FireworkB", "FireworkC", "FireworkD"}

local args = {
    [1] = items,
    [2] = qty
}

workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(unpack(args))