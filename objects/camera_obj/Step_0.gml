var camera_left_edge   = offset_x;
var camera_right_edge  = offset_x + size_w;
var camera_top_edge    = offset_y;
var camera_bottom_edge = offset_y + size_h;

if (instance_exists(player_obj))
{
	// Evaluate new offsets and limits
	if (player_obj.bbox_right <= camera_left_edge) dir = TransitionDir.Left;
	else if (player_obj.bbox_left >= camera_right_edge)	dir = TransitionDir.Right;
	else if (player_obj.bbox_bottom <= camera_top_edge) dir = TransitionDir.Top;
	else if (player_obj.bbox_top >= camera_bottom_edge)	dir = TransitionDir.Bottom;

	switch (dir)
	{
		case TransitionDir.Top:
		{
			offset_y -= size_h;
			vel_y *= -1;
			is_moving_y = true;
			break;
		}
		case TransitionDir.Left:
		{
			offset_x -= size_w;
			vel_x *= -1;
			is_moving_x = true;
			break;
		}
		case TransitionDir.Bottom:
		{
			offset_y += size_h;
			vel_y = abs(vel_y);
			is_moving_y = true;		
			break;
		}
		case TransitionDir.Right:
		{
			offset_x += size_w;
			vel_x = abs(vel_x);
			is_moving_x = true;		
			break;
		}
	}

	dir = TransitionDir.None;

	if (is_moving_x)
	{
		if ((sign(vel_x) > 0) && (delta_offset_x + vel_x > offset_x) || (sign(vel_x) < 0) && (delta_offset_x + vel_x < offset_x))
		{
			is_moving_x = false;
			delta_offset_x = offset_x;
			pause_system_obj.cam_transition_pause = false;
		}
		else
		{
			delta_offset_x += vel_x;			
			pause_system_obj.cam_transition_pause = true;
		}
	}

	if (is_moving_y)
	{
		if ((sign(vel_y) > 0) && (delta_offset_y + vel_y > offset_y) || (sign(vel_y) < 0) && (delta_offset_y + vel_y < offset_y))
		{
			is_moving_y = false;
			delta_offset_y = offset_y;
			pause_system_obj.cam_transition_pause = false;
		}
		else
		{
			delta_offset_y += vel_y;
			pause_system_obj.cam_transition_pause = true;
		}
	}
}