isLoggedIn = true

local onDuty = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	if PlayerData.job.onduty then
	    if PlayerData.job.name == "glizzygobler" then
		TriggerServerEvent("QBCore:ToggleDuty")
	    end
	end
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    if PlayerData.job.name == 'glizzygobler' then
    	onDuty = duty
    end
end)

Citizen.CreateThread(function()
    GlizzyGobler = AddBlipForCoord(-1197.32, -897.655, 13.995)
    SetBlipSprite (GlizzyGobler, 106)
    SetBlipDisplay(GlizzyGobler, 4)
    SetBlipScale  (GlizzyGobler, 0.5)
    SetBlipAsShortRange(GlizzyGobler, true)
    SetBlipColour(GlizzyGobler, 75)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("GlizzyGobler")
    EndTextCommandSetBlipName(GlizzyGobler)
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

RegisterNetEvent("qb-glizzygobler:Storage2")
AddEventHandler("qb-glizzygobler:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "hotdogstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "hotdogstorage2", {
        maxweight = 250000,
        slots = 40,
    })
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
					TriggerServerEvent('QBCore:Server:RemoveItem', "cooked-wienie", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "hotdog-bun", 1)
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
AddEventHandler("qb-glizzygobler:hotdog1", function()
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
					TriggerServerEvent('QBCore:Server:RemoveItem', "cooked-wienie", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "hotdog-bun", 1)
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
    TriggerServerEvent('QBCore:Server:RemoveItem', "uncooked-wienie", 1)
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
    TriggerServerEvent('QBCore:Server:AddItem', "cooked-wienie", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cooked-wienie"], "add")
    QBCore.Functions.Notify("You cooked the wienie", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end 
   
RegisterNetEvent("qb-glizzygobler:shop")
AddEventHandler("qb-glizzygobler:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "glizzygobler", Config.Items)
end)