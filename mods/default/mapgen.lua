minetest.register_alias("mapgen_stone","default:stone")
minetest.register_alias("mapgen_water_source","default:water_source")
minetest.register_alias("mapgen_river_water_source","default:water_source")

minetest.register_biome({
	name = "ocean",
	node_top = "default:sand",
	depth_top = 5,
	depth_filler = 5,
	node_stone = "default:stone",
	node_water = "default:salt_water_source",
	node_river_water = "default:salt_water_source",
	y_min = -31000,
	y_max = 0,
	heat_point = 50,
	humidity_point = 50,
})


minetest.register_biome({
	name = "grassland",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	--node_stone = "default:stone",
	--node_water = "default:water_source",
	--node_river_water = "default:water_source",
	y_min = 1,
	y_max = 31000,
	heat_point = 50,
	humidity_point = 50,
})

--||||||||||||||||
-- =======================Decorations
--||||||||||||||||

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.006,
		scale = 0.002,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"grassland"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("default") .. "/schematics/default_tree.mts",
	flags = "place_center_x, place_center_z",
	})




--[[
minetest.register_biome({
	name = "underground",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	node_stone = "default:stone",
	node_water_top = "",
	depth_water_top =0 ,
	node_water = "",
	node_river_water = "",
	y_min = -31000,
	y_max = 0,
	heat_point = 50,
	humidity_point = 50,
})
--]]