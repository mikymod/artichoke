if (pause_system_obj.game_pause || pause_system_obj.cam_transition_pause)
	return;
	
// Vertical movement
if (vel_y < 1 && vel_y > -1)
{
    platform_check();
}
else
{
    repeat(abs(vel_y))
    {
        if (!platform_check())
            y += sign(vel_y) * time_controller_obj.time_multiplier;
        else
            break;
    }
}
if (platform_target)
{   
    vel_y = 0;
}

// Horizontal movement
repeat(abs(vel_x))
{   
    if (!place_meeting(x + sign(vel_x), y, solid_obj))
        x += sign(vel_x) * time_controller_obj.time_multiplier;
    else
        vel_x = 0;
}

// Pit death
if (bbox_right < 0 || bbox_left > room_width || bbox_top > room_height || bbox_bottom < 0)
    instance_destroy();
	
// Squash death
if (collision_left && collision_right)
{
	var left = instance_place(x - 1, y, solid_obj);
	var right = instance_place(x + 1, y, solid_obj);
	
	if (left != noone && right != noone)
	{
		if (left.bbox_right > bbox_left || right.bbox_left < bbox_right)
		{
			show_debug_message("Squash");
			instance_destroy();
		}
	}
}