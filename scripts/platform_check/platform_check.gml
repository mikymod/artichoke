/// @description platform_check()

var collision_id = instance_place(x, y + sign(vel_y), solid_obj);
if (collision_id)
{
    if (vel_y >= 0)
    {
        // Platform below
        platform_target = collision_id;
    }
    else
    {
        // Platform above
        vel_y = 0;
    }
}

if (vel_y < 0)
{
    platform_target = 0;
}

if (instance_exists(platform_target))
{
    if (platform_target)
    {
        if (place_meeting(x, y + 1, platform_target) && !place_meeting(x, y, platform_target))
        {
            vel_y = 0;
            return true;
        }
        else
        {
            platform_target = 0;
        }
    }
}
else
{
    platform_target = 0;
}

if (vel_y > 0)
{
    with (actor_obj)
    {
        if (place_meeting(x, y - 1, other) && !place_meeting(x, y, other))
        {
            vel_y = 0;
        }   
    }
    
	with (jumpthru_obj)
	{
	    if (place_meeting(x, y - 1, other) && !place_meeting(x, y, other))
	    {
	        vel_y = 0;
	        other.platform_target = id;
	        return true;
	    }   
	}
}

platform_target = 0;

return false;