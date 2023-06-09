/obj/structure/scrap_cube
	name = "compressed scrap"
	desc = "A cube made of scrap compressed with hydraulic clamp."
	density = TRUE
	anchored = FALSE
	icon_state = "trash_cube"
	icon = 'icons/obj/structures/scrap/refine.dmi'

/obj/structure/scrap_cube/proc/make_pile()
	for(var/obj/item in contents)
		item.forceMove(loc)
	qdel(src)

/obj/structure/scrap_cube/Initialize(mapload, size = -1)
	if(size < 0)
		new /obj/random/scrap/moderate_weighted(src)
	. = ..()

/obj/structure/scrap_cube/attackby(obj/item/W, mob/user)
	user.do_attack_animation(src)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(istype(W,/obj/item) && W.force >= 8)
		visible_message("<span class='notice'>\The [user] smashes the [src], restoring it's original form.</span>")
		make_pile()
	else
		visible_message("<span class='notice'>\The [user] smashes the [src], but [W] is too weak to break it!</span>")

/obj/item/scrap_lump
	name = "unrefined scrap"
	desc = "This thing is messed up beyond any recognition. Into the grinder it goes!"
	icon = 'icons/obj/structures/scrap/refine.dmi'
	icon_state = "unrefined"
	w_class = ITEM_SIZE_TINY //so we can fit more then 2 in a bag

/obj/item/scrap_lump/Initialize()
	. = ..()
	create_reagents(10)
	var/reag_num = rand(0, 3)
	for(var/i in 1 to reag_num)
		if(reagents.total_volume == reagents.maximum_volume)
			break
		reagents.add_reagent(pick(GLOB.chemical_reagents_list), rand(1, reagents.maximum_volume))
	pixel_x = rand(0, 16) - 8
	pixel_y = rand(0, 8) - 8

/obj/item/stack/sheet/refined_scrap
	name = "refined scrap"
	desc = "This is ghetto gold! It could be used as fuel or building material."
	icon = 'icons/obj/structures/scrap/refine.dmi'
	icon_state = "refined"
	max_amount = 120
	amount = 1
	var/matter_type = MATERIAL_RSCRAP

/obj/item/stack/sheet/refined_scrap/random
	rand_min = 5
	rand_max = 20