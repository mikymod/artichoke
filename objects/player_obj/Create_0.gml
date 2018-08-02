// Inherit the parent event
event_inherited();

// Input
key_left         = 0;
key_right        = 0;
key_up           = 0;
key_down         = 0;
key_jump         = 0;
key_dash         = 0;
key_attack       = 0;
key_block        = 0;

// Player
multiplier    = 0.75;
ground_accel  = 1.00 * multiplier;
ground_fric   = 2.00 * multiplier;
air_accel     = 0.75 * multiplier;
air_fric      = 0.01 * multiplier;
vel_x_max     = 4.5  * multiplier;
vel_y_max     = 10.0 * multiplier;
jump_height   = 8.00 * multiplier;
gravity_norm  = 0.50 * multiplier;
gravity_slide = 0.25 * multiplier;

cling_time    = 2.0;

// States
enum PlayerState
{
    Idle,
    Run,
    Jump,
	Hooking,
	MeleeAttack
}

state  = PlayerState.Idle;
facing = image_xscale;

xscale = 1;
yscale = 1;

attacking_melee = false;

aiming = false;
hooking = false;
max_hook_threshold = 0;
hook_threshold = max_hook_threshold;