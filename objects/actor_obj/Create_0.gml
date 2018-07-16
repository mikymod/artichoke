jumped = false;
landed = false;

platform_target = 0;
wall_target = 0;

// Velocity
vel_x = 0;
vel_y = 0;

// Sub-pixel movement
c_x = 0;
c_y = 0;

on_ground = is_grounded();
collision_left = place_meeting(x - 1, y, solid_obj);
collision_right = place_meeting(x + 1, y, solid_obj);
