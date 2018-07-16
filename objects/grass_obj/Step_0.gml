if (instance_place(x, y, actor_obj))
{ 
    with (instance_place(x, y, actor_obj))
	{
        // Move
        if (abs(vel_x) <= 1 && abs(vel_y) <= 1)
		{
            // Nothing
        }
		else if (abs(vel_x) <= 1)
            other.xskew = round(random_range(2, 4)) * choose(-1, 1);
        else
            other.xskew = round(random_range(2, 4)) * sign(vel_x);
            
        // Target
        if (abs(vel_x) > 1 || abs(vel_y) > 1)
            other.xset = other.xskew;
    }
}