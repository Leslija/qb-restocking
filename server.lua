RegisterNetEvent('police:server:restock', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Config.restockItems) do
        for k1, v1 in pairs(v) do
            if Player.PlayerData.job.name == "police" and Player.PlayerData.job.grade.level == k then
                
                local currentStock = 0
                local hasItem = Player.Functions.GetItemByName(k1)
                if hasItem ~= nil then
                    currentStock = hasItem.amount
                end

                if currentStock < v1 then
                    Player.Functions.AddItem(k1, v1 - currentStock)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[k1], "add")
                end
            end
        end
     end
     Wait(100)
 end)