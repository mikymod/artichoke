var vel_x = lengthdir_x(vel, dir);
var vel_y = lengthdir_y(vel, dir);

x += vel_x;
y += vel_y;

if (place_meeting(x + 1, y, solid_obj) || place_meeting(x - 1, y, solid_obj) || place_meeting(x, y - 1, solid_obj) || place_meeting(x, y + 1, solid_obj))
{
	vel = 0;
	active = true;
}