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