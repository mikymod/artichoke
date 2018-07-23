draw_self();

if (hooked_target)
{
	draw_set_color(c_green);
	draw_line_width(x, y, hooked_target.x, hooked_target.y, 2);
	draw_set_color(c_white);
}
