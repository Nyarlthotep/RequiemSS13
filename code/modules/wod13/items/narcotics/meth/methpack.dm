/obj/item/reagent_containers/drug/methpack
	name = "\improper elite blood pack (full)"
	desc = "Fast way to feed your inner beast."
	icon = 'icons/wod13/items.dmi'
	icon_state = "blood4"
	inhand_icon_state = "blood4"
	lefthand_file = 'icons/wod13/lefthand.dmi'
	righthand_file = 'icons/wod13/righthand.dmi'
	list_reagents = list(/datum/reagent/drug/methamphetamine = 15) //some of the source chemicals are lost in the process
	resistance_flags = FREEZE_PROOF
	item_flags = NOBLUDGEON
	w_class = WEIGHT_CLASS_SMALL
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF

	var/empty = FALSE
	var/feeding = FALSE
	var/amount_of_bloodpoints = 4
	var/vitae = FALSE

/obj/item/reagent_containers/drug/methpack/attack(mob/living/M, mob/living/user)
	. = ..()
	if(!iskindred(M))
		if(!vitae)
			return
	if(empty)
		return
	feeding = TRUE
	if(do_mob(user, src, 3 SECONDS))
		var/obj/item/reagent_containers/drug/methpack/H = new(src) //setting up the drugged bag in question (and its contents) as a variable to be called later
		feeding = FALSE
		empty = TRUE
		icon_state = "blood0"
		inhand_icon_state = "blood0"
		name = "\improper drinkable blood pack (empty)"
		var/blood_mod = 1
		var/mob/living/carbon/human/human_user = user
		if(HAS_TRAIT(src, TRAIT_METHUSELAHS_THIRST) && !vitae)
			blood_mod = 0
		else if(human_user?.vamp_rank == VAMP_RANK_ELDER && !vitae)
			blood_mod *= 0.5

		if(blood_mod)
			M.adjustBloodPool(blood_mod * amount_of_bloodpoints)
			M.adjustBruteLoss(-20 * blood_mod, TRUE)
			M.adjustFireLoss(-20 * blood_mod, TRUE)
			M.update_damage_overlays()
			M.update_health_hud()
			if(iskindred(M))
				M.update_blood_hud()
				H.reagents.trans_to(M, min(10, H.reagents.total_volume), transfered_by = H, methods = VAMPIRE) //calling the earlier variable to transfer to target, M
		playsound(M.loc,'sound/items/drink.ogg', 50, TRUE)
		return
	else
		feeding = FALSE
		return