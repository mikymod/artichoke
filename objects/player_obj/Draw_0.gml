with (grapple_obj)
{
	draw_set_color(c_green);
	draw_line_width(other.x, other.y, x, y, 2);
	draw_set_color(c_white);
}

draw_set_alpha(0.5);
draw_set_color(c_red);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
draw_set_alpha(1.0);

draw_self();
