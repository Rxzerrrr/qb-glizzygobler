Please add these when you want to use the resource or it will not work!

Need Support? Join the Discord (https://discord.gg/xpB47JnKmX)

Note I got some of this code from qb-burgershot and B1ackBeard#1430. Hope you enjoy this!

Required interior was not made by me (https://www.gta5-mods.com/maps/mlo-legion-hotdog-stand)

ms-peds is required! (https://github.com/MiddleSkillz/ms-peds)

This resource is inspired by (https://github.com/DrBlackBeard095/qb-burgershot)

Screenshots
![Screenshot 1](https://user-images.githubusercontent.com/73010960/134396186-fdca2cfc-457f-4322-8522-277a1b8c8520.png)
![Screenshot_2](https://user-images.githubusercontent.com/73010960/134396191-05ad5ba4-0152-4e64-bcaa-9d82d5616fc6.png)
![Screenshot_3](https://user-images.githubusercontent.com/73010960/134396196-415c22f1-9c7d-471e-9af3-5187982e0aff.png)
![Screenshot_4](https://user-images.githubusercontent.com/73010960/134396201-14335857-205b-4719-873d-de9e3bcd732f.png)
![Screenshot_5](https://user-images.githubusercontent.com/73010960/134396210-b01728d8-38e7-45c1-96d2-cd74e51e5f69.png)
![Screenshot_6](https://user-images.githubusercontent.com/73010960/134396217-0b5ee670-392b-4775-8470-3c64fec648b5.png)
![Screenshot_7](https://user-images.githubusercontent.com/73010960/134396226-3e81fa75-db8c-4eb0-bb98-d318b38dc3a0.png)
![Screenshot_8](https://user-images.githubusercontent.com/73010960/134396238-9604c7e9-fce3-4c7c-b494-b7a69cf3ddfb.png)

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
