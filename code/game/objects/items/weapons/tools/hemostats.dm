/obj/item/weapon/tool/hemostat
	name = "hemostat"
	desc = "You think you have seen this before."
	icon_state = "hemostat"
	matter = list(MATERIAL_STEEL = 2)
	flags = CONDUCT
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	attack_verb = list("attacked", "pinched")
	tool_qualities = list(QUALITY_CLAMPING = 30)

/obj/item/weapon/tool/hemostat/adv
	name = "precise hemostat"
	desc = "An advanced hemostat with better vein clamping strength and an adaptive tip tuned to also allow easier extraction of shrapnel, organs, and implants."
	matter = list(MATERIAL_STEEL = 6)
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 3)
	tool_qualities = list(QUALITY_CLAMPING = 60)
