isLoggedIn = true

local onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "glizzygobler" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent("qb-glizzygobler:Tray1")
AddEventHandler("qb-glizzygobler:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "glizzytray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "glizzytray1", {
        maxweight = 10000,
        slots = 4,
    })
end)

RegisterNetEvent("qb-glizzygobler:DutyB")
AddEventHandler("qb-glizzygobler:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-glizzygobler:Storage")
AddEventHandler("qb-glizzygobler:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "hotdogstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "hotdogstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-glizzygobler:MakeCookedWienie")
AddEventHandler("qb-glizzygobler:MakeCookedWienie", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            MakeCookedWienie()
        else
            QBCore.Functions.Notify("You don't have any uncooked wienies..", "error")
        end
      end, 'uncookedwienie')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

--Meal Creations
RegisterNetEvent("qb-glizzygobler:hotdog1")
AddEventHandler("qb-glizzygobler:hotdog1", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-glizzygobler:server:get:ingredienthotdog1', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a HotDog..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cookedwienie", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "hotdogbun", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "ketchup", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "hotdog1", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hotdog1"], "add")
                    			QBCore.Functions.Notify("You made a HotDog", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-glizzygobler:hotdog2")
AddEventHandler("qb-glizzygobler:hotdog2", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-glizzygobler:server:get:ingredienthotdog2', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a HotDog..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cookedwienie", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "hotdogbun", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "mustard", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "hotdog2", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hotdog2"], "add")
                    			QBCore.Functions.Notify("You made a HotDog", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

-- Functions --

function MakeCookedWienie()
    TriggerServerEvent('QBCore:Server:RemoveItem', "uncookedwienie", 1)
    QBCore.Functions.Progressbar("pickup", "Cooking the HotDog Wienie..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    },{
        animDict = "amb@prop_human_bbq@male@base",
        anim = "base",
        flags = 8,
    }, {
        model = "prop_cs_fork",
        bone = 28422,
        coords = vector3(-0.005, 0.00, 0.00),
        rotation = vector3(175.0, 160.0, 0.0),
    }    
)
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "cookedwienie", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cookedwienie"], "add")
    QBCore.Functions.Notify("You cooked the wienie", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end 
   
RegisterNetEvent("qb-glizzygobler:shop")
AddEventHandler("qb-glizzygobler:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "glizzygobler", Config.Items)
end)
