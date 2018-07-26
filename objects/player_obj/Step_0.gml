if (pause_system_obj.game_pause || pause_system_obj.cam_transition_pause)
	return;
	
// Input
key_left          = keyboard_check(ord("A"))          || gamepad_axis_value(0, gp_axislh) < -0.4;
key_right         = keyboard_check(ord("D"))          || gamepad_axis_value(0, gp_axislh) >  0.4;
key_up            = keyboard_check(ord("W"))          || gamepad_axis_value(0, gp_axislv) < -0.4;
key_down          = keyboard_check(ord("S"))          || gamepad_axis_value(0, gp_axislv) >  0.4;
key_jump          = keyboard_check_pressed(vk_space)  || gamepad_button_check_pressed(0, gp_face1);
key_hook          = keyboard_check(ord("E"))          || gamepad_button_check(0, gp_face3);
key_attack_melee  = keyboard_check(ord("Q"))          || gamepad_button_check(0, gp_face2);

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
    if ((collision_left || collision_right) && vel_y >= 0) {
        // Wall slide
        vel_y = approach(vel_y, vel_y_max, gravity_slide);
    } else {
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

// Melee Attack
with (player_attack_obj)
{
	instance_destroy();
	other.attacking_melee = false;
}
if (key_attack_melee && !attacking_melee)
{
	state = PlayerState.MeleeAttack;
	attacking_melee = true;
	
	with (instance_create_layer(x, y, "player", player_attack_obj))
	{
        bboxleft  = min(other.x + (5 * other.facing), other.x + (24 * other.facing));
        bboxright = max(other.x + (5 * other.facing), other.x + (24 * other.facing));   
        bboxtop    = other.y - 1;
        bboxbottom = other.y + 8;
    }
}

// Hook
if (key_hook)
{
	if (!hooking)
	{
		hooking = true
		var hook_horizontal_input = key_right - key_left;
		var hook_vertical_input   = key_down - key_up;
		if (on_ground && hook_vertical_input == 0) hook_horizontal_input = facing;
		grapple = instance_create_layer(x, y, "player", grapple_obj);
		with (grapple)
			dir = point_direction(x, y, x + hook_horizontal_input, y + hook_vertical_input);
	}
}
else
{
	hooking = false;
	grapple = 0;
	
	with (grapple_obj)
	{
		instance_destroy();
	}
}