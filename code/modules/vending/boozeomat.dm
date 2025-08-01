/obj/machinery/vending/boozeomat
	name = "\improper Booze-O-Mat"
	desc = "A technological marvel, supposedly able to mix just the mixture you'd like to drink the moment you ask for one."
	icon_state = "boozeomat"
	icon_deny = "boozeomat-deny"
	products = list(/obj/item/reagent_containers/food/drinks/drinkingglass = 15,
					/obj/item/reagent_containers/food/drinks/drinkingglass/martini_glass = 15,
					/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass = 15,
					/obj/item/reagent_containers/food/drinks/drinkingglass/whiskey_shot = 15,
					/obj/item/reagent_containers/food/drinks/drinkingglass/wine_glass = 15,
					/obj/item/reagent_containers/food/drinks/drinkingglass/pint = 15,
					/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass = 12,
					/obj/item/reagent_containers/food/drinks/flask = 3,
					/obj/item/reagent_containers/food/drinks/ice = 10,
					/obj/item/reagent_containers/food/drinks/bottle/orangejuice = 4,
					/obj/item/reagent_containers/food/drinks/bottle/tomatojuice = 4,
					/obj/item/reagent_containers/food/drinks/bottle/limejuice = 4,
					/obj/item/reagent_containers/food/drinks/bottle/cream = 4,
					/obj/item/reagent_containers/food/drinks/soda_cans/cola = 8,
					/obj/item/reagent_containers/food/drinks/soda_cans/tonic = 8,
					/obj/item/reagent_containers/food/drinks/soda_cans/sodawater = 15,
					/obj/item/reagent_containers/food/drinks/soda_cans/sol_dry = 8,
					/obj/item/reagent_containers/food/drinks/bottle/grenadine = 4,
					/obj/item/reagent_containers/food/drinks/bottle/menthol = 4,
					/obj/item/reagent_containers/food/drinks/ale = 6,
					/obj/item/reagent_containers/food/drinks/beer = 6,
					/obj/item/reagent_containers/food/drinks/bottle/maltliquor = 6,
					/obj/item/reagent_containers/food/drinks/bottle/gin = 5,
					/obj/item/reagent_containers/food/drinks/bottle/whiskey = 5,
					/obj/item/reagent_containers/food/drinks/bottle/tequila = 5,
					/obj/item/reagent_containers/food/drinks/bottle/vodka = 5,
					/obj/item/reagent_containers/food/drinks/bottle/vermouth = 5,
					/obj/item/reagent_containers/food/drinks/bottle/rum = 5,
					/obj/item/reagent_containers/food/drinks/bottle/wine = 5,
					/obj/item/reagent_containers/food/drinks/bottle/cognac = 5,
					/obj/item/reagent_containers/food/drinks/bottle/kahlua = 5,
					/obj/item/reagent_containers/food/drinks/bottle/hcider = 5,
					/obj/item/reagent_containers/food/drinks/bottle/absinthe = 5,
					/obj/item/reagent_containers/food/drinks/bottle/grappa = 5,
					/obj/item/reagent_containers/food/drinks/bottle/amaretto = 5,
					/obj/item/reagent_containers/food/drinks/bottle/sake = 5,
					/obj/item/reagent_containers/food/drinks/bottle/applejack = 5,
					/obj/item/reagent_containers/food/drinks/bottle = 15,
					/obj/item/reagent_containers/food/drinks/bottle/small = 15
					)
	contraband = list(
		/obj/item/reagent_containers/food/drinks/mug/tea = 12,
		/obj/item/reagent_containers/food/drinks/bottle/fernet = 5,
	)
	premium = list(/obj/item/reagent_containers/glass/bottle/ethanol = 4,
		/obj/item/reagent_containers/food/drinks/bottle/champagne = 5
	)

	//product_slogans = "I hope nobody asks me for a bloody cup o' tea...;Alcohol is humanity's friend. Would you abandon a friend?;Quite delighted to serve you!;Is nobody thirsty on this station?"
	//product_ads = "Drink up!;Booze is good for you!;Alcohol is humanity's best friend.;Quite delighted to serve you!;Care for a nice, cold beer?;Nothing cures you like booze!;Have a sip!;Have a drink!;Have a beer!;Beer is good for you!;Only the finest alcohol!;Best quality booze since 2053!;Award-winning wine!;Maximum alcohol!;Man loves beer.;A toast for progress!"
	req_access = list(ACCESS_BAR)
	refill_canister = /obj/item/vending_refill/boozeomat
	default_price = PAYCHECK_ASSISTANT * 0.9
	extra_price = PAYCHECK_COMMAND
	payment_department = ACCOUNT_SRV
	light_mask = "boozeomat-light-mask"

/obj/machinery/vending/boozeomat/all_access
	desc = "A technological marvel, supposedly able to mix just the mixture you'd like to drink the moment you ask for one. This model appears to have no access restrictions."
	req_access = null
	onstation = FALSE

/obj/machinery/vending/boozeomat/syndicate_access
	req_access = list(ACCESS_SYNDICATE)
	age_restrictions = FALSE

/obj/item/vending_refill/boozeomat
	machine_name = "Booze-O-Mat"
	icon_state = "refill_booze"
