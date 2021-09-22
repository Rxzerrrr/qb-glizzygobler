Please add these when you want to use the resource or it will not work!

Need Support? Join the Discord (https://discord.gg/xpB47JnKmX)

Note I got some of this code from qb-burgershot and B1ackBeard#1430. Hope you enjoy this!

Required interior was not made by me (https://www.gta5-mods.com/maps/mlo-legion-hotdog-stand)

ms-peds is required! (https://github.com/MiddleSkillz/ms-peds)

This resource is inspired by (https://github.com/DrBlackBeard095/qb-burgershot)

Preview Coming Soon!

qb-smallresources -> config.lua
```
    ["hotdog1"] = math.random(35, 54),
    ["hotdog2"] = math.random(35, 54),
```

qb-smallresources -> server -> consumables.lua
```
QBCore.Functions.CreateUseableItem("hotdog1", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("hotdog2", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
```

qb-core -> shared.lua
```
	["hotdog1"]                		 = {["name"] = "hotdog1",                 		["label"] = "HotDog w/ Ketchup",                ["weight"] = 50,        ["type"] = "item",      ["image"] = "hotdog1.png",              		    ["unique"] = false, 	["useable"] = true, 	        ["shouldClose"] = true,            ["combinable"] = nil,   		   ["description"] = "I AM EDIBLE... EXCUSE THE GRAMMER AND JUST EAT MEEE!"},
	["hotdog2"]                		 = {["name"] = "hotdog2",                 		["label"] = "HotDog w/ Mustard",                ["weight"] = 50,        ["type"] = "item",      ["image"] = "hotdog2.png",              		    ["unique"] = false, 	["useable"] = true, 	        ["shouldClose"] = true,            ["combinable"] = nil,   		   ["description"] = "I AM EDIBLE... EXCUSE THE GRAMMER AND JUST EAT MEEE!"},
	["hotdogbun"]                	 = {["name"] = "hotdogbun",                 	["label"] = "HotDog Bun",                		["weight"] = 15,        ["type"] = "item",      ["image"] = "hotdogbun.png",              		["unique"] = false, 	["useable"] = true, 	        ["shouldClose"] = true,            ["combinable"] = nil,   		   ["description"] = "You can eat me mf... :)"},
	["mustard"]                		 = {["name"] = "mustard",                 		["label"] = "Mustard",                			["weight"] = 15,        ["type"] = "item",      ["image"] = "mustard.png",              		["unique"] = false, 	["useable"] = false, 	        ["shouldClose"] = true,            ["combinable"] = nil,   		   ["description"] = "I am Mustard"},
	["ketchup"]                		 = {["name"] = "ketchup",                 		["label"] = "Ketchup",                			["weight"] = 15,        ["type"] = "item",      ["image"] = "ketchup.png",              		["unique"] = false, 	["useable"] = false, 	        ["shouldClose"] = true,            ["combinable"] = nil,   		   ["description"] = "I am Ketchup"},
	["uncookedwienie"]               = {["name"] = "uncookedwienie",                ["label"] = "Uncooked Wienie",                	["weight"] = 15,        ["type"] = "item",      ["image"] = "uncookedwienie.png",               ["unique"] = false, 	["useable"] = false, 	        ["shouldClose"] = true,            ["combinable"] = nil,   		   ["description"] = "I'm uncooked please cook me!"},
	["cookedwienie"]                 = {["name"] = "cookedwienie",                 	["label"] = "Cooked Wienie",                	["weight"] = 15,        ["type"] = "item",      ["image"] = "cookedwienie.png",                 ["unique"] = false, 	["useable"] = false, 	        ["shouldClose"] = true,            ["combinable"] = nil,   		   ["description"] = "I'm cooked no eating me without putting me in a bun ;)"},
```

qb-core -> shared.lua
```
["glizzygobler"] = {
		label = "GlizzyGobler Employee",
		defaultDuty = true,
		grades = {
			['0'] = {
				name = "Trainee",
				payment = 150
			},
			['1'] = {
				name = "Employee",
				payment = 290
			},
			['2'] = {
				name = "Glizzy HotDog Maker",
				payment = 315
			},
			['3'] = {
				name = "Manager",
				payment = 345
			},
			['4'] = {
				name = "CEO",
				isboss = true,
				payment = 400
			},
		},
	},
```

qb-target -> config.lua
```
    ["glizzygobler"] = {
        models = {
            "mp_m_execpa_01",
        },
        options = {
            {  
            event = "qb-glizzygobler:DutyB",
            icon = "far fa-clipboard",
            label = "Go On/Off Duty",
            job = "glizzygobler"
            }
        },
        distance = 4.0
    },
```

ms-peds -> config.lua
```
	{
		model = `mp_m_execpa_01`,
		coords = vector4(39.61, -1005.55, 29.48, 69.66),
		gender = 'male',
		scenario = 'WORLD_HUMAN_CLIPBOARD'
	},
```
