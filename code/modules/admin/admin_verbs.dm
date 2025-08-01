//admin verb groups - They can overlap if you so wish. Only one of each verb will exist in the verbs list regardless
//the procs are cause you can't put the comments in the GLOB var define
GLOBAL_LIST_INIT(admin_verbs_default, world.AVerbsDefault())
GLOBAL_PROTECT(admin_verbs_default)
/world/proc/AVerbsDefault()
	return list(
	/client/proc/deadmin,				/*destroys our own admin datum so we can play as a regular player*/
	/client/proc/cmd_admin_say,			/*admin-only ooc chat*/
	/client/proc/hide_verbs,			/*hides all our adminverbs*/
	/client/proc/debug_variables,		/*allows us to -see- the variables of any instance in the game. +VAREDIT needed to modify*/
	/client/proc/dsay,					/*talk in deadchat using our ckey/fakekey*/
	/client/proc/investigate_show,		/*various admintools for investigation. Such as a singulo grief-log*/
	/client/proc/secrets,
	/client/proc/toggle_hear_radio,		/*allows admins to hide all radio output*/
	/client/proc/reload_admins,
	/client/proc/reestablish_db_connection, /*reattempt a connection to the database*/
	/client/proc/cmd_admin_pm_context,	/*right-click adminPM interface*/
	/client/proc/cmd_admin_pm_panel,		/*admin-pm list*/
	/client/proc/stop_sounds,
	/client/proc/mark_datum_mapview,
	/client/proc/debugstatpanel,
	/client/proc/transfer_connection,
	#ifdef AREA_GROUPER_DEBUGGING
	/client/proc/grouper_set_start,
	/client/proc/grouper_set_end,
	/client/proc/report_location,
	/client/proc/grouper_get_path,
	/client/proc/grouper_setup_path_dial,
	#endif
	/client/proc/fix_air,				/*resets air in designated radius to its default atmos composition*/
	/client/proc/requests
	)
GLOBAL_LIST_INIT(admin_verbs_admin, world.AVerbsAdmin())
GLOBAL_PROTECT(admin_verbs_admin)
/world/proc/AVerbsAdmin()
	return list(
	/client/proc/invisimin,				/*allows our mob to go invisible/visible*/
//	/datum/admins/proc/show_traitor_panel,	/*interface which shows a mob's mind*/ -Removed due to rare practical use. Moved to debug verbs ~Errorage
	/datum/admins/proc/show_player_panel,	/*shows an interface for individual players, with various links (links require additional flags*/
	/datum/verbs/menu/Admin/verb/playerpanel,
	/client/proc/game_panel,			/*game panel, allows to change game-mode etc*/
	/client/proc/toggle_canon,
	/client/proc/grant_discipline,
	/client/proc/remove_discipline,
	/client/proc/whitelist_panel,
	/*
	/client/proc/encipher_word,
	/client/proc/uncipher_word,
	*/
	/client/proc/set_late_party,		/*sets the party for late joiners*/
	/client/proc/check_ai_laws,			/*shows AI and borg laws*/
	/client/proc/ghost_pool_protection,	/*opens a menu for toggling ghost roles*/
	/datum/admins/proc/toggleooc,		/*toggles ooc on/off for everyone*/
	/datum/admins/proc/toggleoocdead,	/*toggles ooc on/off for everyone who is dead*/
	/datum/admins/proc/toggleenter,		/*toggles whether people can join the current game*/
	/datum/admins/proc/toggleguests,	/*toggles whether guests can join the current game*/
	/datum/admins/proc/announce,		/*priority announce something to all clients.*/
	/datum/admins/proc/set_admin_notice, /*announcement all clients see when joining the server.*/
	/client/proc/admin_ghost,			/*allows us to ghost/reenter body at will*/
	/client/proc/toggle_view_range,		/*changes how far we can see*/
	/client/proc/getserverlogs,		/*for accessing server logs*/
	/client/proc/getcurrentlogs,		/*for accessing server logs for the current round*/
	/client/proc/cmd_admin_subtle_message,	/*send a message to somebody as a 'voice in their head'*/
	/client/proc/cmd_admin_adjust_masquerade, /*adjusts the masquerade level of a player*/
	/client/proc/cmd_admin_global_adjust_masquerade, /*adjusts the global masquerade*/
	/client/proc/cmd_admin_adjust_humanity, /*adjusts the humanity level of a player*/
	/client/proc/cmd_admin_headset_message,	/*send a message to somebody through their headset as CentCom*/
	/client/proc/cmd_admin_delete,		/*delete an instance/object/mob/etc*/
	/client/proc/cmd_admin_check_contents,	/*displays the contents of an instance*/
	/client/proc/centcom_podlauncher,/*Open a window to launch a Supplypod and configure it or it's contents*/
	/client/proc/check_antagonists,		/*shows all antags*/
	/client/proc/jumptocoord,			/*we ghost and jump to a coordinate*/
	/client/proc/Getmob,				/*teleports a mob to our location*/
	/client/proc/Getkey,				/*teleports a mob with a certain ckey to our location*/
//	/client/proc/sendmob,				/*sends a mob somewhere*/ -Removed due to it needing two sorting procs to work, which were executed every time an admin right-clicked. ~Errorage
	/client/proc/jumptoarea,
	/client/proc/jumptokey,				/*allows us to jump to the location of a mob with a certain ckey*/
	/client/proc/jumptomob,				/*allows us to jump to a specific mob*/
	/client/proc/jumptoturf,			/*allows us to jump to a specific turf*/
	/client/proc/admin_call_shuttle,	/*allows us to call the emergency shuttle*/
	/client/proc/admin_cancel_shuttle,	/*allows us to cancel the emergency shuttle, sending it back to centcom*/
	/client/proc/admin_disable_shuttle, /*allows us to disable the emergency shuttle admin-wise so that it cannot be called*/
	/client/proc/admin_enable_shuttle,  /*undoes the above*/
	/client/proc/cmd_admin_direct_narrate,	/*send text directly to a player with no padding. Useful for narratives and fluff-text*/
	/client/proc/cmd_admin_world_narrate,	/*sends text to all players with no padding*/
	/client/proc/cmd_admin_local_narrate,	/*sends text to all mobs within view of atom*/
	/client/proc/cmd_admin_create_centcom_report,
	/client/proc/cmd_change_command_name,
	/client/proc/cmd_admin_check_player_exp, /* shows players by playtime */
	/client/proc/toggle_combo_hud, // toggle display of the combination pizza antag and taco sci/med/eng hud
	/client/proc/toggle_AI_interact, /*toggle admin ability to interact with machines as an AI*/
	/datum/admins/proc/open_shuttlepanel, /* Opens shuttle manipulator UI */
	/client/proc/deadchat,
	/client/proc/toggleprayers,
	/client/proc/toggle_prayer_sound,
	/client/proc/colorasay,
	/client/proc/resetasaycolor,
	/client/proc/toggleadminhelpsound,
	/client/proc/respawn_character,
	/datum/admins/proc/open_borgopanel,
	/client/proc/log_viewer_new,
	/client/proc/fax_panel /*send a paper to fax*/
	)
GLOBAL_LIST_INIT(admin_verbs_ban, list(/client/proc/unban_panel, /client/proc/ban_panel, /client/proc/stickybanpanel))
GLOBAL_PROTECT(admin_verbs_ban)
GLOBAL_LIST_INIT(admin_verbs_sounds, list(/client/proc/play_local_sound, /client/proc/play_direct_mob_sound, /client/proc/play_sound, /client/proc/set_round_end_sound))
GLOBAL_PROTECT(admin_verbs_sounds)
GLOBAL_LIST_INIT(admin_verbs_fun, list(
	/client/proc/cmd_admin_dress,
	/client/proc/cmd_admin_gib_self,
	/client/proc/drop_bomb,
	/client/proc/set_dynex_scale,
	/client/proc/drop_dynex_bomb,
	/client/proc/cinematic,
	/client/proc/one_click_antag,
	/client/proc/cmd_admin_add_freeform_ai_law,
	/client/proc/object_say,
	/client/proc/toggle_random_events,
	/client/proc/set_ooc,
	/client/proc/reset_ooc,
	/client/proc/forceEvent,
	/client/proc/admin_change_sec_level,
	/client/proc/toggle_nuke,
	/client/proc/run_weather,
	/client/proc/mass_zombie_infection,
	/client/proc/mass_zombie_cure,
	/client/proc/polymorph_all,
	/client/proc/show_tip,
	/client/proc/roll_dice_vtm,
	/client/proc/smite,
	/client/proc/admin_away,
	/client/proc/toggle_RMB
	))
GLOBAL_PROTECT(admin_verbs_fun)
GLOBAL_LIST_INIT(admin_verbs_spawn, list(/datum/admins/proc/spawn_atom, /datum/admins/proc/podspawn_atom, /datum/admins/proc/spawn_cargo, /datum/admins/proc/spawn_objasmob, /client/proc/respawn_character, /datum/admins/proc/beaker_panel))
GLOBAL_PROTECT(admin_verbs_spawn)
GLOBAL_LIST_INIT(admin_verbs_server, world.AVerbsServer())
GLOBAL_PROTECT(admin_verbs_server)
/world/proc/AVerbsServer()
	return list(
	/datum/admins/proc/startnow,
	/datum/admins/proc/restart,
	/datum/admins/proc/end_round,
	/datum/admins/proc/delay,
	/datum/admins/proc/toggleaban,
	/client/proc/everyone_random,
	/datum/admins/proc/toggleAI,
	/client/proc/cmd_admin_delete,		/*delete an instance/object/mob/etc*/
	/client/proc/cmd_debug_del_all,
	/client/proc/toggle_random_events,
	/client/proc/forcerandomrotate,
	/client/proc/adminchangemap,
	/client/proc/panicbunker,
	/client/proc/toggle_interviews,
	/client/proc/toggle_hub,
	/client/proc/toggle_cdn
	)
GLOBAL_LIST_INIT(admin_verbs_debug, world.AVerbsDebug())
GLOBAL_PROTECT(admin_verbs_debug)
/world/proc/AVerbsDebug()
	return list(
	/client/proc/restart_controller,
	/client/proc/cmd_admin_list_open_jobs,
	/client/proc/Debug2,
	/client/proc/cmd_debug_make_powernets,
	/client/proc/cmd_debug_mob_lists,
	/client/proc/cmd_admin_delete,
	/client/proc/cmd_debug_del_all,
	/client/proc/restart_controller,
	/client/proc/enable_debug_verbs,
	/client/proc/callproc,
	/client/proc/callproc_datum,
	/client/proc/SDQL2_query,
	/client/proc/test_movable_UI,
	/client/proc/test_snap_UI,
	/client/proc/debugNatureMapGenerator,
	/client/proc/check_bomb_impacts,
	/proc/machine_upgrade,
	/client/proc/populate_world,
	/client/proc/get_dynex_power,		//*debug verbs for dynex explosions.
	/client/proc/get_dynex_range,		//*debug verbs for dynex explosions.
	/client/proc/set_dynex_scale,
	/client/proc/cmd_display_del_log,
	/client/proc/outfit_manager,
	/client/proc/modify_goals,
	/client/proc/debug_huds,
	/client/proc/map_template_load,
	/client/proc/map_template_upload,
	/client/proc/jump_to_ruin,
	/client/proc/clear_dynamic_transit,
	/client/proc/run_empty_query,
	/client/proc/toggle_medal_disable,
	/client/proc/view_runtimes,
	/client/proc/pump_random_event,
	/client/proc/cmd_display_init_log,
	/client/proc/cmd_display_overlay_log,
	/client/proc/reload_configuration,
	/client/proc/atmos_control,
	/client/proc/reload_cards,
	/client/proc/validate_cards,
	/client/proc/test_cardpack_distribution,
	/client/proc/print_cards,
	#ifdef TESTING
	/client/proc/check_missing_sprites,
	#endif
	/datum/admins/proc/create_or_modify_area,
#ifdef REFERENCE_TRACKING
	/datum/admins/proc/view_refs,
	/datum/admins/proc/view_del_failures,
#endif
	/client/proc/check_timer_sources,
	/client/proc/toggle_cdn
	)
GLOBAL_LIST_INIT(admin_verbs_possess, list(GLOBAL_PROC_REF(possess), GLOBAL_PROC_REF(release)))
GLOBAL_PROTECT(admin_verbs_possess)
GLOBAL_LIST_INIT(admin_verbs_permissions, list(/client/proc/edit_admin_permissions))
GLOBAL_PROTECT(admin_verbs_permissions)
GLOBAL_LIST_INIT(admin_verbs_poll, list(/client/proc/poll_panel))
GLOBAL_PROTECT(admin_verbs_poll)

//verbs which can be hidden - needs work
GLOBAL_LIST_INIT(admin_verbs_hideable, list(
	/client/proc/set_ooc,
	/client/proc/reset_ooc,
	/client/proc/deadmin,
	/datum/admins/proc/show_traitor_panel,
	/datum/admins/proc/show_skill_panel,
	/datum/admins/proc/toggleenter,
	/datum/admins/proc/toggleguests,
	/datum/admins/proc/announce,
	/datum/admins/proc/set_admin_notice,
	/client/proc/admin_ghost,
	/client/proc/toggle_view_range,
	/client/proc/cmd_admin_subtle_message,
	/client/proc/cmd_admin_adjust_masquerade,
	/client/proc/cmd_admin_global_adjust_masquerade,
	/client/proc/cmd_admin_adjust_humanity,
	/client/proc/cmd_admin_headset_message,
	/client/proc/cmd_admin_check_contents,
	/client/proc/admin_call_shuttle,
	/client/proc/admin_cancel_shuttle,
	/client/proc/cmd_admin_direct_narrate,
	/client/proc/cmd_admin_world_narrate,
	/client/proc/cmd_admin_local_narrate,
	/client/proc/play_local_sound,
	/client/proc/play_sound,
	/client/proc/set_round_end_sound,
	/client/proc/cmd_admin_dress,
	/client/proc/cmd_admin_gib_self,
	/client/proc/drop_bomb,
	/client/proc/drop_dynex_bomb,
	/client/proc/get_dynex_range,
	/client/proc/get_dynex_power,
	/client/proc/set_dynex_scale,
	/client/proc/cinematic,
	/client/proc/cmd_admin_add_freeform_ai_law,
	/client/proc/cmd_admin_create_centcom_report,
	/client/proc/cmd_change_command_name,
	/client/proc/object_say,
	/client/proc/toggle_random_events,
	/datum/admins/proc/startnow,
	/datum/admins/proc/restart,
	/datum/admins/proc/delay,
	/datum/admins/proc/toggleaban,
	/client/proc/everyone_random,
	/datum/admins/proc/toggleAI,
	/client/proc/restart_controller,
	/client/proc/cmd_admin_list_open_jobs,
	/client/proc/callproc,
	/client/proc/callproc_datum,
	/client/proc/Debug2,
	/client/proc/reload_admins,
	/client/proc/cmd_debug_make_powernets,
	/client/proc/cmd_debug_mob_lists,
	/client/proc/cmd_debug_del_all,
	/client/proc/enable_debug_verbs,
	/proc/possess,
	/proc/release,
	/client/proc/reload_admins,
	/client/proc/panicbunker,
	/client/proc/toggle_interviews,
	/client/proc/admin_change_sec_level,
	/client/proc/toggle_nuke,
	/client/proc/cmd_display_del_log,
	/client/proc/toggle_combo_hud,
	/client/proc/debug_huds,
	/client/proc/toggle_RMB,
	/client/proc/transfer_connection
	))
GLOBAL_PROTECT(admin_verbs_hideable)

/client/proc/add_admin_verbs()
	if(holder)
		control_freak = CONTROL_FREAK_SKIN | CONTROL_FREAK_MACROS

		var/rights = holder.rank.rights
		add_verb(src, GLOB.admin_verbs_default)
		if(rights & R_BUILD)
			add_verb(src, /client/proc/togglebuildmodeself)
		if(rights & R_ADMIN)
			add_verb(src, GLOB.admin_verbs_admin)
		if(rights & R_BAN)
			add_verb(src, GLOB.admin_verbs_ban)
		if(rights & R_FUN)
			add_verb(src, GLOB.admin_verbs_fun)
		if(rights & R_SERVER)
			add_verb(src, GLOB.admin_verbs_server)
		if(rights & R_DEBUG)
			add_verb(src, GLOB.admin_verbs_debug)
		if(rights & R_POSSESS)
			add_verb(src, GLOB.admin_verbs_possess)
		if(rights & R_PERMISSIONS)
			add_verb(src, GLOB.admin_verbs_permissions)
		if(rights & R_STEALTH)
			add_verb(src, /client/proc/stealth)
		if(rights & R_ADMIN)
			add_verb(src, GLOB.admin_verbs_poll)
		if(rights & R_SOUND)
			add_verb(src, GLOB.admin_verbs_sounds)
			if(CONFIG_GET(string/invoke_youtubedl))
				add_verb(src, /client/proc/play_web_sound)
		if(rights & R_SPAWN)
			add_verb(src, GLOB.admin_verbs_spawn)

/client/proc/remove_admin_verbs()
	remove_verb(src, list(
		GLOB.admin_verbs_default,
		/client/proc/togglebuildmodeself,
		GLOB.admin_verbs_admin,
		GLOB.admin_verbs_ban,
		GLOB.admin_verbs_fun,
		GLOB.admin_verbs_server,
		GLOB.admin_verbs_debug,
		GLOB.admin_verbs_possess,
		GLOB.admin_verbs_permissions,
		/client/proc/stealth,
		GLOB.admin_verbs_poll,
		GLOB.admin_verbs_sounds,
		/client/proc/play_web_sound,
		GLOB.admin_verbs_spawn,
		/*Debug verbs added by "show debug verbs"*/
		GLOB.admin_verbs_debug_mapping,
		/client/proc/disable_debug_verbs,
		/client/proc/readmin
		))

/client/proc/hide_verbs()
	set name = "Adminverbs - Hide All"
	set category = "Admin"

	remove_admin_verbs()
	add_verb(src, /client/proc/show_verbs)

	to_chat(src, "<span class='interface'>Almost all of your adminverbs have been hidden.</span>", confidential = TRUE)
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Hide All Adminverbs") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/show_verbs()
	set name = "Adminverbs - Show"
	set category = "Admin"

	remove_verb(src, /client/proc/show_verbs)
	add_admin_verbs()

	to_chat(src, "<span class='interface'>All of your adminverbs are now visible.</span>", confidential = TRUE)
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Show Adminverbs") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/admin_ghost()
	set category = "Admin.Game"
	set name = "Aghost"
	if(!holder)
		return
	. = TRUE
	if (isobserver(mob))
		var/mob/dead/observer/ghost = mob
		if (ghost.aghosted)
			if (ghost.mind?.current) //return to body
				ghost.aghosted = !ghost.aghosted
				if(!ghost.can_reenter_corpse)
					log_admin("[key_name(usr)] re-entered corpse")
					message_admins("[key_name_admin(usr)] re-entered corpse")
				ghost.can_reenter_corpse = TRUE //force re-entering even when otherwise not possible
				ghost.reenter_corpse()

				SSblackbox.record_feedback("tally", "admin_verb", 1, "Admin Reenter") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
			else
				return FALSE
		else //turn normal ghost into aghost
			ghost.aghosted = !ghost.aghosted
			ghost.movement_type = FLYING | GROUND | PHASING
			ghost.sight = SEE_TURFS | SEE_MOBS | SEE_OBJS
			ghost.icon = null
			ghost.icon_state = null
			ghost.overlays = null
			ghost.client.color = null
	else if (isnewplayer(mob))
		to_chat(src, "<font color='red'>Error: Aghost: Can't admin-ghost whilst in the lobby. Join or Observe first.</font>", confidential = TRUE)
		return FALSE
	else //ghostize
		log_admin("[key_name(usr)] admin ghosted.")
		message_admins("[key_name_admin(usr)] admin ghosted.")

		var/mob/body = mob
		var/mob/dead/observer/ghost = body.ghostize(TRUE, TRUE)
		init_verbs()
		if(body && !body.key)
			body.key = "@[key]"	//Haaaaaaaack. But the people have spoken. If it breaks; blame adminbus

		//sets aghost-specific properties here instead of in the ghostize proc
		ghost.movement_type = FLYING | GROUND | PHASING
		ghost.sight = SEE_TURFS | SEE_MOBS | SEE_OBJS
		ghost.icon = null
		ghost.icon_state = null
		ghost.overlays = null
		ghost.client.color = null
		ghost.aghosted = TRUE

		SSblackbox.record_feedback("tally", "admin_verb", 1, "Admin Ghost") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/invisimin()
	set name = "Invisimin"
	set category = "Admin.Game"
	set desc = "Toggles ghost-like invisibility (Don't abuse this)"
	if(holder && mob)
		if(mob.invisibility == INVISIBILITY_OBSERVER)
			mob.invisibility = initial(mob.invisibility)
			to_chat(mob, "<span class='boldannounce'>Invisimin off. Invisibility reset.</span>", confidential = TRUE)
		else
			mob.invisibility = INVISIBILITY_OBSERVER
			to_chat(mob, "<span class='adminnotice'><b>Invisimin on. You are now as invisible as a ghost.</b></span>", confidential = TRUE)

/client/proc/check_antagonists()
	set name = "Check Antagonists"
	set category = "Admin.Game"
	if(holder)
		holder.check_antagonists()
		log_admin("[key_name(usr)] checked antagonists.")	//for tsar~
		if(!isobserver(usr) && SSticker.HasRoundStarted())
			message_admins("[key_name_admin(usr)] checked antagonists.")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Check Antagonists") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/ban_panel()
	set name = "Banning Panel"
	set category = "Admin"
	if(!check_rights(R_BAN))
		return
	holder.ban_panel()
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Banning Panel") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/unban_panel()
	set name = "Unbanning Panel"
	set category = "Admin"
	if(!check_rights(R_BAN))
		return
	holder.unban_panel()
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Unbanning Panel") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/game_panel()
	set name = "Game Panel"
	set category = "Admin.Game"
	if(holder)
		holder.Game()
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Game Panel") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/toggle_canon()
	set name = "Toggle Canon"
	set category = "Admin"
	if (!check_rights(R_ADMIN))
		return

	GLOB.canon_event = !GLOB.canon_event
	SEND_SOUND(world, sound('code/modules/wod13/sounds/canon.ogg'))
	if(GLOB.canon_event)
		to_chat(world, "<b>THE ROUND IS NOW CANON. ALL ROLEPLAY AND ESCALATION RULES ARE IN EFFECT.</b>")
	else
		to_chat(world, "<b>THE ROUND IS NO LONGER CANON. DATA WILL NO LONGER SAVE, AND ROLEPLAY AND ESCALATION RULES ARE NO LONGER IN EFFECT.</b>")
	message_admins("[key_name_admin(usr)] toggled the round's canonicity. The round is [GLOB.canon_event ? "now canon." : "no longer canon."]")
	log_admin("[key_name(usr)] toggled the round's canonicity. The round is [GLOB.canon_event ? "now canon." : "no longer canon."]")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Toggle Canon") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_admin_global_adjust_masquerade()
	set name = "Adjust Global Masquerade"
	set category = "Admin"
	if (!check_rights(R_ADMIN))
		return


	var/last_global_mask = SSmasquerade.total_level

	var/value = input(usr, "Enter the Global Masquerade adjustment values(- will decrease, + will increase) :", "Global Masquerade Adjustment", 0) as num|null
	if(value == null)
		return

	SSmasquerade.manual_adjustment = value

	var/changed_mask = max(0,min(1000,last_global_mask + value))

	SSmasquerade.fire()

	var/msg = "<span class='adminnotice'><b>Global Masquerade Adjustment: [key_name_admin(usr)] has adjusted Global masquerade from [last_global_mask] to [changed_mask] with the value of : [value]. Real Masquerade Value with the other possible variables : [SSmasquerade.total_level]</b></span>"
	log_admin("Global MasqAdjust: [key_name(usr)] has adjusted Global masquerade from [last_global_mask] to [changed_mask] with the value of : [value]. Real Masquerade Value with the other possible variables : [SSmasquerade.total_level]")
	SSoverwatch.record_action(usr, "Global MasqAdjust: [key_name(usr)] has adjusted Global masquerade from [last_global_mask] to [changed_mask] with the value of : [value]. Real Masquerade Value with the other possible variables : [SSmasquerade.total_level]")
	message_admins(msg)
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Global Adjust Masquerade")





/client/proc/cmd_admin_adjust_masquerade(mob/living/carbon/human/M in GLOB.player_list)
	set name = "Adjust Masquerade"
	set category = "Admin"
	if (!check_rights(R_ADMIN))
		return

	if(!ismob(M))
		return
	if(!check_rights(R_ADMIN))
		return

	var/value = input(usr, "Enter the Masquerade adjustment value for [key_name(M)]:", "Masquerade Adjustment", 0) as num|null
	if(!value)
		return

	M.AdjustMasquerade(value, TRUE)
	var/msg = "<span class='adminnotice'><b>Masquerade Adjustment: [key_name_admin(usr)] adjusted [key_name_admin(M)]'s masquerade by [value] to [M.masquerade]</b></span>"
	log_admin("MasqAdjust: [key_name(usr)] has adjusted [key_name(M)]'s masquerade by [value] to [M.masquerade]")
	message_admins(msg)
	admin_ticket_log(M, msg)
	SSoverwatch.record_action(usr, "MasqAdjust: [key_name(usr)] has adjusted [key_name(M)]'s masquerade by [value] to [M.masquerade]")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Adjust Masquerade")

/client/proc/cmd_admin_adjust_humanity(mob/living/carbon/human/M in GLOB.player_list)
	set name = "Adjust Humanity"
	set category = "Admin"
	if (!check_rights(R_ADMIN))
		return

	if(!ismob(M))
		return
	if(!check_rights(R_ADMIN))
		return

	var/value = input(usr, "Enter the Humanity adjustment value for [M.key]. Their current humanity is [M.humanity].", "Humanity Adjustment", 0) as num|null
	if(value == null)
		return

	M.AdjustHumanity(value, 0, forced = TRUE)

	var/msg = "<span class='adminnotice'><b>Humanity Adjustment: [key_name_admin(usr)] adjusted [key_name(M)]'s Humanity by [value] to [M.humanity]</b></span>"
	log_admin("HumanityAdjust: [key_name_admin(usr)] has adjusted [key_name(M)]'s Humanity by [value] to [M.humanity]")
	message_admins(msg)
	admin_ticket_log(M, msg)
	SSoverwatch.record_action(usr, "HumanityAdjust: [key_name_admin(usr)] has adjusted [key_name(M)]'s Humanity by [value] to [M.humanity]")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Adjust Humanity")

/client/proc/grant_whitelist()
	set name = "Grant Whitelist"
	set category = "Admin"
	if (!check_rights(R_ADMIN))
		return

	if (!SSwhitelists.whitelists_enabled)
		to_chat(usr, "<span class='warning'>Whitelisting isn't enabled!</span>")
		return

	var/whitelistee = input("CKey to whitelist:") as null|text
	if (whitelistee)
		whitelistee = ckey(whitelistee)
		var/list/whitelist_pool = (SSwhitelists.possible_whitelists - SSwhitelists.get_user_whitelists(whitelistee))
		if (whitelist_pool.len == 0)
			to_chat(usr, "<span class='warning'>[whitelistee] already has all whitelists!</span>")
			return
		var/whitelist = input("Whitelist to give:") as null|anything in whitelist_pool
		if (whitelist)
			var/ticket_link = input("Link to whitelist request ticket:") as null|text
			if (ticket_link)
				var/approval_reason = input("Reason for whitelist approval:") as null|text
				if (approval_reason)
					SSwhitelists.add_whitelist(whitelistee, whitelist, usr.ckey, ticket_link, approval_reason)
					message_admins("[key_name_admin(usr)] gave [whitelistee] the [whitelist] whitelist. Reason: [approval_reason]")
					log_admin("[key_name(usr)] gave [whitelistee] the [whitelist] whitelist. Reason: [approval_reason]")
					SSoverwatch.record_action(usr, "[key_name(usr)] gave [whitelistee] the [whitelist] whitelist. Reason: [approval_reason]")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Grant Whitelist") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/grant_discipline()
	set name = "Grant Discipline"
	set category = "Admin"
	if (!check_rights(R_ADMIN))
		return

	var/client/player = input("What player do you want to give a Discipline?") as null|anything in GLOB.clients
	if (player)
		if (!player.prefs)
			to_chat(usr, "<span class='warning'>Could not find preferences for [player].")
			return
		var/datum/preferences/preferences = player.prefs
		if ((preferences.pref_species.id != "kindred") && (preferences.pref_species.id != "ghoul"))
			to_chat(usr, "<span class='warning'>Your target is not a vampire or a ghoul.</span>")
			return
		var/giving_discipline = input("What Discipline do you want to give [player]?") as null|anything in (subtypesof(/datum/discipline) - preferences.discipline_types - /datum/discipline/bloodheal)
		if (giving_discipline)
			var/giving_discipline_level = input("What rank of this Discipline do you want to give [player]?") as null|anything in list(0, 1, 2, 3, 4, 5)
			if (!isnull(giving_discipline_level))
				if ((giving_discipline_level > 1) && (preferences.pref_species.id == "ghoul"))
					to_chat(usr, "<span class='warning'>Giving Discipline at level 1 because ghouls cannot have Disciplines higher.</span>")
					giving_discipline_level = 1
				var/reason = input("Why are you giving [player] this Discipline?") as null|text
				if (reason)
					preferences.discipline_types += giving_discipline
					preferences.discipline_levels += giving_discipline_level
					preferences.save_character()

					var/datum/discipline/discipline = new giving_discipline(giving_discipline_level)

					message_admins("[ADMIN_LOOKUPFLW(usr)] gave [ADMIN_LOOKUPFLW(player)] the Discipline [discipline.name] at rank [discipline.level]. Reason: [reason]")
					log_admin("[key_name(usr)] gave [key_name(player)] the Discipline [discipline.name] at rank [discipline.level]. Reason: [reason]")
					SSoverwatch.record_action(usr, "[key_name(usr)] gave [key_name(player)] the Discipline [discipline.name] at rank [discipline.level]. Reason: [reason]")

					if ((giving_discipline_level > 0) && player.mob)
						if (ishuman(player.mob))
							var/mob/living/carbon/human/human = player.mob
							human.give_discipline(discipline)
						else
							qdel(discipline)
					else
						qdel(discipline)

	SSblackbox.record_feedback("tally", "admin_verb", 1, "Grant Discipline") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/remove_discipline()
	set name = "Remove Discipline"
	set category = "Admin"
	if (!check_rights(R_ADMIN))
		return

	var/client/player = input("What player do you want to remove a Discipline from?") as null|anything in GLOB.clients
	if (player)
		if (!player.prefs)
			to_chat(usr, "<span class='warning'>Could not find preferences for [player].")
			return
		var/datum/preferences/preferences = player.prefs
		if ((preferences.pref_species.id != "kindred") && (preferences.pref_species.id != "ghoul"))
			to_chat(usr, "<span class='warning'>Your target is not a vampire or a ghoul.</span>")
			return
		var/removing_discipline = input("What Discipline do you want to give [player]?") as null|anything in preferences.discipline_types
		if (removing_discipline)
			var/reason = input("Why are you removing this Discipline from [player]?") as null|text
			if (reason)
				var/datum/discipline/discipline = new removing_discipline

				var/i = preferences.discipline_types.Find(removing_discipline)
				preferences.discipline_types.Cut(i, i + 1)
				preferences.discipline_levels.Cut(i, i + 1)
				preferences.save_character()

				message_admins("[ADMIN_LOOKUPFLW(usr)] removed the Discipline [discipline.name] from [ADMIN_LOOKUPFLW(player)]. Reason: [reason]")
				log_admin("[key_name(usr)] removed the Discipline [discipline.name] from [key_name(player)]. Reason: [reason]")
				SSoverwatch.record_action(usr, "[key_name(usr)] removed the Discipline [discipline.name] from [key_name(player)]. Reason: [reason]")

				qdel(discipline)

	SSblackbox.record_feedback("tally", "admin_verb", 1, "Remove Discipline") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/whitelist_panel()
	set name = "Whitelist Management"
	set category = "Admin"
	if (!check_rights(R_ADMIN))
		return
	holder.whitelist_panel()
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Whitelist Management") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/poll_panel()
	set name = "Server Poll Management"
	set category = "Admin"
	if(!check_rights(R_POLL))
		return
	holder.poll_list_panel()
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Server Poll Management") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/// Returns this client's stealthed ckey
/client/proc/getStealthKey()
	return GLOB.stealthminID[ckey]

/// Takes a stealthed ckey as input, returns the true key it represents
/proc/findTrueKey(stealth_key)
	if(!stealth_key)
		return
	for(var/potentialKey in GLOB.stealthminID)
		if(GLOB.stealthminID[potentialKey] == stealth_key)
			return potentialKey

/// Hands back a stealth ckey to use, guarenteed to be unique
/proc/generateStealthCkey()
	var/guess = rand(0, 1000)
	var/text_guess
	var/valid_found = FALSE
	while(valid_found == FALSE)
		valid_found = TRUE
		text_guess = "@[num2text(guess)]"
		// We take a guess at some number, and if it's not in the existing stealthmin list we exit
		for(var/key in GLOB.stealthminID)
			// If it is in the list tho, we up one number, and redo the loop
			if(GLOB.stealthminID[key] == text_guess)
				guess += 1
				valid_found = FALSE
				break

	return text_guess


/client/proc/createStealthKey()
	GLOB.stealthminID["[ckey]"] = generateStealthCkey()

/client/proc/stealth()
	set category = "Admin"
	set name = "Stealth Mode"
	if(holder)
		if(holder.fakekey)
			holder.fakekey = null
			if(isobserver(mob))
				mob.invisibility = initial(mob.invisibility)
				mob.alpha = initial(mob.alpha)
				if(mob.mind)
					if(mob.mind.ghostname)
						mob.name = mob.mind.ghostname
					else
						mob.name = mob.mind.name
				else
					mob.name = mob.real_name
				mob.mouse_opacity = initial(mob.mouse_opacity)
		else
			var/new_key = ckeyEx(stripped_input(usr, "Enter your desired display name.", "Fake Key", key, 26))
			if(!new_key)
				return
			holder.fakekey = new_key
			createStealthKey()
			if(isobserver(mob))
				mob.invisibility = INVISIBILITY_MAXIMUM //JUST IN CASE
				mob.alpha = 0 //JUUUUST IN CASE
				mob.name = " "
				mob.mouse_opacity = MOUSE_OPACITY_TRANSPARENT
		log_admin("[key_name(usr)] has turned stealth mode [holder.fakekey ? "ON" : "OFF"]")
		message_admins("[key_name_admin(usr)] has turned stealth mode [holder.fakekey ? "ON" : "OFF"]")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Stealth Mode") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/drop_bomb()
	set category = "Admin.Fun"
	set name = "Drop Bomb"
	set desc = "Cause an explosion of varying strength at your location."

	var/list/choices = list("Small Bomb (1, 2, 3, 3)", "Medium Bomb (2, 3, 4, 4)", "Big Bomb (3, 5, 7, 5)", "Maxcap", "Custom Bomb")
	var/choice = tgui_input_list(usr, "What size explosion would you like to produce? NOTE: You can do all this rapidly and in an IC manner (using cruise missiles!) with the Config/Launch Supplypod verb. WARNING: These ignore the maxcap", "Drop Bomb", choices)
	var/turf/epicenter = mob.loc

	switch(choice)
		if(null)
			return
		if("Small Bomb (1, 2, 3, 3)")
			explosion(epicenter, 1, 2, 3, 3, TRUE, TRUE)
		if("Medium Bomb (2, 3, 4, 4)")
			explosion(epicenter, 2, 3, 4, 4, TRUE, TRUE)
		if("Big Bomb (3, 5, 7, 5)")
			explosion(epicenter, 3, 5, 7, 5, TRUE, TRUE)
		if("Maxcap")
			explosion(epicenter, GLOB.MAX_EX_DEVESTATION_RANGE, GLOB.MAX_EX_HEAVY_RANGE, GLOB.MAX_EX_LIGHT_RANGE, GLOB.MAX_EX_FLASH_RANGE)
		if("Custom Bomb")
			var/devastation_range = input("Devastation range (in tiles):") as null|num
			if(devastation_range == null)
				return
			var/heavy_impact_range = input("Heavy impact range (in tiles):") as null|num
			if(heavy_impact_range == null)
				return
			var/light_impact_range = input("Light impact range (in tiles):") as null|num
			if(light_impact_range == null)
				return
			var/flash_range = input("Flash range (in tiles):") as null|num
			if(flash_range == null)
				return
			if(devastation_range > GLOB.MAX_EX_DEVESTATION_RANGE || heavy_impact_range > GLOB.MAX_EX_HEAVY_RANGE || light_impact_range > GLOB.MAX_EX_LIGHT_RANGE || flash_range > GLOB.MAX_EX_FLASH_RANGE)
				if(alert("Bomb is bigger than the maxcap. Continue?",,"Yes","No") != "Yes")
					return
			epicenter = mob.loc //We need to reupdate as they may have moved again
			explosion(epicenter, devastation_range, heavy_impact_range, light_impact_range, flash_range, TRUE, TRUE)
	message_admins("[ADMIN_LOOKUPFLW(usr)] creating an admin explosion at [epicenter.loc].")
	log_admin("[key_name(usr)] created an admin explosion at [epicenter.loc].")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Drop Bomb") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	SSoverwatch.record_action(usr, "[key_name(usr)] created an admin explosion at [epicenter.loc].")

/client/proc/drop_dynex_bomb()
	set category = "Admin.Fun"
	set name = "Drop DynEx Bomb"
	set desc = "Cause an explosion of varying strength at your location."

	var/ex_power = input("Explosive Power:") as null|num
	var/turf/epicenter = mob.loc
	if(ex_power && epicenter)
		dyn_explosion(epicenter, ex_power)
		message_admins("[ADMIN_LOOKUPFLW(usr)] creating an admin explosion at [epicenter.loc].")
		log_admin("[key_name(usr)] created an admin explosion at [epicenter.loc].")
		SSoverwatch.record_action(usr, "[key_name(usr)] created an admin explosion at [epicenter.loc].")
		SSblackbox.record_feedback("tally", "admin_verb", 1, "Drop Dynamic Bomb") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/get_dynex_range()
	set category = "Debug"
	set name = "Get DynEx Range"
	set desc = "Get the estimated range of a bomb, using explosive power."

	var/ex_power = input("Explosive Power:") as null|num
	if (isnull(ex_power))
		return
	var/range = round((2 * ex_power)**GLOB.DYN_EX_SCALE)
	to_chat(usr, "Estimated Explosive Range: (Devastation: [round(range*0.25)], Heavy: [round(range*0.5)], Light: [round(range)])", confidential = TRUE)

/client/proc/get_dynex_power()
	set category = "Debug"
	set name = "Get DynEx Power"
	set desc = "Get the estimated required power of a bomb, to reach a specific range."

	var/ex_range = input("Light Explosion Range:") as null|num
	if (isnull(ex_range))
		return
	var/power = (0.5 * ex_range)**(1/GLOB.DYN_EX_SCALE)
	to_chat(usr, "Estimated Explosive Power: [power]", confidential = TRUE)

/client/proc/set_dynex_scale()
	set category = "Debug"
	set name = "Set DynEx Scale"
	set desc = "Set the scale multiplier of dynex explosions. The default is 0.5."

	var/ex_scale = input("New DynEx Scale:") as null|num
	if(!ex_scale)
		return
	GLOB.DYN_EX_SCALE = ex_scale
	log_admin("[key_name(usr)] has modified Dynamic Explosion Scale: [ex_scale]")
	message_admins("[key_name_admin(usr)] has  modified Dynamic Explosion Scale: [ex_scale]")

/client/proc/atmos_control()
	set name = "Atmos Control Panel"
	set category = "Debug"
	if(!check_rights(R_DEBUG))
		return
	SSair.ui_interact(mob)

/client/proc/reload_cards()
	set name = "Reload Cards"
	set category = "Debug"
	if(!check_rights(R_DEBUG))
		return
	if(!SStrading_card_game.loaded)
		message_admins("The card subsystem is not currently loaded")
		return
	reloadAllCardFiles(SStrading_card_game.card_files, SStrading_card_game.card_directory)

/client/proc/validate_cards()
	set name = "Validate Cards"
	set category = "Debug"
	if(!check_rights(R_DEBUG))
		return
	if(!SStrading_card_game.loaded)
		message_admins("The card subsystem is not currently loaded")
		return
	var/message = checkCardpacks(SStrading_card_game.card_packs)
	message += checkCardDatums()
	if(message)
		message_admins(message)

/client/proc/test_cardpack_distribution()
	set name = "Test Cardpack Distribution"
	set category = "Debug"
	if(!check_rights(R_DEBUG))
		return
	if(!SStrading_card_game.loaded)
		message_admins("The card subsystem is not currently loaded")
		return
	var/pack = input("Which pack should we test?", "You fucked it didn't you") as null|anything in sortList(SStrading_card_game.card_packs)
	var/batchCount = input("How many times should we open it?", "Don't worry, I understand") as null|num
	var/batchSize = input("How many cards per batch?", "I hope you remember to check the validation") as null|num
	var/guar = input("Should we use the pack's guaranteed rarity? If so, how many?", "We've all been there. Man you should have seen the old system") as null|num
	checkCardDistribution(pack, batchSize, batchCount, guar)

/client/proc/print_cards()
	set name = "Print Cards"
	set category = "Debug"
	printAllCards()

/client/proc/give_spell(mob/T in GLOB.mob_list)
	set category = "Admin.Fun"
	set name = "Give Spell"
	set desc = "Gives a spell to a mob."

	var/list/spell_list = list()
	var/type_length = length_char("/obj/effect/proc_holder/spell") + 2
	for(var/A in GLOB.spells)
		spell_list[copytext_char("[A]", type_length)] = A
	var/obj/effect/proc_holder/spell/S = input("Choose the spell to give to that guy", "ABRAKADABRA") as null|anything in sortList(spell_list)
	if(!S)
		return

	SSblackbox.record_feedback("tally", "admin_verb", 1, "Give Spell") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	log_admin("[key_name(usr)] gave [key_name(T)] the spell [S].")
	SSoverwatch.record_action(usr, "[key_name(usr)] gave [key_name(T)] the spell [S].")
	message_admins("<span class='adminnotice'>[key_name_admin(usr)] gave [key_name_admin(T)] the spell [S].</span>")

	S = spell_list[S]
	if(T.mind)
		T.mind.AddSpell(new S)
	else
		T.AddSpell(new S)
		message_admins("<span class='danger'>Spells given to mindless mobs will not be transferred in mindswap or cloning!</span>")

/client/proc/remove_spell(mob/T in GLOB.mob_list)
	set category = "Admin.Fun"
	set name = "Remove Spell"
	set desc = "Remove a spell from the selected mob."

	if(T?.mind)
		var/obj/effect/proc_holder/spell/S = input("Choose the spell to remove", "NO ABRAKADABRA") as null|anything in sortList(T.mind.spell_list)
		if(S)
			T.mind.RemoveSpell(S)
			log_admin("[key_name(usr)] removed the spell [S] from [key_name(T)].")
			SSoverwatch.record_action(usr, "[key_name(usr)] removed the spell [S] from [key_name(T)].")
			message_admins("<span class='adminnotice'>[key_name_admin(usr)] removed the spell [S] from [key_name_admin(T)].</span>")
			SSblackbox.record_feedback("tally", "admin_verb", 1, "Remove Spell") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/give_disease(mob/living/T in GLOB.mob_living_list)
	set category = "Admin.Fun"
	set name = "Give Disease"
	set desc = "Gives a Disease to a mob."
	if(!istype(T))
		to_chat(src, "<span class='notice'>You can only give a disease to a mob of type /mob/living.</span>", confidential = TRUE)
		return
	var/datum/disease/D = input("Choose the disease to give to that guy", "ACHOO") as null|anything in sortList(SSdisease.diseases, GLOBAL_PROC_REF(cmp_typepaths_asc))
	if(!D)
		return
	T.ForceContractDisease(new D, FALSE, TRUE)
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Give Disease") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	log_admin("[key_name(usr)] gave [key_name(T)] the disease [D].")
	SSoverwatch.record_action(usr, "[key_name(usr)] gave [key_name(T)] the disease [D].")
	message_admins("<span class='adminnotice'>[key_name_admin(usr)] gave [key_name_admin(T)] the disease [D].</span>")

/client/proc/object_say(obj/O in world)
	set category = "Admin.Events"
	set name = "OSay"
	set desc = "Makes an object say something."
	var/message = input(usr, "What do you want the message to be?", "Make Sound") as text | null
	if(!message)
		return
	O.say(message)
	log_admin("[key_name(usr)] made [O] at [AREACOORD(O)] say \"[message]\"")
	message_admins("<span class='adminnotice'>[key_name_admin(usr)] made [O] at [AREACOORD(O)]. say \"[message]\"</span>")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Object Say") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
/client/proc/togglebuildmodeself()
	set name = "Toggle Build Mode Self"
	set category = "Admin.Events"
	if (!(holder.rank.rights & R_BUILD))
		return
	if(src.mob)
		togglebuildmode(src.mob)
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Toggle Build Mode") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/check_ai_laws()
	set name = "Check AI Laws"
	set category = "Admin.Game"
	if(holder)
		src.holder.output_ai_laws()

/client/proc/set_late_party()
	set name = "Set Late Party"
	set category = "Admin.Game"

	var/setting = input(usr, "Choose the bad guys party setting:", "Set Late Party") in list("caitiff", "sabbat", "hunter", "random")
	if(setting == "random")
		SSbad_guys_party.setting = null
		SSbad_guys_party.get_badguys()
	else
		SSbad_guys_party.set_badguys(setting)
		SSbad_guys_party.get_badguys()

	log_admin("[key_name(usr)] set the bad guys party setting to [setting]")
	message_admins("<span class='adminnotice'>[key_name_admin(usr)] set the bad guys party setting to [setting]</span>")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Set Late Party")

/client/proc/deadmin()
	set name = "Deadmin"
	set category = "Admin"
	set desc = "Shed your admin powers."

	if(!holder)
		return

	if(has_antag_hud())
		toggle_combo_hud()

	holder.deactivate()

	to_chat(src, "<span class='interface'>You are now a normal player.</span>")
	log_admin("[src] deadminned themselves.")
	message_admins("[src] deadminned themselves.")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Deadmin")

/client/proc/readmin()
	set name = "Readmin"
	set category = "Admin"
	set desc = "Regain your admin powers."

//	if(GLOB.canon_event)
//		if(istype(mob, /mob/living))
//			var/cool_guy = FALSE
//			for(var/i in GLOB.psychokids)
//				if(i == "[ckey]")
//					cool_guy = TRUE
//			if(!cool_guy)
//				return

	var/datum/admins/A = GLOB.deadmins[ckey]

	if(!A)
		A = GLOB.admin_datums[ckey]
		if (!A)
			var/msg = " is trying to readmin but they have no deadmin entry"
			message_admins("[key_name_admin(src)][msg]")
			log_admin_private("[key_name(src)][msg]")
			return

	A.associate(src)

	if (!holder)
		return //This can happen if an admin attempts to vv themself into somebody elses's deadmin datum by getting ref via brute force

	to_chat(src, "<span class='interface'>You are now an admin.</span>", confidential = TRUE)
	message_admins("[src] re-adminned themselves.")
	log_admin("[src] re-adminned themselves.")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Readmin")

/client/proc/populate_world(amount = 50 as num)
	set name = "Populate World"
	set category = "Debug"
	set desc = "(\"Amount of mobs to create\") Populate the world with test mobs."

	if (amount > 0)
		var/area/area
		var/list/candidates
		var/turf/open/floor/tile
		var/j,k

		for (var/i = 1 to amount)
			j = 100

			do
				area = pick(GLOB.the_station_areas)

				if (area)

					candidates = get_area_turfs(area)

					if (candidates.len)
						k = 100

						do
							tile = pick(candidates)
						while ((!tile || !istype(tile)) && --k > 0)

						if (tile)
							var/mob/living/carbon/human/hooman = new(tile)
							hooman.equipOutfit(pick(subtypesof(/datum/outfit)))
							testing("Spawned test mob at [COORD(tile)]")
			while (!area && --j > 0)

/client/proc/toggle_AI_interact()
	set name = "Toggle Admin AI Interact"
	set category = "Admin.Game"
	set desc = "Allows you to interact with most machines as an AI would as a ghost"

	AI_Interact = !AI_Interact
	if(mob && isAdminGhostAI(mob))
		mob.has_unlimited_silicon_privilege = AI_Interact

	log_admin("[key_name(usr)] has [AI_Interact ? "activated" : "deactivated"] Admin AI Interact")
	message_admins("[key_name_admin(usr)] has [AI_Interact ? "activated" : "deactivated"] their AI interaction")

/client/proc/debugstatpanel()
	set name = "Debug Stat Panel"
	set category = "Debug"

	src.stat_panel.send_message("create_debug")

#ifdef AREA_GROUPER_DEBUGGING
/client/proc/grouper_set_start()
	set category = "Debug"
	set name = "ZZ Set pathfinder start"
	set desc = "Set pathfinder start."
	SSarea_grouper.start_preset = get_turf(usr)

/client/proc/grouper_set_end()
	set category = "Debug"
	set name = "ZZ Set pathfinder end"
	set desc = "Set pathfinder end."
	SSarea_grouper.end_preset = get_turf(usr)

/client/proc/report_location()
	set category = "Debug"
	set name = "ZZ Output Location"
	set desc = "Output your current location."
	var/turf/our_turf = get_turf(usr)
	to_chat(usr, "Your location: [our_turf]([our_turf.x], [our_turf.y], [our_turf.z])")

/client/proc/grouper_get_path()
	set category = "Debug"
	set name = "ZZ Get Area Group Path"
	set desc = "Get the path to where you want to go."
	var/list/turf_list = SSarea_grouper.get_path_debug()
	if(!turf_list)
		return
	to_chat(usr, "In order to get from [SSarea_grouper.start_preset.loc] at [SSarea_grouper.start_preset]([SSarea_grouper.start_preset.x], [SSarea_grouper.start_preset.y], [SSarea_grouper.start_preset.z]) to [SSarea_grouper.end_preset.loc] at [SSarea_grouper.end_preset]([SSarea_grouper.end_preset.x], [SSarea_grouper.end_preset.y], [SSarea_grouper.end_preset.z]) I must go to the following points:")
	for(var/turf/go_turf in turf_list)
		to_chat(usr, "I need to go to the [go_turf]([go_turf.x], [go_turf.y], [go_turf.z]) in [go_turf.loc]")

/client/proc/grouper_setup_path_dial()
	set category = "Debug"
	set name = "ZZ Summon Dial for path"
	set desc = "Subject yourself to the Majesty 5 summon proc."
	if(SSarea_grouper.end_preset)
		to_chat(usr, "End preset not set!")
	usr.AddComponent(/datum/component/summon_dial, SSarea_grouper.end_preset, usr)
#endif
