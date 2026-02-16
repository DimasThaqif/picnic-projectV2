--!strict

local Players = game:GetService("Players")

type ItemName = "Flower" | "Apple" | "Berry"

type Inventory = {
    [ItemName]: number
}

local playerInventories: {[Player]: Inventory} = {}

local function createInventory(): Inventory
    return {
        Flower = 0,
        Apple = 0,
        Berry = 0,
    }
end

local function setupPlayer(player: Player)
    playerInventories[player] = createInventory()
    print(player.Name .. " inventory created")
end

local function cleanupPlayer(player: Player)
    playerInventories[player] = nil
end

Players.PlayerAdded:Connect(setupPlayer)
Players.PlayerRemoving:Connect(cleanupPlayer)

-- TEST sementara
task.wait(2)
for _, player in Players:GetPlayers() do
    local inv = playerInventories[player]
    if inv then
        inv.Flower += 5
        print("Flowers:", inv.Flower)
    end
end
