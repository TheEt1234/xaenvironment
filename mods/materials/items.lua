
minetest.register_node("materials:pallet_box", {
	description = "Pallet box",
	tiles={"materials_pallet_box.png"},
	groups = {dig_immediate = 3,flammable=3,used_by_npc=1},
	sunlight_propagates = true,
	drawtype = "glasslike",
	paramtype = "light",
	sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("materials:metal_beam", {
	description = "Metal beam",
	tiles={"materials_metal_beam.png"},
	groups = {cracky = 1,level=3,used_by_npc=1},
	sounds = default.node_sound_metal_defaults(),
	paramtype2 = "facedir",
	on_place=minetest.rotate_node,
})

minetest.register_node("materials:metal_beam_rusty", {
	description = "Rusty Metal beam",
	tiles={"materials_metal_beam_rusty.png"},
	groups = {cracky = 1,level=3,used_by_npc=1},
	sounds = default.node_sound_metal_defaults(),
	paramtype2 = "facedir",
	on_place=minetest.rotate_node,
})

minetest.register_craftitem("materials:piece_of_cloth", {
	description = "Piece of cloth",
	inventory_image = "materials_piece_of_cloth.png",
	groups = {cloth=1,flammable = 1,treasure=1},
})

minetest.register_node("materials:plant_extracts", {
	description = "Plant extracts",
	inventory_image = "materials_plant_extracts.png",
	drawtype = "plantlike",
	tiles={"materials_plant_extracts.png"},
	groups = {dig_immediate = 3,flammable=1,used_by_npc=1,treasure=1},
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("materials:glass_bottle", {
	description = "Glass bottle",
	inventory_image = "materials_plant_extracts.png",
	drawtype = "plantlike",
	tiles={"materials_plant_extracts.png"},
	groups = {dig_immediate = 3,flammable=1,used_by_npc=1,treasure=1},
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("materials:plant_extracts_gas", {
	description = "Plant extracts gas",
	inventory_image = "materials_plant_extracts_gas.png",
	drawtype = "plantlike",
	tiles={"materials_plant_extracts_gas.png"},
	groups = {dig_immediate = 3,flammable=1,used_by_npc=1,treasure=1},
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craftitem("materials:piece_of_wood", {
	description = "Piece of wood",
	inventory_image = "materials_piece_of_wood.png",
	groups = {peace_of_wood=1,flammable = 1,treasure=1},
})

minetest.register_node("materials:mixed_wood", {
	description = "Mixed wood",
	tiles = {"materials_mixed_wood.png"},
	groups = {wood=1,flammable = 1,choppy=3,oddly_breakable_by_hand=3,used_by_npc=1,treasure=1},
	sounds = default.node_sound_wood_defaults(),
})
minetest.register_craftitem("materials:string", {
	description = "String",
	inventory_image = "materials_string.png",
	groups = {flammable = 1,treasure=1},
})

default.register_eatable("craftitem","materials:bread",1,10,{
	description = "Bread",
	inventory_image="materials_bread.png",
	groups={flammable=3,treasure=1},
})
minetest.register_craftitem("materials:plastic_sheet", {
	description = "Plastic sheet",
	inventory_image = "materials_plastic_sheet.png",
	groups = {flammable = 1,treasure=1},
})
minetest.register_craftitem("materials:gear_metal", {
	description = "Metal megear",
	inventory_image = "materials_gear_metal.png",
	groups = {treasure=1},
})
minetest.register_craftitem("materials:fanblade_metal", {
	description = "Metal fanblade",
	inventory_image = "materials_fanblade_metal.png",
	groups = {treasure=1},
})
minetest.register_craftitem("materials:fanblade_plastic", {
	description = "Plastic fanblade",
	inventory_image = "materials_fanblade_plastic.png",
	groups = {flammable=1,treasure=1},
})
minetest.register_craftitem("materials:tube_metal", {
	description = "Tube",
	inventory_image = "materials_tube_metal.png",
	groups = {flammable=1,treasure=1},
})

minetest.register_node("materials:spaceyfloor", {
	description = "Spacey floor",
	tiles={"materials_spaceyfloor.png"},
	groups = {cracky=2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_craftitem("materials:diode", {
	description = "Diode",
	inventory_image = "materials_diode.png"
})

minetest.register_craftitem("materials:sawblade", {
	description = "Sawblade",
	inventory_image = "materials_sawblade.png"
})

minetest.register_tool("materials:firethrower", {
	description = "Firethrower",
	inventory_image = "materials_firethrower.png",
	on_use=function(itemstack, user, pointed_thing)
		local d = user:get_look_dir()
		local p = user:get_pos()
		local inv = user:get_inventory()
		local index = user:get_wield_index()-1
		local stack = inv:get_stack("main",index)
		local n = user:get_player_name()

		if itemstack:get_wear() > 60000 then
			if stack:get_name() == "materials:plant_extracts_gas" then
				stack:take_item()
				inv:set_stack("main",index,stack)
				itemstack:set_wear(1)
				return itemstack
			else
				minetest.chat_send_player(n,"Put 'extracts gas' left slot of the tool to load")
				return itemstack
			end
		else
			itemstack:set_wear(itemstack:get_wear() + (65535/12))	
		end

		for i = 2,12,1 do
			local po = {x=p.x+(d.x*i),y=p.y+1.5+(d.y*i),z=p.z+(d.z*i)}
			if not minetest.is_protected(po, n) and default.defpos(po,"buildable_to") then
				minetest.add_node(po,{name="fire:basic_flame"})
			else
				break
			end
		end
		return itemstack
	end
})