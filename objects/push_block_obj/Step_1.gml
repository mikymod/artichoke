var on_ground_prev = on_ground;
on_ground = is_grounded();

collision_left = place_meeting(x - 1, y, block_obj);
collision_right = place_meeting(x + 1, y, block_obj);

if (collision_left)
    wall_target = instance_place(x - 1, y, block_obj);

if (collision_right)
    wall_target = instance_place(x + 1, y, block_obj);

if (on_ground && !on_ground_prev)
{
    // Show dust particles
}