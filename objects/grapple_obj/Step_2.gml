vel_x = lengthdir_x(vel, dir);
vel_y = lengthdir_y(vel, dir);

repeat (abs(vel_y))
{
	if (!place_meeting(x, y + sign(vel_y), solid_obj))
        y += sign(vel_y);
    else
	{
        vel = 0;
		active = true;
	}
}

repeat (abs(vel_x))
{
	if (!place_meeting(x + sign(vel_x), y, solid_obj))
        x += sign(vel_x);
    else
	{
        vel = 0;
		active = true;
	}
}