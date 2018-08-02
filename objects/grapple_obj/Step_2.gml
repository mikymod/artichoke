repeat (abs(vel_y))
{
	if (!place_meeting(x, y + sign(vel_y), solid_obj))
	    y += sign(vel_y);
}

repeat (abs(vel_x))
{
	if (!place_meeting(x + sign(vel_x), y, solid_obj))
	    x += sign(vel_x);
}