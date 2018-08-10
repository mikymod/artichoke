if (!instance_exists(player_obj))
	return;

if (round(player_obj.y + player_obj.sprite_height / 2) > y || input_manager_obj.key_down)
	mask_index = -1;
else
	mask_index = jumpthru_spr;

show_debug_message("obj y: " + string(y));
show_debug_message("player height: " + string(round(player_obj.y + player_obj.sprite_height / 2)));