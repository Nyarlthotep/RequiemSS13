/obj/item/stocks_license
	name = "unidentified stocks trading license"
	desc = "Contains tons of information about broker's marketplace account."
	icon_state = "card1"
	icon = 'icons/wod13/items.dmi'
	w_class = WEIGHT_CLASS_SMALL
	item_flags = NOBLUDGEON
	resistance_flags = FIRE_PROOF | ACID_PROOF
	var/balance = 200
	var/whose

/obj/item/stocks_license/attack_self(mob/user)
	. = ..()
	if(name == "unidentified stocks trading license")
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			var/obj/item/stocks_license/CR = get_fuckin_card_number(H.real_name)
			if(CR)
				return
			name = "[H.real_name]'s stocks trading license"
			whose = H.real_name

/obj/item/stocks_license/Initialize()
	. = ..()
	icon_state = "card[rand(1, 3)]"
	GLOB.stock_licenses += src

/obj/item/stocks_license/Destroy()
	. = ..()
	GLOB.stock_licenses -= src

/obj/item/stocks_license/examine(mob/user)
	. = ..()
	. += "<b>Balance</b>: [balance] dollars"
