on_ground = is_grounded();
collision_left = place_meeting(x - 1, y, solid_obj);
collision_right = place_meeting(x + 1, y, solid_obj);

if (collision_left)
    wall_target = instance_place(x - 1, y, solid_obj);

if (collision_right)
    wall_target = instance_place(x + 1, y, solid_obj);