RegisterServerEvent("qb-glizzygobler:bill:player")
AddEventHandler("qb-glizzygobler:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'glizzygobler' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                       if Config.SQL == 'oxmysql' then
                        exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        else
                          exports.ghmattimysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname
                           })
                       end
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

QBCore.Functions.CreateCallback('qb-glizzygobler:server:get:ingredienthotdog1', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cookedwienie = Ply.Functions.GetItemByName("cookedwienie")
    local hotdogbun = Ply.Functions.GetItemByName("hotdogbun")
    local ketchup = Ply.Functions.GetItemByName("ketchup")
    if cookedwienie ~= nil and hotdogbun ~= nil and ketchup ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-glizzygobler:server:get:ingredienthotdog2', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cookedwienie = Ply.Functions.GetItemByName("cookedwienie")
    local hotdogbun = Ply.Functions.GetItemByName("hotdogbun")
    local mustard = Ply.Functions.GetItemByName("mustard")
    if cookedwienie ~= nil and hotdogbun ~= nil and mustard ~= nil then
        cb(true)
    else
        cb(false)
    end
end)