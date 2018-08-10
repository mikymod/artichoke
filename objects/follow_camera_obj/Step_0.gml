if (instance_exists(player_obj))
{
	x = lerp(x, player_obj.x, 0.1);
	y = lerp(y, player_obj.y - height / 4, 0.1);
	x = clamp(x, width / 2, room_width - width / 2);
	y = clamp(y, height / 2, room_height - height / 2);
	camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);
}