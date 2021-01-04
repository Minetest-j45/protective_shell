local etime = 0

minetest.register_globalstep(function(dtime)
	etime = etime + dtime
	if etime < 1 then return end
	local player = minetest.localplayer
	if not player then return end
	local pos = player:get_pos()
	local item = player:get_wielded_item()
	local def = minetest.get_item_def(item:get_name())
	local nodes_per_tick = tonumber(minetest.settings:get("nodes_per_tick")) or 8
	if item:get_count() > 0 and def.node_placement_prediction ~= "" then
    	if minetest.settings:get_bool("prot_shell") then
			minetest.place_node(vector.add(pos, {x = 0, y = 2, z = 0}))--above
			minetest.place_node(vector.add(pos, {x = 0, y = -0.6, z = 0}))--below
			minetest.place_node(vector.add(pos, {x = 1, y = 0.4, z = 0}))--(+x) lower
			minetest.place_node(vector.add(pos, {x = 1, y = 1.4, z = 0}))--(+x) higher
			minetest.place_node(vector.add(pos, {x = -1, y = 0.4, z = 0}))--(-x) lower
			minetest.place_node(vector.add(pos, {x = -1, y = 1.4, z = 0}))--(-x) higher
			minetest.place_node(vector.add(pos, {x = 0, y = 0.4, z = 1}))--(+z) lower
			minetest.place_node(vector.add(pos, {x = 0, y = 1.4, z = 1}))--(+z) higher
			minetest.place_node(vector.add(pos, {x = 0, y = 0.4, z = -1}))--(-z) lower
			minetest.place_node(vector.add(pos, {x = 0, y = 1.4, z = -1}))--(-z) higher
		end
	end
end)
	
	
minetest.register_cheat("ProtectiveShell", "Combat", "prot_shell")