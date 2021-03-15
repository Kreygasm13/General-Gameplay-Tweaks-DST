local require = GLOBAL.require
local dishes = require("preparedfoods")
local disheswarly = require("preparedfoods_warly")
local STRINGS = GLOBAL.STRINGS
local wurtmeatpenalty = GetModConfigData("wurtmeatpenalty")
local wormwoodhp = GetModConfigData("wormwoodhp")
local FOODTYPE = GLOBAL.FOODTYPE
local TUNING = GLOBAL.TUNING
local warlymem = GetModConfigData("Warlymem")

makeGoodie = {"icecream", "waffles", "bird_egg","bird_egg_cooked","tallbirdegg","tallbirdegg_cooked", "guacamole", "freshfruitcrepes", "bonesoup", "nightmarepie" }


if GetModConfigData("goodietweak") == true then
for k,v in pairs(makeGoodie) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then
			return inst
		end
	inst.components.edible.foodtype = GLOBAL.FOODTYPE.GOODIES
	end)
end
STRINGS.CHARACTERS.WURT.DESCRIBE.BIRD_EGG_COOKED = "It dead."
STRINGS.CHARACTERS.WURT.DESCRIBE.TALLBIRDEGG_COOKED = "It dead."
STRINGS.CHARACTERS.WURT.DESCRIBE.BONESOUP = "It smells weird, florp."
end

AddPrefabPostInit("wormwood", function(inst)
local function OnEat(inst, food)
	inst.components.eater:SetAbsorptionModifiers(wormwoodhp, 1, 1)
end
	inst:RemoveComponent("eater")
	inst:AddComponent("eater")
	inst.components.eater:SetOnEatFn(OnEat)
end)

if GetModConfigData("monsterfoodbuff") == true then
dishes.monsterlasagna.hunger = 75
dishes.monsterlasagna.health = -10
dishes.monsterlasagna.sanity = -15
disheswarly.monstertartare.hunger = 75
disheswarly.monstertartare.health = 5
disheswarly.monstertartare.sanity = 10
disheswarly.monstertartare.test = function(cooker, names, tags) return (names.monstermeat  == 2 or names.monstermeat_dried  == 2 or names.monstermeat_cooked  == 2 ) and tags.veggie == 1 and tags.egg == 1 end
end

if GetModConfigData("lasagnarecipe") == true then
dishes.monsterlasagna.test = function(cooker, names, tags) return tags.monster and ( names.monstermeat or names.monstermeat_dried or names.monstermeat_cooked ) and ( names.monstermeat >= 2 or names.monstermeat_dried >= 2 or names.monstermeat_cooked  >= 2 ) and not tags.inedibles end
end

if GetModConfigData("webbermonsterfoodbuff") == true then
AddPrefabPostInit("webber", function(inst)
    if inst.components.foodaffinity then
	inst.components.foodaffinity:AddPrefabAffinity  ("monstermeat", 1.33  )
	inst.components.foodaffinity:AddPrefabAffinity  ("cookedmonstermeat", 1.335  )
	inst.components.foodaffinity:AddPrefabAffinity  ("monstermeat_dried", 1.335  )
	inst.components.foodaffinity:AddPrefabAffinity  ("monsterlasagna", 2  )
	inst.components.foodaffinity:AddPrefabAffinity  ("monstertartare", 2  )
end
end)
end

if GetModConfigData("preparedfoodbuff") == true then
dishes.fruitmedley.sanity = 25
dishes.fruitmedley.hunger = 45
dishes.fruitmedley.perishtime = TUNING.PERISH_FAST* 2
dishes.waffles.hunger = 45
dishes.waffles.sanity = 15
dishes.waffles.perishtime = TUNING.PERISH_FAST* 2
dishes.pumpkincookie.sanity = 20
dishes.pumpkincookie.hunger = 45
dishes.perogies.hunger = 45
dishes.unagi.hunger = 37.5
dishes.guacamole.hunger = 50
dishes.hotchili.hunger = 75
dishes.surfnturf.sanity = 30
dishes.surfnturf.hunger = 45
dishes.lobsterdinner.hunger = 45
dishes.trailmix.hunger = 25
dishes.trailmix.health = 25
dishes.icecream.hunger = 37.25
dishes.icecream.perishtime = TUNING.PERISH_SUPERFAST* 3
dishes.seafoodgumbo.sanity = 20
dishes.seafoodgumbo.hunger = 50
dishes.seafoodgumbo.health = 35	
dishes.sweettea.hunger = 10
dishes.sweettea.health = 10
dishes.sweettea.sanity = 30
dishes.salsa.hunger = 32.5
dishes.salsa.health = 5
dishes.salsa.sanity = 30
dishes.frogglebunwich.hunger = 50
dishes.fishtacos.hunger = 50
dishes.ratatouille.health = 5
dishes.ratatouille.hunger = 32.5
dishes.watermelonicle.hunger = 17.5
dishes.watermelonicle.health = 5
dishes.watermelonicle.perishtime = TUNING.PERISH_SUPERFAST* 3
dishes.flowersalad.hunger = 25
dishes.flowersalad.perishtime = TUNING.PERISH_FAST* 2
dishes.taffy.hunger = 22.5
dishes.taffy.health = 0
dishes.taffy.sanity = 20
dishes.turkeydinner.health = 20
dishes.turkeydinner.perishtime = TUNING.PERISH_FAST* 2
dishes.jellybean.sanity = 20
dishes.jellybean.hunger = 12.25
dishes.leafymeatsouffle.hunger = 56,25
dishes.leafymeatsouffle.perishtime = TUNING.PERISH_FAST* 2
dishes.shroomcake.hunger = 50
dishes.stuffedeggplant.sanity = 10
dishes.stuffedeggplant.hunger = 45
dishes.stuffedeggplant.health = 15
dishes.leafymeatburger.sanity = 30
dishes.leafymeatburger.hunger = 45
dishes.lobsterbisque.hunger = 37.5
dishes.vegstinger.sanity = 25
dishes.vegstinger.hunger = 37.5
dishes.vegstinger.health = 10
dishes.leafymeatburger.sanity = 30
dishes.leafymeatburger.hunger = 40
dishes.leafymeatburger.perishtime = TUNING.PERISH_FAST* 2
dishes.pepperpopper.hunger = 37.5
dishes.asparagussoup.hunger = 37.5
dishes.bananapop.sanity = 30
dishes.bananapop.hunger = 25
dishes.ceviche.sanity = 10
dishes.ceviche.hunger = 37.5
disheswarly.gazpacho.hunger = 50
disheswarly.nightmarepie.hunger = 37.5
disheswarly.dragonchilisalad.hunger = 21.875
disheswarly.dragonchilisalad.health = 0
disheswarly.potatosouffle.hunger = 60
disheswarly.frogfishbowl.hunger = 50
disheswarly.frogfishbowl.health = 10
disheswarly.frogfishbowl.sanity = 0
end

if GetModConfigData("omnivorewurt") == true then
AddPrefabPostInit("wurt", function(inst)
    if inst.components.foodaffinity then
    inst:RemoveComponent("eater")
    inst:AddComponent("eater")
	end
	end)
	
	AddPrefabPostInit("wurt", function(inst)

local function calculateFoodValues(player, food)

	local changesweremade = false
	
	local healthval, hungerval, sanityval = 0, 0, 0
	
	
	local edible_comp = food.components.edible
	
	if edible_comp and edible_comp.foodtype == "MEAT" then
		changesweremade = true
		
		healthval = edible_comp.healthvalue
		sanityval = edible_comp.sanityvalue
		hungerval = edible_comp.hungervalue * wurtmeatpenalty
	end
	

	return changesweremade, healthval, hungerval, sanityval
end

local old_Eat = inst.components.eater.Eat
inst.components.eater.Eat =  function(self, food)

	local edible_comp = food.components.edible


	local changesweremade = false
	

	if edible_comp then

		local healthval, hungerval, sanityval
		
		changesweremade, healthval, hungerval, sanityval = calculateFoodValues(self.inst, food)
		
		if changesweremade then
			edible_comp.originalhealthvalue = edible_comp.healthvalue
			edible_comp.originalhungervalue = edible_comp.hungervalue
			edible_comp.originalsanityvalue = edible_comp.sanityvalue
			
			edible_comp.healthvalue = healthval
			edible_comp.hungervalue = hungerval
			edible_comp.sanityvalue = sanityval
		end
	end
	
	local returnvalue = old_Eat(self, food)
	
	if food:IsValid() and changesweremade then
		edible_comp.healthvalue = edible_comp.originalhealthvalue
		edible_comp.hungervalue = edible_comp.originalhungervalue
		edible_comp.sanityvalue = edible_comp.originalsanityvalue
		
		edible_comp.originalhealthvalue = nil
		edible_comp.originalhungervalue = nil
		edible_comp.originalsanityvalue = nil
	end
	
	return returnvalue
end

inst.FoodValuesChanger = function(player, food)
	local changesweremade, healthval, hungerval, sanityval = calculateFoodValues(food)
	if changesweremade then
		return healthval, hungerval, sanityval
	end
	local e = food.components.edible
	return e.healthvalue, e.hungervalue, e.sanityvalue
end
end)
	
AddPrefabPostInit("wurt", function(inst)
    if inst.components.foodaffinity then
	inst.components.eater:SetOnEatFn(OnEat)
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

if GetModConfigData("Crockonly") == true or false then
TUNING.WARLY_SAME_OLD_COOLDOWN = TUNING.TOTAL_DAY_TIME * warlymem
end

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

if GetModConfigData("nowarly") == true then
local warly_foods = require("preparedfoods_warly")

for _, recipe in pairs(warly_foods) do
    for i,v in pairs(recipe.tags) do
        if v == "masterfood" then
            table.remove(recipe.tags, i)
            break
        end
    end
	AddCookerRecipe("cookpot", recipe)
	AddCookerRecipe("archive_cookpot", recipe)
end
end