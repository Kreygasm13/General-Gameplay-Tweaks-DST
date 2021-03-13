name = "General Gameplay Tweaks"
version = "1.12.1 Release"

description = "This mod Tweaks Some of the Crock Pot Recipes, changes to Wurt and Wigfrid's diet, Wurt's vegetable affinity, Bonus for the Wortox's Pomogranate affinity, adds Picky Eater mode, adds tweaks for Warly's Food Memory and adds Portable Wares for everyone. Everything is configurable. Start's with most of the setting disabled so it is wise to configure the mod before playing."
author = "KreygasmTR"

api_version = 10

dst_compatible = true
all_clients_require_mod = true
client_only_mod = false

server_filter_tags = {"Food Tweaks", "Cooking", "QOL"}
	

configuration_options =
{
{
        name = "monsterfoodbuff",
        label = "Monster Food Tweak",
        hover = "Should Tweak be Enabled? Monster Lasagna restores 75 hunger. Changes Monster Tartare's recipe. Tartare restores 75 Hunger, 5 Health and 10 Sanity.",
        options =
        {
            {description = "Enabled", data = true},
            {description = "Disabled", data = false},
        },
        default = false,
    },
	
	{	
		name = "VanillaCrockBuff",
		label = "Crockpot Dish Buffs",
		hover = "Improves upon a few of the less used crockpot foods.",
		options =	{
						{description = "Enabled", data = true, hover = "To name a few, Fish Tacos, Fruit Medley, Guacamole and Unagi."},
						{description = "Disabled", data = false, hover = "No modifications to crockpot foods."},
					},
		default = false,
	},
	
	{	
		name = "omnivorewurt",
		label = "Omnivore Wurt",
		hover = "Change Wurt's Diet to omnivore?",
		options =	{
						{description = "Yes", data = true, hover = "Omnivore."},
						{description = "No", data = false, hover = "Vegaterian."},
					},
		default = false,
	},
	
	{	
		name = "keepwurtveggieaffinity",
		label = "Wurt Veggie Bonus",
		hover = "Should be Wurt's bonus should be kept? Omnivore Wurt must be enabled to work",
		options =	{
						{description = "Enabled", data = true, hover = "Enable the Veggie Boost"},
						{description = "Disabled", data = false, hover = "Disable the Veggie Boost" },
					},
		default = false,
	},
	
	{	
		name = "omnivorewathgrithr",
		label = "Omnivore Wigfrid",
		hover = "Change Wigfrid's Diet to omnivore?",
		options =	{
						{description = "Yes", data = true, hover = "Omnivore."},
						{description = "No", data = false, hover = "Carnivore."},
					},
		default = false,
	},
	
	{	
		name = "wortoxpomegranate",
		label = "Increase Wortox's Pomogranate Bonus",
		hover = "Increases Wortox's bonus when consuming pomogranate. Pick Eater mode must be disabled in order this to work.",
		options =	{
						{description = "Enabled", data = true },
						{description = "Disabled", data = false },
					},
		default = false,
	},
	
	{	
		name = "Crockonly",
		label = "Picky Eater",
		hover = "Restricts all characters to crockpot dishes. ( Mandrakes still can be consumed raw or coooked. WX can still consume gears and Wortox can consume souls.",
		options =	{
						{description = "Enabled", data = true},
						{description = "Disabled", data = false},
					},
		default = false,
	},
	
	{	
		name = "Warlymem",
		label = "Food Memory",
		hover = "Also applies to users of the Bland Flavors mod.",
		options =	{
		                {description = "Disabled", data = 0, hover = "Disables Food Memory System."},
						{description = "Very Easy", data = 0.5, hover = "Half a day, no hard feelings..."},
						{description = "Easy", data = 1, hover = "1 day, hey not too rough!"},
						{description = "Classic", data = 2, hover = "2 days, vanilla setting."},
						{description = "Hard", data = 4, hover = "4 days, rough it out."},
						{description = "Very Hard", data = 6, hover = "6 days, stay vigilant."},
						{description = "Expert", data = 8, hover = "8 days, play smart."},
						{description = "Ultra-Violence", data = 10, hover = "10 days, be optimal as heck."},
						{description = "European Extreme", data = 20, hover = "20 days, hope and pray."},
						{description = "Impossible", data = 40, hover = "40 days, you're either a god, or the most foolish of fools."},
					},
					default = 2,
					},
					
					
	    {	
		name = "Mercycrock",
		label = "Mercy Kit",
		hover = "Starter crockpot for Picky Eater. ( Picky Eater must be on in order to this to work )",
		options =	{
						{description = "Enabled", data = true, hover = "Start with a crockpot blueprint and materials."},
						{description = "Disabled", data = false, hover = "Rough it out on your own, you can handle it."},
					},
		default = false,
	},
	
	{	
		name = "portableforeveryone",
		label = "Portable Wares for Everyone",
		hover = "Should everyone can use and craft Portable Wares?",
		options =	{
						{description = "Enabled", data = true },
						{description = "Disabled", data = false },
					},
		default = false,
	},
	
	{	
		name = "disableportablegenericquotes",
		label = "Disable Generic Quote",
		hover = "Should Generic Quotes Caused by Portable Wares should be disabled. Portable Wares for Everyone must be enabled. ( this makes quote blank )",
		options =	{
						{description = "Enabled", data = true },
						{description = "Disabled", data = false },
					},
		default = false,
	},
	
}