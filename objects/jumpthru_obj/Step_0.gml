if (instance_exists(player_obj))
{
	if ((player_obj.y + player_obj.sprite_height / 2) > y || player_obj.key_down)
		mask_index = -1;
	else
		mask_index = jumpthru_spr;
}