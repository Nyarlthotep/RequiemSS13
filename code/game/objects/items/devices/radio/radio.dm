#define FREQ_LISTENING (1<<0)

/obj/item/radio
	icon = 'icons/obj/radio.dmi'
	name = "city bounced radio"
	icon_state = "walkietalkie"
	inhand_icon_state = "walkietalkie"
	worn_icon_state = "radio"
	desc = "A basic handheld radio that communicates with local telecommunication networks."
	dog_fashion = /datum/dog_fashion/back

	flags_1 = CONDUCT_1 | HEAR_1
	slot_flags = ITEM_SLOT_BELT
	throw_speed = 3
	throw_range = 7
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron=75, /datum/material/glass=25)
	obj_flags = USES_TGUI

	var/on = TRUE
	var/frequency = FREQ_COMMON
	var/canhear_range = 3  // The range around the radio in which mobs can hear what it receives.
	var/emped = 0  // Tracks the number of EMPs currently stacked.

	var/broadcasting = FALSE  // Whether the radio will transmit dialogue it hears nearby.
	var/listening = TRUE  // Whether the radio is currently receiving.
	var/prison_radio = FALSE  // If true, the transmit wire starts cut.
	var/unscrewed = FALSE  // Whether wires are accessible. Toggleable by screwdrivering.
	var/freerange = FALSE  // If true, the radio has access to the full spectrum.
	var/subspace_transmission = FALSE  // If true, the radio transmits and receives on subspace exclusively.
	var/subspace_switchable = FALSE  // If true, subspace_transmission can be toggled at will.
	var/freqlock = FALSE  // Frequency lock to stop the user from untuning specialist radios.
	var/use_command = FALSE  // If true, broadcasts will be large and BOLD.
	var/command = FALSE  // If true, use_command can be toggled at will.

	///makes anyone who is talking through this anonymous.
	var/anonymize = FALSE

	// Encryption key handling
	var/obj/item/encryptionkey/keyslot
	var/translate_binary = FALSE  // If true, can hear the special binary channel.
	var/independent = FALSE  // If true, can say/hear on the special CentCom channel.
	var/syndie = FALSE  // If true, hears all well-known channels automatically, and can say/hear on the Syndicate channel.
	var/list/channels = list()  // Map from name (see communications.dm) to on/off. First entry is current department (:h)
	var/list/secure_radio_connections

/obj/item/radio/suicide_act(mob/living/user)
	user.visible_message("<span class='suicide'>[user] starts bouncing [src] off [user.p_their()] head! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return BRUTELOSS

/obj/item/radio/proc/set_frequency(new_frequency)
	SEND_SIGNAL(src, COMSIG_RADIO_NEW_FREQUENCY, args)
	remove_radio(src, frequency)
	frequency = add_radio(src, new_frequency)

/obj/item/radio/proc/recalculateChannels()
	resetChannels()

	if(keyslot)
		for(var/ch_name in keyslot.channels)
			if(!(ch_name in channels))
				channels[ch_name] = keyslot.channels[ch_name]

		if(keyslot.translate_binary)
			translate_binary = TRUE
		if(keyslot.syndie)
			syndie = TRUE
		if(keyslot.independent)
			independent = TRUE

	for(var/ch_name in channels)
		secure_radio_connections[ch_name] = add_radio(src, GLOB.radiochannels[ch_name])

// Used for cyborg override
/obj/item/radio/proc/resetChannels()
	channels = list()
	translate_binary = FALSE
	syndie = FALSE
	independent = FALSE

/obj/item/radio/proc/make_syndie() // Turns normal radios into Syndicate radios!
	qdel(keyslot)
	keyslot = new /obj/item/encryptionkey/syndicate
	syndie = 1
	recalculateChannels()

/obj/item/radio/Destroy()
	remove_radio_all(src) //Just to be sure
	QDEL_NULL(wires)
	QDEL_NULL(keyslot)
	return ..()

/obj/item/radio/Initialize()
	wires = new /datum/wires/radio(src)
	if(prison_radio)
		wires.cut(WIRE_TX) // OH GOD WHY
	secure_radio_connections = new
	. = ..()
	frequency = sanitize_frequency(frequency, freerange)
	set_frequency(frequency)

	for(var/ch_name in channels)
		secure_radio_connections[ch_name] = add_radio(src, GLOB.radiochannels[ch_name])

/obj/item/radio/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_WIRES)

/obj/item/radio/interact(mob/user)
	if(unscrewed && !isAI(user))
		wires.interact(user)
		add_fingerprint(user)
	else
		..()

/obj/item/radio/ui_state(mob/user)
	return GLOB.inventory_state

/obj/item/radio/ui_interact(mob/user, datum/tgui/ui, datum/ui_state/state)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Radio", name)
		if(state)
			ui.set_state(state)
		ui.open()

/obj/item/radio/ui_data(mob/user)
	var/list/data = list()

	data["broadcasting"] = broadcasting
	data["listening"] = listening
	data["frequency"] = frequency
	data["minFrequency"] = freerange ? MIN_FREE_FREQ : MIN_FREQ
	data["maxFrequency"] = freerange ? MAX_FREE_FREQ : MAX_FREQ
	data["freqlock"] = freqlock
	data["channels"] = list()
	for(var/channel in channels)
		data["channels"][channel] = channels[channel] & FREQ_LISTENING
	data["command"] = command
	data["useCommand"] = use_command
	data["subspace"] = subspace_transmission
	data["subspaceSwitchable"] = subspace_switchable
	data["headset"] = FALSE

	return data

/obj/item/radio/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return
	switch(action)
		if("frequency")
			if(freqlock)
				return
			var/tune = params["tune"]
			var/adjust = text2num(params["adjust"])
			if(adjust)
				tune = frequency + adjust * 10
				. = TRUE
			else if(text2num(tune) != null)
				tune = tune * 10
				. = TRUE
			if(.)
				set_frequency(sanitize_frequency(tune, freerange))
		if("listen")
			listening = !listening
			. = TRUE
		if("broadcast")
			broadcasting = !broadcasting
			. = TRUE
		if("channel")
			var/channel = params["channel"]
			if(!(channel in channels))
				return
			if(channels[channel] & FREQ_LISTENING)
				channels[channel] &= ~FREQ_LISTENING
			else
				channels[channel] |= FREQ_LISTENING
			. = TRUE
		if("command")
			use_command = !use_command
			. = TRUE
		if("subspace")
			if(subspace_switchable)
				subspace_transmission = !subspace_transmission
				if(!subspace_transmission)
					channels = list()
				else
					recalculateChannels()
				. = TRUE

/obj/item/radio/talk_into(atom/movable/M, message, channel, list/spans, datum/language/language, list/message_mods)
	if(HAS_TRAIT(M, TRAIT_SIGN_LANG)) //Forces Sign Language users to wear the translation gloves to speak over radios
		var/mob/living/carbon/mute = M
		if(istype(mute))
			var/empty_indexes = mute.get_empty_held_indexes() //How many hands the player has empty
			var/obj/item/clothing/gloves/radio/G = mute.get_item_by_slot(ITEM_SLOT_GLOVES)
			if(!istype(G))
				return FALSE
			if(length(empty_indexes) == 1)
				message = stars(message)
			if(length(empty_indexes) == 0) //Due to the requirement of gloves, the arm check for normal speech would be redundant here.
				return FALSE
			if(mute.handcuffed)//Would be weird if they couldn't sign but their words still went over the radio
				return FALSE
			if(HAS_TRAIT(mute, TRAIT_HANDS_BLOCKED) || HAS_TRAIT(mute, TRAIT_EMOTEMUTE))
				return FALSE
	if(!spans)
		spans = list(M.speech_span)
	if(!language)
		language = M.get_selected_language()
	INVOKE_ASYNC(src, PROC_REF(talk_into_impl), M, message, channel, spans.Copy(), language, message_mods)
	return ITALICS | REDUCE_RANGE

/obj/item/radio/proc/talk_into_impl(atom/movable/M, message, channel, list/spans, datum/language/language, list/message_mods)
	if(!on)
		return // the device has to be on
	if(!M || !message)
		return
	if(wires.is_cut(WIRE_TX))  // Permacell and otherwise tampered-with radios
		return
	if(!M.IsVocal())
		return

	if(use_command)
		spans |= SPAN_COMMAND

	/*
	Roughly speaking, radios attempt to make a subspace transmission (which
	is received, processed, and rebroadcast by the telecomms satellite) and
	if that fails, they send a mundane radio transmission.

	Headsets cannot send/receive mundane transmissions, only subspace.
	Syndicate radios can hear transmissions on all well-known frequencies.
	CentCom radios can hear the CentCom frequency no matter what.
	*/

	// From the channel, determine the frequency and get a reference to it.
	var/freq
	if(channel && channels && channels.len > 0)
		if(channel == MODE_DEPARTMENT)
			channel = channels[1]
		freq = secure_radio_connections[channel]
		if (!channels[channel]) // if the channel is turned off, don't broadcast
			return
	else
		freq = frequency
		channel = null

	// Nearby active jammers prevent the message from transmitting
	var/turf/position = get_turf(src)
	for(var/obj/item/jammer/jammer in GLOB.active_jammers)
		var/turf/jammer_turf = get_turf(jammer)
		if(position.z == jammer_turf.z && (get_dist(position, jammer_turf) <= jammer.range))
			return

	// Determine the identity information which will be attached to the signal.
	var/atom/movable/virtualspeaker/speaker = new(null, M, src)

	// Construct the signal
	var/datum/signal/subspace/vocal/signal = new(src, freq, speaker, language, message, spans, message_mods)

	// Independent radios, on the CentCom frequency, reach all independent radios
	if (independent && (freq == FREQ_CENTCOM || freq == FREQ_CTF_RED || freq == FREQ_CTF_BLUE))
		signal.data["compression"] = 0
		signal.transmission_method = TRANSMISSION_SUPERSPACE
		signal.levels = list(0)  // reaches all Z-levels
		signal.broadcast()
		return

	// All radios make an attempt to use the subspace system first
	signal.send_to_receivers()

	// If the radio is subspace-only, that's all it can do
	if (subspace_transmission)
		return

	// Non-subspace radios will check in a couple of seconds, and if the signal
	// was never received, send a mundane broadcast (no headsets).
	addtimer(CALLBACK(src, PROC_REF(backup_transmission), signal), 20)

/obj/item/radio/proc/backup_transmission(datum/signal/subspace/vocal/signal)
	var/turf/T = get_turf(src)
	if (signal.data["done"] && (T.z in signal.levels))
		return

	// Okay, the signal was never processed, send a mundane broadcast.
	signal.data["compression"] = 0
	signal.transmission_method = TRANSMISSION_RADIO

	//WoD13 edit! We want the radio to reach most of the z-levels, not just the one it's on.
	//Ugly hardcoding; z-level 1 is the splashscreen (no signal), 2 is sewers, 3 is city, 4 is upper floors, 5 is special, 6 is Penumbra (no signal)
	signal.levels = list(2, 3, 4, 5)
	signal.broadcast()

/obj/item/radio/Hear(message, atom/movable/speaker, message_language, raw_message, radio_freq, list/spans, list/message_mods = list())
	. = ..()
	if(radio_freq || !broadcasting || get_dist(src, speaker) > canhear_range)
		return

	if(message_mods[RADIO_EXTENSION] == MODE_L_HAND || message_mods[RADIO_EXTENSION] == MODE_R_HAND)
		// try to avoid being heard double
		if (loc == speaker && ismob(speaker))
			var/mob/M = speaker
			var/idx = M.get_held_index_of_item(src)
			// left hands are odd slots
			if (idx && (idx % 2) == (message_mods[RADIO_EXTENSION] == MODE_L_HAND))
				return

	talk_into(speaker, raw_message, , spans, language=message_language)

// Checks if this radio can receive on the given frequency.
/obj/item/radio/proc/can_receive(freq, level)
	// deny checks
	if (!on || !listening || wires.is_cut(WIRE_RX))
		return FALSE
	if (freq == FREQ_SYNDICATE && !syndie)
		return FALSE
	if (freq == FREQ_CENTCOM)
		return independent  // hard-ignores the z-level check
	if (!(0 in level))
		var/turf/position = get_turf(src)
		if(!position || !(position.z in level))
			return FALSE

	// allow checks: are we listening on that frequency?
	if (freq == frequency)
		return TRUE
	for(var/ch_name in channels)
		if(channels[ch_name] & FREQ_LISTENING)
			//the GLOB.radiochannels list is located in communications.dm
			if(GLOB.radiochannels[ch_name] == text2num(freq) || syndie)
				return TRUE
	return FALSE


/obj/item/radio/examine(mob/user)
	. = ..()
	if (frequency && in_range(src, user))
		. += "<span class='notice'>It is set to broadcast over the [frequency/10] frequency.</span>"
	if (unscrewed)
		. += "<span class='notice'>It can be attached and modified.</span>"
	else
		. += "<span class='notice'>It cannot be modified or attached.</span>"

/obj/item/radio/attackby(obj/item/W, mob/user, params)
	add_fingerprint(user)
	if(W.tool_behaviour == TOOL_SCREWDRIVER)
		unscrewed = !unscrewed
		if(unscrewed)
			to_chat(user, "<span class='notice'>The radio can now be attached and modified!</span>")
		else
			to_chat(user, "<span class='notice'>The radio can no longer be modified or attached!</span>")
	else
		return ..()

/obj/item/radio/emp_act(severity)
	. = ..()
	if (. & EMP_PROTECT_SELF)
		return
	emped++ //There's been an EMP; better count it
	var/curremp = emped //Remember which EMP this was
	if (listening && ismob(loc))	// if the radio is turned on and on someone's person they notice
		to_chat(loc, "<span class='warning'>\The [src] overloads.</span>")
	broadcasting = FALSE
	listening = FALSE
	for (var/ch_name in channels)
		channels[ch_name] = 0
	on = FALSE
	addtimer(CALLBACK(src, PROC_REF(end_emp_effect), curremp), 200)

/obj/item/radio/proc/end_emp_effect(curremp)
	if(emped != curremp) //Don't fix it if it's been EMP'd again
		return FALSE
	emped = FALSE
	on = TRUE
	return TRUE


/obj/item/radio/cop
	name = "police radio"
	subspace_transmission = FALSE
	subspace_switchable = FALSE
	keyslot = new /obj/item/encryptionkey/headset_sec

/obj/item/radio/cop/Initialize()
	. = ..()
	set_frequency(FREQ_SECURITY)

/obj/item/radio/clinic
	name = "clinic radio"
	subspace_transmission = FALSE
	subspace_switchable = FALSE
	keyslot = new /obj/item/encryptionkey/headset_medsci

/obj/item/radio/clinic/Initialize()
	. = ..()
	set_frequency(FREQ_MEDICAL)

/obj/item/radio/military
	name = "military radio"
	subspace_transmission = FALSE
	subspace_switchable = FALSE
	syndie = TRUE
	keyslot = new /obj/item/encryptionkey/syndicate

/obj/item/radio/military/Initialize()
	. = ..()
	set_frequency(FREQ_SYNDICATE)

///////////////////////////////
//////////Borg Radios//////////
///////////////////////////////
//Giving borgs their own radio to have some more room to work with -Sieve

/obj/item/radio/borg
	name = "cyborg radio"
	subspace_transmission = TRUE
	subspace_switchable = TRUE
	dog_fashion = null

/obj/item/radio/borg/resetChannels()
	. = ..()

	var/mob/living/silicon/robot/R = loc
	if(istype(R))
		for(var/ch_name in R.model.radio_channels)
			channels[ch_name] = 1

/obj/item/radio/borg/syndicate
	syndie = 1
	keyslot = new /obj/item/encryptionkey/syndicate

/obj/item/radio/borg/syndicate/Initialize()
	. = ..()
	set_frequency(FREQ_CTF_RED)

/obj/item/radio/borg/attackby(obj/item/W, mob/user, params)

	if(W.tool_behaviour == TOOL_SCREWDRIVER)
		if(keyslot)
			for(var/ch_name in channels)
				SSradio.remove_object(src, GLOB.radiochannels[ch_name])
				secure_radio_connections[ch_name] = null


			if(keyslot)
				var/turf/T = get_turf(user)
				if(T)
					keyslot.forceMove(T)
					keyslot = null

			recalculateChannels()
			to_chat(user, "<span class='notice'>You pop out the encryption key in the radio.</span>")

		else
			to_chat(user, "<span class='warning'>This radio doesn't have any encryption keys!</span>")

	else if(istype(W, /obj/item/encryptionkey/))
		if(keyslot)
			to_chat(user, "<span class='warning'>The radio can't hold another key!</span>")
			return

		if(!keyslot)
			if(!user.transferItemToLoc(W, src))
				return
			keyslot = W

		recalculateChannels()


/obj/item/radio/off	// Station bounced radios, their only difference is spawning with the speakers off, this was made to help the lag.
	listening = 0			// And it's nice to have a subtype too for future features.
	dog_fashion = /datum/dog_fashion/back
