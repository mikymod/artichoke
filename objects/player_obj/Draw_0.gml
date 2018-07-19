draw_self();

// test
if (hooked_istance)
{
	draw_set_color(c_red);
	draw_line(x, y, x + lengthdir_x(hook_range, hook_dir), y + lengthdir_y(hook_range, hook_dir));
	draw_set_color(c_white);
}