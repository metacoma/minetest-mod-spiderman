function spiderman_mode(player) 
  local player_pos = player:get_pos() 
  local player_look_dir = player:get_look_dir() 


  local to_pos = vector.add(player_pos, vector.multiply(player_look_dir, 800))
  
  local ray = minetest.raycast(player_pos, to_pos, true, true) 

  for p in ray do
    if p.type == "node" then
      player:move_to(vector.add(p.above, {x=1,y=1,z=1}))
    end
  end
end

minetest.register_tool("spiderman:cobweb", {
  description = "spiderman cobweb",
  inventory_image = "spiderman_cobweb.png",
  on_use = function(itemstack, user, pointed_thing) 
    spiderman_mode(user)
  end
})
