// Sub-pixel movement
c_x += vel_x;
c_y += vel_y;
var new_vel_x = round(c_x);
var new_vel_y = round(c_y);
c_x -= new_vel_x;
c_y -= new_vel_y;

jumped = false;
landed = false;

// Vertical collisions
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
    if (!place_meeting(x, y + 1, solid_obj))
        landed = true;
    
    if (landed)
        vel_y = 0;
}

// Horizontal collisions
repeat (abs(vel_x))
{
    // Solid collision
    if (place_meeting(x + sign(vel_x), y, solid_obj) && !place_meeting(x + sign(vel_x), y - 1, solid_obj))
        y -= 1;
         
    if (place_meeting(x + sign(vel_x), y + 2, solid_obj) && !place_meeting(x + sign(vel_x), y + 1, solid_obj))
        y += 1;
        
    if (!place_meeting(x + sign(vel_x), y, solid_obj))
        x += sign(vel_x);
    else
        vel_x = 0;
}

// Pit death
if (bbox_right < 0 || bbox_left > room_width || bbox_top > room_height || bbox_bottom < 0)
    instance_destroy();