if (pause_system_obj.game_pause || pause_system_obj.cam_transition_pause)
	return;
	
// Input
key_left  = controller_obj.key_left;
key_right = controller_obj.key_right;
key_up    = controller_obj.key_up;
key_down  = controller_obj.key_down;
key_jump  = controller_obj.key_jump;
key_hook  = controller_obj.key_hook;

// Apply the correct acceleration and friction
var accel;
var fric;
if (on_ground)
{
    accel = ground_accel;
    fric  = ground_fric;
}
else
{
    accel = air_accel;
    fric  = air_fric; 
}

// Reset wall stick
if ((!collision_right && !collision_left) || on_ground)
{
    can_stick = true;
    sticking = false;
}

// Cling to wall
if (((key_right && collision_left) || (key_left && collision_right)) && can_stick && !on_ground)
{
    alarm[0] = cling_time;
    sticking = true; 
    can_stick = false;       
}

// Handle gravity
if (!on_ground) {
    if ((collision_left || collision_right) && vel_y >= 0)
	{
        // Wall slide
        vel_y = approach(vel_y, vel_y_max, gravity_slide);
    }
	else
	{
        // Fall normally
        vel_y = approach(vel_y, vel_y_max, gravity_norm);
    }
}

// Movement
if (key_left && !key_right && !sticking)
{
    // Left
    facing = -1;
    state  = PlayerState.Run;
    
    // Apply acceleration left
    if (vel_x > 0)
        vel_x = approach(vel_x, 0, fric);
        
    vel_x = approach(vel_x, -vel_x_max, accel);
}
else if (key_right && !key_left && !sticking)
{
    facing = 1;
    state  = PlayerState.Run;
    
    // Apply acceleration right
    if (vel_x < 0)
        vel_x = approach(vel_x, 0, fric);
        
    vel_x = approach(vel_x, vel_x_max, accel);
}

// Apply Friction
if (!key_right && !key_left)
{
    vel_x = approach(vel_x, 0, fric);
    state = PlayerState.Idle;
}

// Wall jump
if (key_jump && collision_left && !on_ground)
{
    yscale = 1.33;
    xscale = 0.67;
            
    if (key_left)
    {
        vel_y = -jump_height * 1.2;
        vel_x =  jump_height * .66;
    }
    else
    {
        vel_y = -jump_height * 1.1;
        vel_x =  vel_x_max; 
    }  
}

if (key_jump && collision_right && !on_ground)
{
    yscale = 1.33;
    xscale = 0.67;
    
    if (key_right)
    {
        vel_y = -jump_height * 1.2;
        vel_x = -jump_height * .66;
    }
    else
    {
        vel_y = -jump_height * 1.1;
        vel_x = -vel_x_max;
    }
}
 
// Jump 
if (key_jump)
{ 
    if (on_ground)
    {
        vel_y = -jump_height;
        
        yscale = 1.33;
        xscale = 0.67;
    }
}

if (!on_ground)
{
    state = PlayerState.Jump;
}

// Swap facing during wall slide
if (collision_right && !on_ground)
    facing = -1;
else if (collision_left && !on_ground)
    facing = 1;

// Change sprite facing
image_xscale = facing;

// Squash + Stretch
xscale = approach(xscale, 1, 0.05);
yscale = approach(yscale, 1, 0.05);

// Hook
hook_dir = point_direction(0, 0, controller_obj.axis_lh, controller_obj.axis_lv);
if (key_hook && !instance_exists(grapple_obj))
{
	time_controller_obj.slowdown = true;
	
	aiming = true;
}
else
{
	time_controller_obj.slowdown = false;
	
	if (aiming)
	{
		with (instance_create_layer(x, y, "player", grapple_obj))
		{
			vel_x = lengthdir_x(vel, other.hook_dir);
			vel_y = lengthdir_y(vel, other.hook_dir);
		}
		
		aiming = false;
		hooking = true;
	}
}

with (grapple_obj)
{
	if (state == GrappleState.Hooked)
	{
		var dir = point_direction(other.x, other.y, x, y);
		var dist = point_distance(other.x, other.y, x, y);
		dist = clamp(dist, 0, 125);
		other.vel_x = lengthdir_x(dist * 0.08, dir);
		other.vel_y = lengthdir_y(dist * 0.08, dir);
	}
}