local require = GLOBAL.require
local dishes = require("preparedfoods")
local disheswarly = require("preparedfoods_warly")
local STRINGS = GLOBAL.STRINGS
local FOODTYPE = GLOBAL.FOODTYPE

if GetModConfigData("monsterfoodbuff") == true then
dishes.monsterlasagna.hunger = 75
disheswarly.monstertartare.hunger = 75
disheswarly.monstertartare.health = 5
disheswarly.monstertartare.sanity = 10
disheswarly.monstertartare.test = function(cooker, names, tags) return tags.monster and tags.monster == 2 and tags.veggie == 1 and tags.egg == 1 end
end

if GetModConfigData("VanillaCrockBuff") == true then
dishes.fruitmedley.hunger = TUNING.CALORIES_LARGE
dishes.fruitmedley.sanity = TUNING.SANITY_TINY * 2
dishes.fruitmedley.hunger = TUNING.CALORIES_HUGE
dishes.fruitmedley.perishtime = TUNING.PERISH_SLOW
dishes.unagi.hunger = TUNING.CALORIES_LARGE
dishes.guacamole.sanity = TUNING.SANITY_TINY
dishes.guacamole.hunger = TUNING.CALORIES_HUGE*1.5
dishes.guacamole.health = TUNING.HEALING_SMALL
dishes.hotchili.hunger = TUNING.CALORIES_SMALL*5
end

if GetModConfigData("omnivorewurt") == true then
AddPrefabPostInit("wurt", function(inst)
    if inst.components.foodaffinity then
    inst:RemoveComponent("eater")
    inst:AddComponent("eater")
	end
end)
end

if GetModConfigData("keepwurtveggieaffinity") == false and GetModConfigData("omnivorewurt") == true then
AddPrefabPostInit("wurt", function(inst)
	if inst.components.foodaffinity then
	inst:RemoveComponent("foodaffinity")
	end
end)
end

if GetModConfigData("omnivorewathgrithr") == true then
AddPrefabPostInit("wathgrithr", function(inst)
    if inst.components.foodaffinity then
    inst:RemoveComponent("eater")
    inst:AddComponent("eater")
	end
end)
end

if GetModConfigData("wortoxpomegranate") == true and GetModConfigData("Crockonly") == false then
AddPrefabPostInit("wortox", function(inst)
	if inst.components.foodaffinity then
    inst.components.foodaffinity:AddPrefabAffinity  ("pomegranate", 3.9  )
	inst.components.foodaffinity:AddPrefabAffinity  ("pomegranate_cooked", 3.3  )
	end
end)
end

local warlymem = GetModConfigData("Warlymem")

TUNING.WARLY_SAME_OLD_COOLDOWN = TUNING.TOTAL_DAY_TIME * warlymem

if GetModConfigData("Crockonly") == true then
AddPrefabPostInitAny(function(inst)
    if inst:HasTag("player") and inst.components.eater ~= nil then
        inst.components.eater:SetPrefersEatingTag("preparedfood")
        inst.components.eater:SetPrefersEatingTag("pre-preparedfood")
    end
end)

AddPrefabPostInit("gears", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	local edible = inst.components.edible
	inst:AddTag("preparedfood")
end)

AddPrefabPostInit("wortox_soul", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	local edible = inst.components.edible
	inst:AddTag("preparedfood")
end)

AddPrefabPostInit("mandrake", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	local edible = inst.components.edible
	inst:AddTag("preparedfood")
end)
end

if GetModConfigData("Mercycrock") == true and GetModConfigData("Crockonly") == true then
	if GetModConfigData("portableforeveryone") == true then
	local OnPlayerSpawn = function(src, player)
		player.prev_terra_OnNewSpawn = player.OnNewSpawn
		player.OnNewSpawn = function()
   
			local start_items = {}
        
			for i = 1, 1 do table.insert(start_items, "portablecookpot_item") end

			for k,v in pairs(start_items) do
				local item = GLOBAL.SpawnPrefab(v)
            
				player.components.inventory:GiveItem(item)
			end   
         
			if player.prev_OnNewSpawn ~= nil then
				player:prev_OnNewSpawn()
				player.prev_OnNewSpawn = nil
				end
			end
		end
	
	local function ListenForPlayers(inst)
		if GLOBAL.TheWorld.ismastersim then
			inst:ListenForEvent("ms_playerspawn", OnPlayerSpawn)
		end
	end

	AddPrefabPostInit("world", ListenForPlayers)

else

	local OnPlayerSpawn = function(src, player)
		player.prev_terra_OnNewSpawn = player.OnNewSpawn
		player.OnNewSpawn = function()
   
			local start_items = {}
        
			for i = 1, 6 do table.insert(start_items, "twigs") end
			for i = 1, 6 do table.insert(start_items, "charcoal") end
			for i = 1, 3 do table.insert(start_items, "cutstone") end
			for i = 1, 1 do table.insert(start_items, "cookpot_blueprint") end
			for i = 1, 1 do table.insert(start_items, "cutstone_blueprint") end

			for k,v in pairs(start_items) do
				local item = GLOBAL.SpawnPrefab(v)
            
				player.components.inventory:GiveItem(item)
			end   
         
			if player.prev_OnNewSpawn ~= nil then
				player:prev_OnNewSpawn()
				player.prev_OnNewSpawn = nil
				end
			end
		end
	
	local function ListenForPlayers(inst)
		if GLOBAL.TheWorld.ismastersim then
			inst:ListenForEvent("ms_playerspawn", OnPlayerSpawn)
		end
	end

	AddPrefabPostInit("world", ListenForPlayers)

	end

end

if GetModConfigData("portableforeveryone") == true then
AddPlayerPostInit(function(player)
	player:AddTag("masterchef")
	player:AddTag("professionalchef")
end)
end

if GetModConfigData("disableportablegenericquotes") == true and GetModConfigData("portableforeveryone") == true then
STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.WINONA.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.WALTER.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.WORTOX.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.WOODIE.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.WAXWELL.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.WX78.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.WENDY.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.WURT.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.WEBBER.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.WORMWOOD.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.WOLFGANG.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.WILLOW.ANNOUNCE_EAT.GENERIC = ""
STRINGS.CHARACTERS.GENERIC.ANNOUNCE_EAT.GENERIC = ""
end