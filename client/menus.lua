
-- target


-- NH - Context --

RegisterNetEvent('nh-context:HotDogs', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Available HotDogs |",
            txt = "",
        },
        {
            id = 1,
            header = "• HotDog w/ Ketchup",
            txt = "HotDog Bun , Cooked Wienie , Ketchup",
            params = {
                event = "qb-glizzygobler:hotdog1"
            }
        },
        {
            id = 2,
            header = "• HotDog w/ Mustard",
            txt = "HotDog Bun , Cooked Wienie , Mustard",
            params = {
                event = "qb-glizzygobler:hotdog2"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)


RegisterNetEvent('nh-context:OrderMenu', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Fridge |",
            txt = "",
        },
        {
            id = 1,
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "qb-glizzygobler:shop"
            }
        },
        {
            id = 2,
            header = "• Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "qb-glizzygobler:Storage2"
            }
        },
        {
            id = 3,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("qb-glizzygobler:bill")
AddEventHandler("qb-glizzygobler:bill", function()
    local bill = exports["nh-keyboard"]:KeyboardInput({
        header = "Create Receipt",
        rows = {
            {
                id = 0,
                txt = "Server ID"
            },
            {
                id = 1,
                txt = "Amount"
            }
        }
    })
    if bill ~= nil then
        if bill[1].input == nil or bill[2].input == nil then 
            return 
        end
        TriggerServerEvent("qb-glizzygobler:bill:player", bill[1].input, bill[2].input)
    end
end)