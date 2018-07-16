/// @description Insert description here
// You can write your code in this editor

// Movement
//vel_y = approach(vel_y, vel_y_max, gravity_norm);
if (sign(vel_x) > 0)
	vel_x = approach(vel_x, vel_x_max, air_accel);
else
	vel_x = approach(vel_x, -vel_x_max, air_accel);


