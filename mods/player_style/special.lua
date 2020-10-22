special={
	user={},
	num = 5,
	blocks = {
		["default:qblock_FF0000"]={i=1,
			ability="No hunger",
			image="player_style_hunger_bar.png",
			meta = "no_hunger",
			trigger=function(player)
				local m = player:get_meta()
				m:set_int("no_hunger",m:get_int("no_hunger")+100)
				special.hud(player,"default:qblock_FF0000")
			end,
			use=function(player)
				local m = player:get_meta()
				local f  = m:get_int("no_hunger")
				if f > 0 then
					m:set_int("no_hunger",f-1)
					special.hud(player,"default:qblock_FF0000")
					return true
				end
			end,
			count=function(player)
				return player:get_meta():get_int("no_hunger")
			end
		},
		["default:qblock_1c7800"]={i=2,
			meta = "?"
		},
		["default:qblock_e29f00"]={i=3,
			ability="Fire resistance",
			image="fire_basic_flame.png",
			meta = "fire_resistance",
			trigger=function(player)
				local m = player:get_meta()
				m:set_int("fire_resistance",m:get_int("fire_resistance")+100)
				special.hud(player,"default:qblock_e29f00")
			end,
			use=function(player)
				local m = player:get_meta()
				local f  = m:get_int("fire_resistance")
				if f > 0 then
					m:set_int("fire_resistance",f-1)
					special.hud(player,"default:qblock_e29f00")
					return true
				end
			end,
			count=function(player)
				return player:get_meta():get_int("fire_resistance")
			end
		},
		["default:qblock_800080"]={i=4,
			meta = "?"
		},
		["default:qblock_0000FF"]={i=5,
			meta = "?"
		},
	}
}


special.hud=function(player,n)
	local b = special.blocks[n]

	if not b.trigger then
		return
	end

	local u = special.user[player:get_player_name()]
	local c = b.count(player)
	if u[n] then
		if c <= 0 then
			player:hud_remove(u[n].text)
			player:hud_remove(u[n].image)
		else
			player:hud_change(u[n].text, "text", c)
		end
	elseif c > 0 then
		u[n] = {
		text = player:hud_add({
			hud_elem_type="text",
			scale = {x=200,y=60},
			text=b.count(player),
			number=0xFFFFFF,
			offset={x=32,y=8},
			position={x=0,y=0.5+(b.i*0.04)},
			alignment={x=1,y=1},
		}),
		image = player:hud_add({
			hud_elem_type="image",
			scale = {x=2,y=2},
			position={x=0,y=0.5+(b.i*0.04)},
			text=b.image,
			offset={x=16,y=8},
		})}
	end	
end

special.use_ability=function(player,ab)
	for i,v in pairs(special.blocks) do
		if v.meta == ab then
			return v.use(player)
		end
	end
end

player_style.register_button({
	name="special",
	image="default:qblock_FF0000",
	type="item_image",
	info="Abilities",
	action=function(user)
		special.show(user)
	end
})

special.show=function(player)
	minetest.after(0.2, function(player)
		local name = player:get_player_name()
		local inv = special.user[name].inv
		local slots = ""
		for i,v in pairs(special.blocks) do
			slots = slots .. "item_image["..(v.i+0.5)..",0.2;1,1;"..i.."]"
			if inv:get_stack("main",v.i):get_count() > 0 then
				local info = "?"
				if v.trigger then
					info = v.ability
					slots = slots .. "label["..(v.i+0.5)..",-0.3;"..v.count(player).."]" ..
					"image_button["..(v.i+0.5)..",1.2;1,1;player_style_coin.png;specialbut_"..i..";100]tooltip[specialbut_"..i..";"..info.."]"
				else
					slots = slots .. "label["..(v.i+0.5)..",1;yet\nunable]"
				end
			end
		end
		return minetest.show_formspec(name, "special",
		"size[8,6]" ..
		"listcolors[#77777777;#777777aa;#000000ff]"..
		"list[detached:special;main;1.5,0.2;"..special.num..",1;]" ..
		"list[current_player;main;0,2.3;8,4;]" ..
		slots)
	end, player)
end

minetest.register_on_player_receive_fields(function(player, form, pressed)
	if form == "special" then
		for i,v in pairs(pressed) do
			if string.sub(i,1,11) == "specialbut_" then
				local m = player:get_meta()
				local b = special.blocks[string.sub(i,12,-1)]
				if m:get_int(b.meta) <= 99900 then
					m:set_int("coins",m:get_int("coins")-100)
					b.trigger(player)
					special.show(player)
				end
				return
			end
		end
	end
end)

special.update=function(player)
	local name = player:get_player_name()
	local inv = special.user[name].inv:get_list("main")
	local d = {}
	for i,v in pairs(inv) do
		table.insert(d, v:to_table())
	end
	player:get_meta():set_string("special",minetest.serialize(d))
end

minetest.register_on_leaveplayer(function(player)
	special.user[player:get_player_name()] = nil
end)

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	special.user[name]={}
	special.user[name].inv=minetest.create_detached_inventory("special", {
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			return 0
		end,
		allow_put = function(inv, listname, index, stack, player)
			local b = special.blocks[stack:get_name()]
			return b and b.i == index and inv:get_stack("main",b.i):get_count() == 0 and 1 or 0
		end,
		allow_take = function(inv, listname, index, stack, player)
			return stack:get_count()
		end,
		on_put = function(inv, listname, index, stack, player)
			special.update(player)
			special.show(player)
		end,
		on_take = function(inv, listname, index, stack, player)
			special.update(player)
			special.show(player)
		end,
	})
	special.user[name].inv:set_size("main", special.num)
	local list = {}
	for i,v in pairs(minetest.deserialize(player:get_meta():get_string("special") or "") or {}) do
		list[special.blocks[v.name].i] = v.name
	end
	special.user[name].inv:set_list("main", list)
	special.update(player)
	local m = player:get_meta()
	for i,v in pairs(special.blocks) do
		if m:get_int(v.meta) then
			special.hud(player,i)
		end
	end
end)