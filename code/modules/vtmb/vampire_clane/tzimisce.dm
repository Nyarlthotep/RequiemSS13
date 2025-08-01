
/obj/effect/proc_holder/spell/targeted/shapeshift/tzimisce
	name = "Tzimisce Form"
	desc = "Take on the shape a beast."
	charge_max = 10 SECONDS
	cooldown_min = 10 SECONDS
	revert_on_death = TRUE
	die_with_shapeshifted_form = FALSE
	shapeshift_type = /mob/living/simple_animal/hostile/tzimisce_beast

/obj/effect/proc_holder/spell/targeted/shapeshift/bloodcrawler
	name = "Blood Crawler"
	desc = "Take on the shape a beast."
	charge_max = 5 SECONDS
	cooldown_min = 5 SECONDS
	revert_on_death = TRUE
	die_with_shapeshifted_form = FALSE
	shapeshift_type = /mob/living/simple_animal/hostile/bloodcrawler
/datum/crafting_recipe/stake
	name = "Stake"
	time = 50
	reqs = list(/obj/item/stack/sheet/mineral/wood = 5)
	result = /obj/item/vampire_stake
	always_available = TRUE
	category = CAT_WEAPON

/datum/crafting_recipe/molotov
	name = "Molotov Cocktail"
	time = 50
	reqs = list(/obj/item/stack/sheet/cloth = 1, /obj/item/reagent_containers/food/drinks/beer/vampire = 1, /obj/item/gas_can = 1)
	result = /obj/item/molotov
	always_available = TRUE
	category = CAT_WEAPON

/datum/crafting_recipe/tzi_trench
	name = "Leather-Bone Trenchcoat (Armor)"
	time = 50
	reqs = list(/obj/item/stack/human_flesh = 50, /obj/item/spine = 1)
	result = /obj/item/clothing/suit/vampire/trench/tzi
	always_available = FALSE
	category = CAT_TZIMISCE

/datum/crafting_recipe/tzi_med
	name = "Medical Hand (Healing)"
	time = 50
	reqs = list(/obj/item/stack/human_flesh = 35, /obj/item/bodypart/r_arm = 1, /obj/item/organ/heart = 1, /obj/item/organ/tongue = 1)
	result = /obj/item/organ/cyberimp/arm/medibeam
	always_available = FALSE
	category = CAT_TZIMISCE


/datum/crafting_recipe/tzi_heart
	name = "Second Heart (Antistun)"
	time = 50
	reqs = list(/obj/item/stack/human_flesh = 25, /obj/item/organ/heart = 1)
	result = /obj/item/organ/cyberimp/brain/anti_stun/tzi
	always_available = FALSE
	category = CAT_TZIMISCE

/datum/crafting_recipe/tzi_eyes
	name = "Better Eyes (Nightvision)"
	time = 50
	reqs = list(/obj/item/stack/human_flesh = 15, /obj/item/organ/eyes = 1)
	result = /obj/item/organ/eyes/night_vision/nightmare
	always_available = FALSE
	category = CAT_TZIMISCE

//unused due to being bad
/datum/crafting_recipe/tzi_koldun
	name = "Koldun Sorcery (Firebreath)"
	time = 50
	reqs = list(/obj/item/stack/human_flesh = 10, /obj/item/vampire_stake = 1, /obj/item/drinkable_bloodpack = 1)
	result = /obj/item/dnainjector/koldun
	always_available = FALSE
	category = CAT_TZIMISCE

/datum/crafting_recipe/tzi_implant
	name = "Implanting Flesh Device"
	time = 50
	reqs = list(/obj/item/stack/human_flesh = 10, /obj/item/melee/vampirearms/knife = 1, /obj/item/drinkable_bloodpack = 1)
	result = /obj/item/autosurgeon/organ
	always_available = FALSE
	category = CAT_TZIMISCE

/datum/crafting_recipe/tzi_floor
	name = "Gut Floor"
	time = 50
	reqs = list(/obj/item/stack/human_flesh = 1, /obj/item/guts = 1)
	result = /obj/effect/decal/gut_floor
	always_available = FALSE
	category = CAT_TZIMISCE

/datum/crafting_recipe/tzi_wall
	name = "Flesh Wall"
	time = 50
	reqs = list(/obj/item/stack/human_flesh = 2)
	result = /obj/structure/fleshwall
	always_available = FALSE
	category = CAT_TZIMISCE

/obj/effect/decal/gut_floor
	name = "gut floor"
	icon = 'icons/wod13/tiles.dmi'
	icon_state = "tzimisce_floor"

/datum/movespeed_modifier/centipede
	multiplicative_slowdown = -0.6

/mob/living/simple_animal/hostile/bloodcrawler
	var/collected_blood = 0

/mob/living/simple_animal/hostile/bloodcrawler/Move(NewLoc, direct)
	. = ..()
	var/obj/structure/vampdoor/V = locate() in NewLoc
	if(V)
		if(V.lockpick_difficulty <= 10)
			forceMove(get_turf(V))
	for(var/obj/effect/decal/cleanable/blood/B in range(1, NewLoc))
		if(B)
			if(B.bloodiness)
				collected_blood = collected_blood+1
				to_chat(src, "You sense blood entering your mass...")
				var/turf/T = get_turf(B)
				if(T)
					T.wash(CLEAN_WASH)

/obj/effect/decal/gut_floor/Initialize()
	. = ..()
	if(isopenturf(get_turf(src)))
		var/turf/open/T = get_turf(src)
		if(T)
			T.slowdown = 1

/obj/effect/decal/gut_floor/Destroy()
	. = ..()
	var/turf/open/T = get_turf(src)
	if(T)
		T.slowdown = initial(T.slowdown)

/datum/crafting_recipe/tzi_stool
	name = "Arm Stool"
	time = 50
	reqs = list(/obj/item/stack/human_flesh = 5, /obj/item/bodypart/r_arm = 2, /obj/item/bodypart/l_arm = 2)
	result = /obj/structure/chair/old/tzimisce
	always_available = FALSE
	category = CAT_TZIMISCE

/obj/structure/chair/old/tzimisce
	icon = 'icons/wod13/props.dmi'
	icon_state = "tzimisce_stool"

/obj/item/guts
	name = "guts"
	desc = "Just blood and guts..."
	icon_state = "guts"
	icon = 'icons/wod13/items.dmi'
	w_class = WEIGHT_CLASS_SMALL

/obj/item/spine
	name = "spine"
	desc = "If only I had control..."
	icon_state = "spine"
	icon = 'icons/wod13/items.dmi'
	w_class = WEIGHT_CLASS_SMALL

/datum/crafting_recipe/tzi_biter
	name = "Biting Abomination"
	time = 100
	reqs = list(/obj/item/stack/human_flesh = 2, /obj/item/bodypart/r_arm = 2, /obj/item/bodypart/l_arm = 2, /obj/item/spine = 1)
	result = /mob/living/simple_animal/hostile/biter
	always_available = FALSE
	category = CAT_TZIMISCE

/datum/crafting_recipe/tzi_fister
	name = "Punching Abomination"
	time = 100
	reqs = list(/obj/item/stack/human_flesh = 5, /obj/item/bodypart/r_arm = 1, /obj/item/bodypart/l_arm = 1, /obj/item/spine = 1, /obj/item/guts = 1)
	result = /mob/living/simple_animal/hostile/fister
	always_available = FALSE
	category = CAT_TZIMISCE

/datum/crafting_recipe/tzi_tanker
	name = "Fat Abomination"
	time = 100
	reqs = list(/obj/item/stack/human_flesh = 10, /obj/item/bodypart/r_arm = 1, /obj/item/bodypart/l_arm = 1, /obj/item/bodypart/r_leg = 1, /obj/item/bodypart/l_leg = 1, /obj/item/spine = 1, /obj/item/guts = 2)
	result = /mob/living/simple_animal/hostile/tanker
	always_available = FALSE
	category = CAT_TZIMISCE

/mob/living/simple_animal/hostile/biter
	name = "biter"
	desc = "A ferocious, fang-bearing creature that resembles a spider."
	icon = 'icons/wod13/mobs.dmi'
	icon_state = "biter"
	icon_living = "biter"
	icon_dead = "biter_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/stack/human_flesh = 1)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	emote_taunt = list("gnashes")
	speed = -1
	maxHealth = 75
	health = 75

	harm_intent_damage = 8
	obj_damage = 50
	melee_damage_lower = 20
	melee_damage_upper = 20
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_emote = list("gnashes")

	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500
	faction = list("Tzimisce")
	pressure_resistance = 200
	bloodquality = BLOOD_QUALITY_LOW
	bloodpool = 2
	maxbloodpool = 2

/mob/living/simple_animal/hostile/biter/lasombra
	name = "shadow abomination"
	mob_biotypes = MOB_SPIRIT
	icon_state = "shadow"
	icon_living = "shadow"
	del_on_death = TRUE
	maxHealth = 100
	health = 100
	bloodpool = 0
	maxbloodpool = 0
	faction = list("Lasombra")

/mob/living/simple_animal/hostile/biter/lasombra/better
	icon_state = "shadow2"
	icon_living = "shadow2"
	maxHealth = 200
	health = 200
	melee_damage_lower = 50
	melee_damage_upper = 50

/mob/living/simple_animal/hostile/fister
	name = "fister"
	desc = "True abomination walking on both hands."
	icon = 'icons/wod13/mobs.dmi'
	icon_state = "fister"
	icon_living = "fister"
	icon_dead = "fister_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	maxHealth = 125
	health = 125
	butcher_results = list(/obj/item/stack/human_flesh = 2)
	harm_intent_damage = 5
	melee_damage_lower = 30
	melee_damage_upper = 30
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	status_flags = CANPUSH
	faction = list("Tzimisce")
	bloodquality = BLOOD_QUALITY_LOW
	bloodpool = 5
	maxbloodpool = 5

/mob/living/simple_animal/hostile/tanker
	name = "tanker"
	desc = "The peak of abominations armor. Unbelievably undamagable..."
	icon = 'icons/wod13/mobs.dmi'
	icon_state = "tanker"
	icon_living = "tanker"
	icon_dead = "tanker_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	maxHealth = 350
	health = 350
	butcher_results = list(/obj/item/stack/human_flesh = 4)
	harm_intent_damage = 5
	melee_damage_lower = 25
	melee_damage_upper = 25
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	a_intent = INTENT_HARM
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	faction = list("Tzimisce")
	bloodquality = BLOOD_QUALITY_LOW
	bloodpool = 7
	maxbloodpool = 7

/mob/living/simple_animal/hostile/gangrel
	name = "Gangrel Form"
	desc = "The peak of abominations armor. Unbelievably undamagable..."
	icon = 'icons/wod13/32x48.dmi'
	icon_state = "gangrel_f"
	icon_living = "gangrel_f"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mob_size = MOB_SIZE_HUGE
	speak_chance = 0
	speed = -0.4
	maxHealth = 400
	health = 400
	butcher_results = list(/obj/item/stack/human_flesh = 10)
	harm_intent_damage = 5
	melee_damage_lower = 40
	melee_damage_upper = 40
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	a_intent = INTENT_HARM
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	bloodpool = 10
	maxbloodpool = 10
	dextrous = TRUE
	held_items = list(null, null)
	possible_a_intents = list(INTENT_HELP, INTENT_GRAB, INTENT_DISARM, INTENT_HARM)

/mob/living/simple_animal/hostile/gangrel/better
	maxHealth = 500
	health = 500
	melee_damage_lower = 45
	melee_damage_upper = 45
	speed = -0.6

/mob/living/simple_animal/hostile/gangrel/best
	icon_state = "gangrel_m"
	icon_living = "gangrel_m"
	maxHealth = 600
	health = 600
	melee_damage_lower = 55
	melee_damage_upper = 55
	speed = -0.8

/mob/living/simple_animal/hostile/gargoyle
	name = "Gargoyle"
	desc = "Stone-skinned..."
	icon = 'icons/wod13/32x48.dmi'
	icon_state = "gargoyle_m"
	icon_living = "gargoyle_m"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mob_size = MOB_SIZE_LARGE
	speak_chance = 0
	speed = -1
	maxHealth = 400
	health = 400
	butcher_results = list(/obj/item/stack/human_flesh = 10)
	harm_intent_damage = 5
	melee_damage_lower = 25
	melee_damage_upper = 45
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	bloodpool = 10
	maxbloodpool = 10
	dextrous = TRUE
	held_items = list(null, null)
	possible_a_intents = list(INTENT_HELP, INTENT_GRAB, INTENT_DISARM, INTENT_HARM)
	faction = list("Tremere")

/mob/living/simple_animal/hostile/gargoyle/proc/gain_nigs()
	set waitfor = FALSE
	var/list/mob/dead/observer/candidates = pollCandidatesForMob("Do you want to play as Embraced Gargoyle?", null, null, null, 50, src)
	for(var/mob/dead/observer/G in GLOB.player_list)
		if(G.key)
			to_chat(G, "<span class='ghostalert'>New Gargoyle has been made.</span>")
	if(LAZYLEN(candidates))
		var/mob/dead/observer/C = pick(candidates)
		key = C.key

/mob/living/simple_animal/hostile/gargoyle/Initialize()
	. = ..()
	var/datum/action/gargoyle/G = new()
	G.Grant(src)

/datum/action/gargoyle
	name = "Turn into stone"
	desc = "Save some time till healing..."
	button_icon_state = "gargoyle"
	check_flags = AB_CHECK_HANDS_BLOCKED|AB_CHECK_IMMOBILE|AB_CHECK_LYING|AB_CHECK_CONSCIOUS
	var/abuse_fix = 0

/datum/action/gargoyle/Trigger()
	. = ..()
	if(abuse_fix+100 > world.time)
		return
	abuse_fix = world.time
	var/mob/living/simple_animal/hostile/gargoyle/G = owner
	G.adjustBruteLoss(-300)
	G.adjustFireLoss(-300)
	G.Stun(50)
	G.petrify(50)

/mob/living/simple_animal/hostile/tzimisce_beast
	name = "Tzimisce Beast Form"
	desc = "The peak of abominations armor. Unbelievably undamagable..."
	icon = 'icons/wod13/64x64.dmi'
	icon_state = "weretzi"
	icon_living = "weretzi"
	pixel_w = -16
	pixel_z = -16
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mob_size = MOB_SIZE_HUGE
	speak_chance = 0
	speed = -0.55
	maxHealth = 575
	health = 575
	butcher_results = list(/obj/item/stack/human_flesh = 10)
	harm_intent_damage = 5
	melee_damage_lower = 35
	melee_damage_upper = 70
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	a_intent = INTENT_HARM
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	bloodpool = 10
	maxbloodpool = 10
	dodging = TRUE

/mob/living/simple_animal/hostile/bloodcrawler
	name = "Tzimisce Blood Form"
	desc = "The peak of abominations. Unbelievably undamagable..."
	icon = 'icons/wod13/mobs.dmi'
	icon_state = "liquid"
	icon_living = "liquid"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	speed = 3
	maxHealth = 100
	health = 100
	butcher_results = list(/obj/item/stack/human_flesh = 1)
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	a_intent = INTENT_HARM
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	bloodpool = 20
	maxbloodpool = 20

/mob/living/simple_animal/hostile/biter/hostile
	faction = list("hostile")

/mob/living/simple_animal/hostile/fister/hostile
	faction = list("hostile")

/mob/living/simple_animal/hostile/tanker/hostile
	faction = list("hostile")

/obj/item/ground_heir
	name = "bag of ground"
	desc = "Boghatyrskaya sila taitsa zdies'..."
	icon_state = "dirt"
	icon = 'icons/wod13/icons.dmi'
	w_class = WEIGHT_CLASS_SMALL

/obj/item/stack/human_flesh
	name = "human flesh"
	desc = "What the fuck..."
	singular_name = "human flesh"
	icon_state = "human"
	mats_per_unit = list(/datum/material/pizza = MINERAL_MATERIAL_AMOUNT)
	merge_type = /obj/item/stack/human_flesh
	max_amount = 50

/obj/item/stack/human_flesh/fifty
	amount = 50
/obj/item/stack/human_flesh/twenty
	amount = 20
/obj/item/stack/human_flesh/ten
	amount = 10
/obj/item/stack/human_flesh/five
	amount = 5

/obj/item/stack/human_flesh/update_icon_state()
	var/amount = get_amount()
	switch(amount)
		if(30 to INFINITY)
			icon_state = "human_3"
		if(10 to 30)
			icon_state = "human_2"
		else
			icon_state = "human"

/obj/item/extra_arm
	name = "extra arm installer"
	desc = "Distantly related to the technology of the Man-Machine Interface, this state-of-the-art syndicate device adapts your nervous and circulatory system to the presence of an extra limb..."
	icon = 'icons/wod13/icons.dmi'
	icon_state = "vicissitude"
	var/used = FALSE

/obj/item/extra_arm/attack_self(mob/living/carbon/M)
	if(!used)
		var/limbs = M.held_items.len
		M.change_number_of_hands(limbs+1)
		used = TRUE
		icon_state = "extra_arm_none"
		M.visible_message("<span class='notice'>[M] presses a button on [src], and you hear a disgusting noise.</span>", "<span class='notice'>You feel a sharp sting as [src] plunges into your body.</span>")
		to_chat(M, "<span class='notice'>You feel more dexterous.</span>")
		playsound(get_turf(M), 'sound/misc/splort.ogg', 50, 1)
		desc += "Looks like it's been used up."

//GiveSpeciesFlight(mob/living/carbon/human/H)
