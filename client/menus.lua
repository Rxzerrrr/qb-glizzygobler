
-- target
        Citizen.CreateThread(function()
            exports['qb-target']:AddBoxZone("Duty", vector3(39.82, -1005.56, 29.48), 0.8, 1.0, { --39.82, -1005.56, 29.48), 0.8, 1.0, {
                name = "Duty",
                heading = 350,
                debugPoly = true,
                minZ=26.48,
                maxZ=30.48,
            }, {
                options = {
                    {  
                    event = "qb-glizzygobler:DutyB",
                    icon = "far fa-clipboard",
                    label = "Go On/Off Duty",
                    job = "glizzygobler",
                    },
                },
                distance = 4.0
            })
            
            exports['qb-target']:AddBoxZone("Cash-Register1", vector3(44.58, -1005.1, 29.29), 0.5, 0.5, {
                name = "Cash-Register1",
                heading = 340,
                debugPoly = true,
                minZ=25.69,
                maxZ=29.69,
                }, {
                    options = {
                        {  
                        event = "qb-glizzygobler:bill",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "glizzygobler",
                        },
                    },
                distance = 1.5
            })

            exports['qb-target']:AddBoxZone("CashRegister2", vector3(43.2, -1004.66, 29.29), 0.5, 0.5, {
                name = "CashRegister2",
                heading = 342,
                debugPoly = true,
                minZ=25.69,
                maxZ=29.69,
            }, {
                options = {
                    {  
                    event = "qb-glizzygobler:bill",
                    icon = "fas fa-credit-card",
                    label = "Charge Customer",
                    job = "glizzygobler",
                    },
                },
                distance = 1.5
            })
            
            exports['qb-target']:AddBoxZone("Tray1", vector3(40.57, -1003.63, 29.29), 0.4, 0.5, {
                name = "Tray1",
                heading = 342,
                debugPoly = true,
                minZ=25.69,
                maxZ=29.69,
            }, {
                options = {
                    {  
                    event = "qb-glizzygobler:Tray1",
                    icon = "far fa-clipboard",
                    label = "Tray 1",
                    },
                },
                distance = 1.5
            })

            exports['qb-target']:AddBoxZone("MakeHotDogs", vector3(44.82, -1006.54, 29.29), 1.8, 1.0, {
                name = "MakeHotDogs",
                heading = 340,
                debugPoly = true,
                minZ=25.49,
                maxZ=29.49,
            }, {
                options = {
                    {
                    event = "nh-context:HotDogs",
                    icon = "fas fa-hotdog",
                    label = "Make HotDogs",
                    job = "glizzygobler",
                    },
                },
                distance = 1.5
            })

            exports['qb-target']:AddBoxZone("Storage-OrderItems", vector3(43.6, -1008.85, 29.29), 0.4, 1.0, {
                name = "Storage-OrderItems",
                heading = 340,
                debugPoly = true,
                minZ=26.09,
                maxZ=30.09,
            }, {
                options = {
                    {
                    event = "nh-context:OrderMenu1",
                    icon = "fas fa-laptop",
                    label = "Order Ingredients!",
                    job = "glizzygobler",
                    },
                },
                distance = 1.5
            })

            exports['qb-target']:AddBoxZone("Storage-OrderItems", vector3(43.6, -1008.85, 29.29), 0.4, 1.0, {
                name = "Storage-OrderItems",
                heading = 340,
                debugPoly = true,
                minZ=26.09,
                maxZ=30.09,
            }, {
                options = {
                    {
                    event = "nh-context:OrderMenu1",
                    icon = "fas fa-laptop",
                    label = "Order Ingredients!",
                    job = "glizzygobler",
                    },
                },
                distance = 1.5
            })

            exports['qb-target']:AddBoxZone("CookingStation", vector3(42.21, -1008.53, 29.29), 0.9, 1.5, {
                name = "CookingStation",
                heading = 341,
                debugPoly =true,
                minZ=25.49,
                maxZ=29.49,
            }, {
                    options = {
                        {
                            event = "qb-glizzygobler:MakeCookedWienie",
                            icon = "fas fa-fire",
                            label = "Cook The wienies",
                            job = "glizzygobler",
                        },
                    },
                    distance = 1.5
                })
end)

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
            txt = "You need a HotDog Bun , Cooked Wienie , and some Ketchup",
            params = {
                event = "qb-glizzygobler:hotdog1"
            }
        },
        {
            id = 2,
            header = "• HotDog w/ Mustard",
            txt = "You need a HotDog Bun , Cooked Wienie , and some Mustard",
            params = {
                event = "qb-glizzygobler:hotdog2"
            }
        },
        {
            id = 3,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)


RegisterNetEvent('nh-context:OrderMenu1', function(data)
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
                event = "qb-glizzygobler:Storage"
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