
if (!instance_exists(player_obj))
{
	instance_destroy();
	exit;
}

switch (state)
{
	case GrappleState.Forward:
	{
		vel_x = lengthdir_x(vel, player_obj.hook_dir);
		vel_y = lengthdir_y(vel, player_obj.hook_dir);
		
		if (place_meeting(x, y + sign(vel_y), solid_obj) || place_meeting(x + sign(vel_x), y, solid_obj))
			state = GrappleState.Hooked;
		else if (point_distance(x, y, player_obj.x, player_obj.y) > max_travel_dist)
			state = GrappleState.Backward

		break;
	}
	case GrappleState.Hooked:
	{
		vel_x = 0;
		vel_y = 0;
		
		if (point_distance(x, y, player_obj.x, player_obj.y) < 50)
		{
			instance_destroy();
		}
		
		if (collision_line(x, y, player_obj.x, player_obj.y, solid_obj, false, true))
		{
			instance_destroy();
		}
	
		break;
	}
	case GrappleState.Backward:
	{
		var back_dir = point_direction(x, y, player_obj.x, player_obj.y);
		vel_x = lengthdir_x(vel, back_dir);
		vel_y = lengthdir_y(vel, back_dir);

		if (point_distance(x, y, player_obj.x, player_obj.y) < 50)
		{
			instance_destroy();
		}
		
		break;
	}
}

