name = "General Gameplay Tweaks"
version = "1.13.2 - Release"

description = "This mod Tweaks Some of the Crock Pot Recipes, changes to Wurt and Wigfrid's diet, Wurt's vegetable affinity, Bonus for the Wortox's Pomogranate affinity, adds Picky Eater mode, adds tweaks for Warly's Food Memory and adds Portable Wares for everyone and etc. Everything is configurable. The Mod starts with most of the settings disabled so it is wise to configure the mod before playing."
author = "KreygasmTR"

api_version = 10

dst_compatible = true
all_clients_require_mod = true
client_only_mod = false

icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {"Tweaks", "Cooking", "QOL","General Gameplay Tweaks" }
	

configuration_options =
{
{
        name = "monsterfoodbuff",
        label = "Monster Food Buff",
        hover = "Monster Lasagna stats 75 Hunger, -10 Health, -15 Sanity. Tartare restores 75 Hunger, 5 Health and 10 Sanity. Changes Monster Tartare's recipe.",
        options =
        {
            {description = "Enabled", data = true},
            {description = "Disabled", data = false},
        },
        default = false,
    },
	
	{	
		name = "lasagnarecipe",
		label = "Change Lasagna Recipe",
		hover = "Restrict Lasagna Recipe to Monster Meats?",
		options =	{
						{description = "Yes", data = true   },
						{description = "No", data = false   },
					},
		default = false,
	},
	
	{	
		name = "goodietweak",
		label = "Goodie Tweak",
		hover = "Add Food Tag 'GOODIE' to Guacamole, Waffles, Ice Cream, Eggs, Grim Gallette, Fresh Fruit Crepes and Bone Bouillon. Changes quotes accordingly.",
		options =	{
						{description = "Enabled", data = true   },
						{description = "Disabled", data = false   },
					},
		default = false,
	},
	
	{	
		name = "nowarly",
		label = "No Warly Exclusive Recipes",
		hover = "Makes it so Warly's foods can be cooked on normal cooking pots.",
		options =	{
						{description = "Enabled", data = true   },
						{description = "Disabled", data = false   },
					},
		default = false,
	},
	
	
	{	
		name = "preparedfoodbuff",
		label = "Prepared Dish Buffs",
		hover = "Improves upon a few of the less used crockpot foods. Recommended with Picky Eater Mode.",
		options =	{
						{description = "Enabled", data = true, hover = "Modification to crockpot foods will be made. ( Recommended with Picky Eater Mode. ) "},
						{description = "Disabled", data = false, hover = "No modifications to crockpot foods."},
					},
		default = false,
	},
	
	{	
		name = "webbermonsterfoodbuff",
		label = "Webber Monster Food Bonus",
		hover = "Gives Webber bonuses on Monster Foods with excetion of the Durian.",
		options =	{
						{description = "Enabled", data = true, hover = "Raw,Cooked,Dried Monster Meat will restore 25 Hunger, Lasagna and Tartare will restore double amount for him."},
						{description = "Disabled", data = false, hover = "He will not gain any buffs."},
					},
		default = false,
	},
	
	{
	name = "wormwoodhp",
	label = "Wormwood Food HP Penalty",
	hover = "Should Wormwood restore HP or lose HP by eating food? And if so in how much rate?",
	options = {
	        {description = "0%",   data = 0.00 ,hover = "At rate of 0%. Disabled." },
			{description = "10%",  data = 0.10 ,hover = "At rate of 10%." },
			{description = "20%",  data = 0.20 ,hover = "At rate of 20%." },
			{description = "25%",  data = 0.25 ,hover = "At rate of 25%." },
			{description = "30%",  data = 0.30 ,hover = "At rate of 3%." },
			{description = "40%",  data = 0.40 ,hover = "At rate of 40%." },
			{description = "50%",  data = 0.50 ,hover = "At rate of 50%." },
			{description = "60%",  data = 0.60 ,hover = "At rate of 60%." },
			{description = "70%",  data = 0.70 ,hover = "At rate of 70%." },
			{description = "75%",  data = 0.75 ,hover = "At rate of 75%." },
			{description = "80%",  data = 0.80 ,hover = "At rate of 80%." },
			{description = "90%",  data = 0.90 ,hover = "At rate of 90%." },
			{description = "100%", data = 1.00 ,hover = "At rate of 100%."},
		},
	default = 0.00,
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
		name = "wurtmeatpenalty",
		label = "Omnivore Wurt - Meat Penalty",
		hover = "Should be Omnivore Wurt is on, should Wurt have hunger rate on meat foods?",
		options =	{
			{description = "10%",  data = 0.10 ,hover = "At rate of 10%." },
			{description = "20%",  data = 0.20 ,hover = "At rate of 20%." },
			{description = "25%",  data = 0.25 ,hover = "At rate of 25%." },
			{description = "30%",  data = 0.30 ,hover = "At rate of 30%." },
			{description = "40%",  data = 0.40 ,hover = "At rate of 40%." },
			{description = "50%",  data = 0.50 ,hover = "At rate of 50%." },
			{description = "60%",  data = 0.60 ,hover = "At rate of 60%." },
			{description = "70%",  data = 0.70 ,hover = "At rate of 70%." },
			{description = "75%",  data = 0.75 ,hover = "At rate of 75%." },
			{description = "80%",  data = 0.80 ,hover = "At rate of 80%." },
			{description = "90%",  data = 0.90 ,hover = "At rate of 90%." },
			{description = "100%", data = 1.00 ,hover = "At rate of 100%."},
					},
		default = 1.00,
	},
	
	{	
		name = "keepwurtveggieaffinity",
		label = "Wurt Veggie Bonus",
		hover = "Should be Omnivore Wurt is on, should be Wurt's bonus should be kept?",
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
		label = "Wortox's Pomogranate Bonus",
		hover = "Should be picky eater mode is disabled, Increase Wortox's bonus when consuming pomogranate?",
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