local require = GLOBAL.require
local dishes = require("preparedfoods")
local disheswarly = require("preparedfoods_warly")
local STRINGS = GLOBAL.STRINGS
local wurtmeatpenalty = GetModConfigData("wurtmeatpenalty")
local wormwoodhp = GetModConfigData("wormwoodhp")
local FOODTYPE = GLOBAL.FOODTYPE
local TUNING = GLOBAL.TUNING
local warlymem = GetModConfigData("Warlymem")

-- Code is rewritten from ground up. Documenentation has been made to help people and other modders to understand the code. --

makeGoodie = {"icecream", "waffles", "bird_egg","bird_egg_cooked","tallbirdegg","tallbirdegg_cooked", "guacamole", "freshfruitcrepes", "bonesoup", "nightmarepie" }

if GetModConfigData("goodietweak") == true then
for k,v in pairs(makeGoodie) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then -- Checks if it's a master simulated world aka a server or not.
			return inst
		end
	inst.components.edible.foodtype = GLOBAL.FOODTYPE.GOODIES -- Adds Food Type "Goodie"
	end)
end
end



if GetModConfigData("goodietweak") == true and GetModConfigData("goodietweakquotechanges") == true then
STRINGS.CHARACTERS.WURT.DESCRIBE.BIRD_EGG_COOKED = "It dead." -- Directly Changes the quote for it.
STRINGS.CHARACTERS.WURT.DESCRIBE.TALLBIRDEGG_COOKED = "It dead." -- Directly Changes the quote for it.
STRINGS.CHARACTERS.WURT.DESCRIBE.BONESOUP = "It smells weird, florp." -- Directly Changes the quote for it.
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



if GetModConfigData("webbermonsterfoodbuff") == true then
AddPrefabPostInit("webber", function(inst) -- Locks in Webber.
    if inst.components.foodaffinity then
	inst.components.foodaffinity:AddPrefabAffinity  ("monstermeat", 1.335  )
	inst.components.foodaffinity:AddPrefabAffinity  ("cookedmonstermeat", 1.335  )
	inst.components.foodaffinity:AddPrefabAffinity  ("monstermeat_dried", 1.335  )
	inst.components.foodaffinity:AddPrefabAffinity  ("monsterlasagna", 2  )
	inst.components.foodaffinity:AddPrefabAffinity  ("monstertartare", 2  )
end
end)
end



if GetModConfigData("preparedfoodbuff") == true then
-- Documentation --
-- dishes.foodname.health ==> Changes how food affects Health Points
-- dishes.foodname.hunger ==> Changes how food affects Hunger Points
-- dishes.foodname.sanity ==> Changes how food affects Sanity Points
-- dishes.foodname.perishtime ==> Changes foods perish time.
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



if GetModConfigData("omnivorewurt") == true then -- Code is long as hell made using a guide.
AddPrefabPostInit("wurt", function(inst)
    if inst.components.foodaffinity then
    inst:RemoveComponent("eater")
    inst:AddComponent("eater")
	end
	end)
	
	AddPrefabPostInit("wurt", function(inst)
	if GLOBAL.TheWorld.ismastersim then


local function calculateFoodValues(player, food)

	local changesweremade = false
	
	local healthval, hungerval, sanityval = 0, 0, 0
	
	
	local edible_comp = food.components.edible
	
	if edible_comp and edible_comp.foodtype == "MEAT" then
		changesweremade = true
		
		healthval = edible_comp.healthvalue
		sanityval = edible_comp.sanityvalue
		hungerval = edible_comp.hungervalue * wurtmeatpenalty   -- Penalties to meat apply here only as hunger restoration.
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

-- Currently Deprecated "Show Me" Code --

--  inst.FoodValuesChanger = function(player, food)
--	local changesweremade, healthval, hungerval, sanityval = calculateFoodValues(food)
--	if changesweremade then
--		return healthval, hungerval, sanityval
--	end
--	local e = food.components.edible
--	return e.healthvalue, e.hungervalue, e.sanityvalue
--  end

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
	inst:RemoveComponent("foodaffinity") -- Removes Food Affinity if "keepwurtveggieaffinity" is false and "omnivorewurt" is if true.
	end
end)
end



if GetModConfigData("omnivorewathgrithr") == true then
AddPrefabPostInit("wathgrithr", function(inst)
    if inst.components.foodaffinity then
    inst:RemoveComponent("eater")   -- Resets Diet of Wigfrid.
    inst:AddComponent("eater")      -- Re-adding it here as a standart diet.
	end
end)
end



if GetModConfigData("wortoxpomegranate") == true and GetModConfigData("prepedfoodsonlymode") == false then
AddPrefabPostInit("wortox", function(inst)
	if inst.components.foodaffinity then
    inst.components.foodaffinity:AddPrefabAffinity  ("pomegranate", 3.9  )
	inst.components.foodaffinity:AddPrefabAffinity  ("pomegranate_cooked", 3.3  )
	end
end)
end



if GetModConfigData("prepedfoodsonlymode") == true or false then
TUNING.WARLY_SAME_OLD_COOLDOWN = TUNING.TOTAL_DAY_TIME * foodmemory   -- tuning.lua 3236th line.
end



if GetModConfigData("prepedfoodsonlymode") == true then
AddPrefabPostInitAny(function(inst)
    if inst:HasTag("player") and inst.components.eater ~= nil then    -- Checks for Player tag and Eater Component. Check warly.lua between 35th and 38th lines.
        inst.components.eater:SetPrefersEatingTag("preparedfood")     -- Adds Eating tag. Most food cooked in the cooking pot.
        inst.components.eater:SetPrefersEatingTag("pre-preparedfood") -- Adds Eating tag. Edible Stuff from events.
    end
end)



AddPrefabPostInit("gears", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	local edible = inst.components.edible
	inst:AddTag("preparedfood") -- Adding Gears to Prepared Foods List.
end)



AddPrefabPostInit("wortox_soul", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	local edible = inst.components.edible
	inst:AddTag("preparedfood") -- Adding Souls to Prepared Foods List.
end)



AddPrefabPostInit("mandrake", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	local edible = inst.components.edible
	inst:AddTag("preparedfood") -- Adding Mandrake to Prepared Foods List.
end)



AddPrefabPostInit("cookedmandrake", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	local edible = inst.components.edible
	inst:AddTag("preparedfood") -- Adding Cooked Mandrake to Prepared Foods List.
end)
end



if GetModConfigData("fmsforothers") == true then
AddPrefabPostInitAny(function(inst)
if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
    if inst:HasTag("player") and inst.components.foodmemory ~= nil then
	inst:AddComponent("foodmemory") -- Highly Experimental. Might need quote redoing. Or just use Ramsay Food Quotes lol. Then again IDK how Food Memory works.
    end
    end)
end



if GetModConfigData("prepedfoodsonlymode") == true or false then
TUNING.WARLY_SAME_OLD_COOLDOWN = TUNING.TOTAL_DAY_TIME * foodmemory   -- tuning.lua 3236th line.
end



if GetModConfigData("portableforeveryone") == true then
AddPlayerPostInit(function(player)
	player:AddTag("masterchef") -- Adding Chef tags to players.
	player:AddTag("professionalchef") -- Adding Chef tags to players.
	player:AddTag("expertchef") -- Adding Chef tags to players.
end)
end



if GetModConfigData("disableportablegenericquotes") == true and GetModConfigData("portableforeveryone") == true then -- Activates if both are true.
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
local warly_foods = require("preparedfoods_warly") -- Searching for Warly exclusive foods.
for _, recipe in pairs(warly_foods) do
    for i,v in pairs(recipe.tags) do
        if v == "masterfood" then -- Removes masterfood tag from Warly exclusive foods. Allowing it to be cooked on every cooking pot. By any character.
            table.remove(recipe.tags, i)
            break
        end
    end
	AddCookerRecipe("cookpot", recipe)
	AddCookerRecipe("archive_cookpot", recipe)
end
end
