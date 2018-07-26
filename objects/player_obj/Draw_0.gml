draw_self();

draw_sprite_ext(player_spr, 0, x, y, 1, 1, 0, c_red, 0.5);

with (grapple_obj)
{
	draw_set_color(c_green);
	draw_line_width(other.x, other.y, x, y, 2);
	draw_set_color(c_white);
}
