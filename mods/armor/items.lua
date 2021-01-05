-- ============== leather

armor.register_item("leather",{
	type="chestplate",
	image="examobs_meat.png",
	level=3,
	item="examobs:pelt",
	groups={treasure=1},
})
armor.register_item("leather",{
	type="helmet",
	image="examobs_meat.png",
	level=2,
	item="examobs:pelt",
	groups={treasure=1},
})
armor.register_item("leather",{
	type="boots",
	image="examobs_meat.png",
	level=2,
	item="examobs:pelt",
	groups={treasure=1},
})
armor.register_item("leather",{
	type="leggings",
	image="examobs_meat.png",
	level=2,
	item="examobs:pelt",
	groups={treasure=1},
})
armor.register_item("leather",{
	type="gloves",
	image="examobs_meat.png",
	level=1,
	item="examobs:pelt",
	groups={treasure=1},
})
armor.register_item("leather",{
	type="shield",
	image="examobs_meat.png",
	level=3,
	item="examobs:pelt",
	groups={treasure=1},
})

-- ============== iron
armor.register_item("iron",{
	type="chestplate",
	image="default_ironblock.png",
	level=10,
	item="default:iron_ingot",
	groups={treasure=1},
})
armor.register_item("iron",{
	type="helmet",
	image="default_ironblock.png",
	level=8,
	item="default:iron_ingot",
	groups={treasure=1},
})
armor.register_item("iron",{
	type="boots",
	image="default_ironblock.png",
	level=8,
	item="default:iron_ingot",
	groups={treasure=1},
})
armor.register_item("iron",{
	type="leggings",
	image="default_ironblock.png",
	level=8,
	item="default:iron_ingot",
	groups={treasure=1},
})
armor.register_item("iron",{
	type="gloves",
	image="default_ironblock.png",
	level=5,
	item="default:iron_ingot",
	groups={treasure=1},
	hand_damage=2,
})
armor.register_item("iron",{
	type="shield",
	image="default_ironblock.png",
	level=10,
	item="default:iron_ingot",
	groups={treasure=1},
})
-- ============== steel

armor.register_item("steel",{
	type="chestplate",
	image="default_steelblock.png",
	level=12,
	item="default:steel_ingot",
	groups={treasure=2},
})
armor.register_item("steel",{
	type="helmet",
	image="default_steelblock.png",
	level=12,
	item="default:steel_ingot",
	groups={treasure=2},
})
armor.register_item("steel",{
	type="boots",
	image="default_steelblock.png",
	level=12,
	item="default:steel_ingot",
	groups={treasure=2},
})
armor.register_item("steel",{
	type="leggings",
	image="default_steelblock.png",
	level=12,
	item="default:steel_ingot",
	groups={treasure=2},
})
armor.register_item("steel",{
	type="gloves",
	image="default_steelblock.png",
	level=6,
	item="default:steel_ingot",
	groups={treasure=2},
	hand_damage=2,
})
armor.register_item("steel",{
	type="shield",
	image="default_steelblock.png",
	level=12,
	item="default:steel_ingot",
	groups={treasure=2},
})

-- ============== diamond

armor.register_item("diamond",{
	type="chestplate",
	image="default_diamondblock.png",
	level=16,
	item="default:diamond",
	groups={treasure=3},
})
armor.register_item("diamond",{
	type="helmet",
	image="default_diamondblock.png",
	level=16,
	item="default:diamond",
	groups={treasure=3},
})
armor.register_item("diamond",{
	type="boots",
	image="default_diamondblock.png",
	level=16,
	item="default:diamond",
	groups={treasure=3},
})
armor.register_item("diamond",{
	type="leggings",
	image="default_diamondblock.png",
	level=16,
	item="default:diamond",
	groups={treasure=3},
})
armor.register_item("diamond",{
	type="gloves",
	image="default_diamondblock.png",
	level=6,
	item="default:diamond",
	groups={treasure=3},
	hand_damage=3,
})
armor.register_item("diamond",{
	type="shield",
	image="default_diamondblock.png",
	level=16,
	item="default:diamond",
	groups={treasure=3},
})

-- ============== quantum

armor.register_item("quantum",{
	type="chestplate",
	image="armor_quantum.png",
	level=18,
	item="default:quantumblock",
	groups={treasure=3},
})
armor.register_item("quantum",{
	type="helmet",
	image="armor_quantum.png",
	level=18,
	item="default:quantumblock",
	groups={treasure=3},
})
armor.register_item("quantum",{
	type="boots",
	image="armor_quantum.png",
	level=18,
	item="default:quantumblock",
	groups={treasure=3},
})
armor.register_item("quantum",{
	type="leggings",
	image="armor_quantum.png",
	level=18,
	item="default:quantumblock",
	groups={treasure=3},
})
armor.register_item("quantum",{
	type="gloves",
	image="armor_quantum.png",
	level=8,
	item="default:quantumblock",
	groups={treasure=3},
	hand_damage=4,
})
armor.register_item("quantum",{
	type="shield",
	image="armor_quantum.png",
	level=18,
	item="default:quantumblock",
	groups={treasure=3},
})

-- ============== uranium

armor.register_item("uranium",{
	type="chestplate",
	image="default_uraniumactiveblock.png",
	level=10,
	item="default:uraniumactive_ingot",
	groups={treasure=3},
})
armor.register_item("uranium",{
	type="helmet",
	image="default_uraniumactiveblock.png",
	level=7,
	item="default:uraniumactive_ingot",
	groups={treasure=3},
})
armor.register_item("uranium",{
	type="boots",
	image="default_uraniumactiveblock.png",
	level=7,
	item="default:uraniumactive_ingot",
	groups={treasure=3},
})
armor.register_item("uranium",{
	type="leggings",
	image="default_uraniumactiveblock.png",
	level=7,
	item="default:uraniumactive_ingot",
	groups={treasure=3},
})
armor.register_item("uranium",{
	type="gloves",
	image="default_uraniumactiveblock.png",
	level=5,
	item="default:uraniumactive_ingot",
	groups={treasure=3},
	hand_damage=5,
	on_secondary_use=function(itemstack,user,pointed_thing)
		local pos = apos(user:get_pos(),0,1.5)
		local e = minetest.add_entity(pos,"plasma:impulse")
		e:set_properties({textures={"default_cloud.png^[colorize:#deed4caa"}})
		local en = e:get_luaentity()
		en.charging = true
		en.scale= 0
		en.end_scale = 5
		for _, ob in ipairs(minetest.get_objects_inside_radius(pos,5)) do
			local en = ob:get_luaentity()
			local p = ob:get_pos()
			if ob ~= e and ob ~= user and not default.is_decoration(ob,true) then
				default.punch(ob,user,5)
			end
		end
		minetest.sound_play("plasma_shoot", {object=user, gain = 4,max_hear_distance = 10})
	end,
})
armor.register_item("uranium",{
	type="shield",
	image="default_uraniumactiveblock.png",
	level=10,
	item="default:uraniumactive_ingot",
	groups={treasure=3},
})