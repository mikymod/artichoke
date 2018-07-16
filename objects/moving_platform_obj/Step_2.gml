if (pause_system_obj.game_pause || pause_system_obj.cam_transition_pause)
	return;
	
// sub-pixel movement
cx += vel_x;
cy += vel_y;
var new_vel_x = round(cx);
var new_vel_y = round(cy);
cx -= new_vel_x;
cy -= new_vel_y;

// Move Vertical
repeat(abs(new_vel_y))
{
    if (!place_meeting(x, y + sign(new_vel_y), inverter_obj))
	{
		with (actor_obj)
		{
			if (place_meeting(x, y + 1, other.id))
			{
				y += sign(new_vel_y);
			}
			
			if (place_meeting(x, y - 1, other.id))
				y += sign(new_vel_y);
		}
		
        y += sign(new_vel_y);
	}
    else
        vel_y *= -1;
}

// Move horizontal
repeat(abs(new_vel_x))
{
    if (!place_meeting(x + sign(new_vel_x), y, inverter_obj))
	{
		with (actor_obj)
		{
			if (place_meeting(x, y + 1, other.id))		
				x += sign(new_vel_x);
			
			if (place_meeting(x + 1, y, other.id) || place_meeting(x - 1, y, other.id))
				x += sign(new_vel_x);
		}
		x += sign(new_vel_x);
	}
    else
        vel_x *= -1;
}