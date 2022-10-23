minetest.register_chatcommand("play_scene", {
	params = "",
	description = "",
	privs = {server=true},
	func = function(name, param)
		local pos = vector.new(-50,28501,0)
		minetest.emerge_area(vector.add(pos,50),vector.subtract(pos,50))
		minetest.after(3,function(pos)
			nodeextractor.set(pos,minetest.get_modpath("scene").."/nodeextractor/scene1.exexn")
		end,pos)
		minetest.after(4,function()
			scene.fade(minetest.get_player_by_name("singleplayer"),true)
		end)
		minetest.after(6,function()
			minetest.get_player_by_name("singleplayer"):set_pos(vector.new(-14,28502,19))
		end)
		minetest.after(8,function()
			scene.scenes["all gets started"]()
		end)

--
		scene.resetplayerpos = minetest.get_player_by_name("singleplayer"):get_pos()
--
	end
})

scene.add_scene("all gets started",function()
	local player = minetest.get_player_by_name("singleplayer")
	player:set_pos(vector.new(-14,28502,19))
	scene.fade(player,false)

	local terminator1 = minetest.add_entity(vector.new(-28,28501.5,21), "examobs:terminator"):get_luaentity()
	terminator1.standby = true
	terminator1.cmdphone_no_jumping = true
	terminator1.object:set_yaw(math.pi*1.5)

	local wolf = minetest.add_entity(vector.new(-33,28504,69), "examobs:wolf"):get_luaentity()
	wolf.standby = true
	wolf.object:set_yaw(0)
	wolf.object:set_properties({is_visible = false})

	local npc1 = minetest.add_entity(vector.new(-23,28501.5,19), "examobs:npc"):get_luaentity()
	npc1.standby = true
	npc1.object:set_yaw(math.pi*1.5)
	npc1.storage.code_execute_interval = "mob.lookat_local((math.random(-10,10)*0.01)+math.pi*1.5)"
	npc1.storage.code_execute_interval_user = "singleplayer"

	local item = minetest.add_item(vector.new(-25.5,28503,16.5),"exatec:cmdphone")

	local cam = scene.spawn_camera(vector.new(-20,28502,19),player)
	cam:get_luaentity():lookat(npc1.object:get_pos())
	
	scene.film(player,true)

	scene.filmtext(player,"HI AND HELLO!")
	
	scene.add_anim(3,function()
			scene.filmtext(player,"This is our brand new product we call CMDPhone.")
	end)
	scene.add_anim(5,function()
			scene.filmtext(player,"With this advanced called phone")
	end)
	scene.add_anim(7,function()
			scene.filmtext(player,"you can control robots to do whatever you want!")
	end)
	scene.add_anim(9,function()
			scene.filmtext(player,"Examples:")
	end)
--mine
	scene.add_anim(10,function()
		scene.filmtext(player,"Mining")
		minetest.set_node(vector.new(-16,28503,79),{name="default:stone"})
		minetest.set_node(vector.new(-13,28503,81),{name="default:stone"})
		terminator1.object:set_pos(vector.new(-14,28502.5,79))
		cam:set_pos(vector.new(-11,28509,78))
		cam:get_luaentity():lookat(vector.new(-14,28503,79))
	end)
	scene.add_anim(11,function()
		local pos = vector.new(-16,28503,79)
		examobs.lookat(terminator1,pos)
		examobs.anim(terminator1,"attack")
		minetest.remove_node(pos)
	end)
	scene.add_anim(11.2,function()
		examobs.stand(terminator1)
	end)
	scene.add_anim(12,function()
		local pos = vector.new(-13,28503,81)
		examobs.lookat(terminator1,pos)
		examobs.anim(terminator1,"attack")
		minetest.remove_node(pos)
	end)
	scene.add_anim(12.2,function()
		examobs.stand(terminator1)
	end)
--build
	scene.add_anim(13,function()
		scene.filmtext(player,"Building")
		local pos = vector.new(vector.new(-37,28504,52))
		minetest.remove_node(pos)
		terminator1.object:set_pos(vector.new(-36,28502.5,54))
		cam:set_pos(vector.new(-30,28509,55))
		cam:get_luaentity():lookat(pos)
	end)
	scene.add_anim(14,function()
		local pos = vector.new(-37,28504,52)
		examobs.lookat(terminator1,pos)
		examobs.anim(terminator1,"attack")
		minetest.set_node(pos,{name="default:mossycobble"})
	end)
	scene.add_anim(14.2,function()
		examobs.stand(terminator1)
	end)
--farm
	scene.add_anim(15,function()
		scene.filmtext(player,"Farming")
		local pos = vector.new(-29,28502.5,55)
		terminator1.object:set_pos(pos)
		cam:set_pos(vector.new(-20,28509,55))
		cam:get_luaentity():lookat(pos)
		examobs.lookat(terminator1,cam)
	end)
--Protection
	scene.add_anim(16,function()
		scene.filmtext(player,"Protection")
		local pos = vector.new(-33,28502.5,79)
		terminator1.object:set_pos(pos)
		cam:set_pos(vector.new(-26,28506,65))
		cam:get_luaentity():lookat(pos)
		wolf.object:set_properties({is_visible = true})
		examobs.walk(wolf,true)
		examobs.lookat(terminator1,wolf.object)
	end)
	scene.add_anim(17,function()
		examobs.punch(terminator1.object,wolf.object,50)
		wolf.object:set_velocity(vector.new(0,10,-50))
		examobs.anim(terminator1,"attack")
	end)
	scene.add_anim(17.2,function()
		examobs.stand(terminator1)
	end)
--main
	scene.add_anim(17.5,function()
		terminator1.object:set_pos(vector.new(-28,28501.5,21))
		terminator1.object:set_yaw(math.pi*1.5)
		cam:set_pos(vector.new(-20,28502,19))
		cam:get_luaentity():lookat(npc1.object:get_pos())
		scene.filmtext(player,"Hunting, Work in factories")
	end)
	scene.add_anim(18,function()
		wolf.object:set_pos(vector.new(-31,28503,45))
		wolf.object:set_velocity(vector.new(0,10,-50))
	end)
	scene.add_anim(18.5,function()
			scene.filmtext(player,"And so much more!")
	end)
	scene.add_anim(22,function()
			scene.filmtext(player,"Make your life so much more confertable with free workers!")
	end)
	scene.add_anim(24,function()
			scene.filmtext(player,"With it's CMD based mind controlling system")
	end)
	scene.add_anim(26,function()
			scene.filmtext(player," it can force robots by your written lua code")
	end)
	scene.add_anim(28,function()
			scene.filmtext(player," to do exactly what you want without any rebellion, because you are controlling their mind!")
	end)
	scene.add_anim(31,function()
			scene.filmtext(player,"Of cource you could control other mobs too, but robots is effectiver,")
			examobs.lookat(terminator1,npc1.object)
	end)
	scene.add_anim(33,function()
			scene.filmtext(player,"as you just seen.")
	end)
	scene.add_anim(35,function()
			examobs.lookat(terminator1,item)
			scene.filmtext(player,"Order your own already today!")
	end)
	scene.add_anim(37,function()
		examobs.walk(terminator1)
		scene.filmtext(player,"As we already told it makes your life so much more comfortable.")
	end)
	scene.add_anim(38,function()
		examobs.stand(terminator1)
	end)
	scene.add_anim(39,function()
		examobs.anim(terminator1,"attack")
		item:remove()
		scene.filmtext(player,"As we already told it makes your life so much more comfortable.")
	end)
	scene.add_anim(39.2,function()
		examobs.anim(terminator1,"stand")
	end)
	scene.add_anim(41,function()
		scene.filmtext(player,"Skip the work and force the robots do work for your.")
	end)
	scene.add_anim(43,function()
		examobs.lookat(terminator1,npc1.object)
		scene.filmtext(player,"Don't forget: free workers = more work done = more money made,")
	end)
	scene.add_anim(45,function()
		scene.filmtext(player," and you can spend time on something more interesting or")
	end)
	scene.add_anim(47,function()
		examobs.anim(terminator1,"attack")
		scene.filmtext(player)
		npc1.storage.code_execute_interval = ""
		npc1.object:set_yaw(math.pi*1.5)
		local t = npc1.object:get_properties().textures
		npc1.object:set_properties({textures={t[1] .. "^scene_controlled_eye.png"}})
	end)
	scene.add_anim(47.2,function()
		examobs.anim(terminator1,"stand")
	end)

	scene.add_anim(49,function()
		examobs.anim(npc1,"hugwalk")
		npc1.object:set_velocity(vector.new(2,0,0))
		local a = player_style.registered_profiles.default.animation.hugwalk
		npc1.object:set_animation({x=a.x,y=a.y},a.speed,0,true)
	end)
	scene.add_anim(50,function()
		scene.fade(player,true,true)
	end)
	scene.add_anim(51,function()
		terminator1.object:remove()
		npc1.object:remove()
		player:set_detach()
		cam:remove()
		scene.film(player)
		scene.fade(player,false)
--
		player:set_pos(scene.resetplayerpos)
--
	end)


--[[



		scene.filmtext(player,"")
	scene.add_anim(20,function()
			scene.filmtext(player,"")
	end)
--]]

end)




--[[

minetest.register_on_mods_loaded(function()
	--scene.add_anim(time,func)
end)


player:get_meta():get_int("scene")
minetest.register_on_player_receive_fields(function(player, form, pressed)
end)
minetest.register_on_respawnplayer(function(player)
end)
minetest.register_on_dieplayer(function(player)
end)

minetest.set_node(pos,{name=item})

minetest.remove_node(pos)

examobs.dropall(self)

examobs.jump(self)



--]]