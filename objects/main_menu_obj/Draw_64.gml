gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width - gui_margin;
menu_y = gui_height - gui_margin;
menu_font_height = 12;

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < num_items; i++)
{
	var txt = items[i];
	var xx = menu_x;
	var yy = menu_y - (menu_font_height * (i * 2.5));
	var col;
	if (items_cursor == i)
	{
		txt = string_insert("> ", txt, 0);
		col = c_white;
	}
	else
	{
		col = c_gray;
	}
	
	draw_set_color(col);
	draw_text_transformed(xx, yy, txt, camera_get_view_width(view_camera[0]) / 640, camera_get_view_height(view_camera[0]) / 360, 0.0);
}