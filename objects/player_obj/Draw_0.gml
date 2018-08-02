switch (state)
{
	case PlayerState.Idle:
		sprite_index = player_spr;
		break;
	case PlayerState.Run:
		sprite_index = player_run_spr;
		break;
}

with (grapple_obj)
{
	draw_set_color(c_green);
	draw_line_width(other.x, other.y, x, y, 2);
	draw_set_color(c_white);
}

if (key_hook)
{
	draw_circle(x, y, 24, true);
	var xx = x + 24 * cos(-degtorad(hook_dir)); 
	var yy = y + 24 * sin(-degtorad(hook_dir)); 
	draw_circle(xx, yy, 3, false);
}

draw_self();
