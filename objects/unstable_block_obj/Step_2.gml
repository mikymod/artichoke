switch (state)
{
	case UnstableBlockState.None:
	{
		if (place_meeting(x, y - 1, player_obj) || place_meeting(x + 1, y, player_obj) || place_meeting(x - 1, y, player_obj))
			state = UnstableBlockState.Active;
		
		break;
	}
	case UnstableBlockState.Active:
	{
		active_timer--;
		if (active_timer <= 0)
			state = UnstableBlockState.Falling;

		break;
	}
	case UnstableBlockState.Falling:
	{
		vel_y = approach(vel_y, vel_y_max, gravity_norm);

		repeat(abs(vel_y))
		{
			if (!place_meeting(x, y + sign(vel_y), solid_obj))
			{
		        y += sign(vel_y);
			}
			else
			{
				state = UnstableBlockState.Grounded;
			}
		}
		
		break;
	}
	case UnstableBlockState.Grounded:
	{
		vel_y = 0;
		
		break;
	}
}