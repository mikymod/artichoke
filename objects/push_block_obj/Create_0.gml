platform_target = 0;
wall_target = 0;

// Velocity
vel_x = 0;
vel_y = 0;

// Sub-pixel movement
c_x = 0;
c_y = 0;

// Solid
multiplier    = 0.8;
ground_accel  = 1.00 * multiplier;
ground_fric   = 2.00 * multiplier;
air_accel     = 0.75 * multiplier;
air_fric      = 0.01 * multiplier;
vel_x_max     = 5.50 * multiplier;
vel_y_max     = 10.0 * multiplier;
gravity_norm  = 0.50 * multiplier;
gravity_slide = 0.25 * multiplier;

on_ground = is_grounded();
collision_left = place_meeting(x - 1, y, solid_obj);
collision_right = place_meeting(x + 1, y, solid_obj);