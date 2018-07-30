if (pause_system_obj.game_pause || pause_system_obj.cam_transition_pause)
	return;
	
jumped = false;
landed = false;
hooked = false;

// Vertical movement
if (vel_y < 1 && vel_y > -1)
{
    platform_check();
}
else
{
    repeat(abs(vel_y))
    {
        if (!platform_check())
            y += sign(vel_y);
        else
            break;
    }
}

if (platform_target)
{
    if (!on_ground)
        landed = true;
    
    vel_y = 0;
}

with (grapple_obj)
{
	if (hooked)
	{
		var dir = point_direction(other.x, other.y, x, y);
		var dist = point_distance(other.x, other.y, x, y);
		other.vel_x = lengthdir_x(dist * 0.08, dir);
		other.vel_y = lengthdir_y(dist * 0.08, dir);
	}
}

// Horizontal movement
repeat(abs(vel_x))
{
    if (place_meeting(x + sign(vel_x), y, solid_obj) && !place_meeting(x + sign(vel_x), y - 1, solid_obj))
        y -= 1;
         
    if (place_meeting(x + sign(vel_x), y + 2, solid_obj) && !place_meeting(x + sign(vel_x), y + 1, solid_obj))
        y += 1;
      
    // Push block - horizontal collision push
    if (place_meeting(x + sign(vel_x), y, push_block_obj))
    {
        // // Push slowly
        vel_x = clamp(vel_x, -1, 1);
            
        with (instance_place(x + sign(vel_x), y, push_block_obj))
        {
             // UP slope
             if (place_meeting(x + sign(other.vel_x), y, solid_obj) && !place_meeting(x + sign(other.vel_x), y - 1, solid_obj))
                 --y;
            
             // DOWN slope
             if (!place_meeting(x + sign(other.vel_x), y, solid_obj) && !place_meeting(x + sign(other.vel_x), y + 1, solid_obj) && place_meeting(x + sign(other.vel_x), y + 2, solid_obj))
                 ++y;        

            if (!place_meeting(x + sign(other.vel_x), y, solid_obj))
                x += sign(other.vel_x); 
        }
    }
    
    if (!place_meeting(x + sign(vel_x), y, solid_obj))
        x += sign(vel_x);
    else
        vel_x = 0;
}

// Pit death
if (bbox_right < 0 || bbox_left > room_width || bbox_top > room_height || bbox_bottom < 0)
    instance_destroy();
	
// Squash death
if (collision_left && collision_right)
{
	var left = instance_place(x - 1, y, solid_obj);
	var right = instance_place(x + 1, y, solid_obj);
	
	if (left != noone && right != noone)
	{
		if (left.bbox_right > bbox_left || right.bbox_left < bbox_right)
		{
			show_debug_message("Squash");
			instance_destroy()
		}
	}
}