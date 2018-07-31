if (debug_mode)
{
	var xx = display_get_gui_width() / 8;
	var yy = display_get_gui_height() / 4;
	if gamepad_is_connected(pad_id)
	{
		draw_text(xx, yy, "Gamepad Slot - " + string(pad_id));
		draw_text(xx, yy + 20, "Gamepad Type - " + string(gamepad_get_description(pad_id)));
		draw_text(xx, yy + 40, "Left H Axis - " + string(gamepad_axis_value(pad_id, gp_axislh)));
		draw_text(xx, yy + 60, "Left V Axis - " + string(gamepad_axis_value(pad_id, gp_axislv)));
		draw_text(xx, yy + 80, "Right H Axis - " + string(gamepad_axis_value(pad_id, gp_axisrh)));
		draw_text(xx, yy + 100, "Right V Axis - " + string(gamepad_axis_value(pad_id, gp_axisrv)));   
		draw_text(xx, yy + 120, "Fire Rate - " + string(gamepad_button_value(pad_id, gp_shoulderrb)));
	}
	else
	{
		draw_text(xx, yy, "Gamepad Slot - " + string(pad_id));
		draw_text(xx, yy + 20, "Gamepad not connected" + string(gamepad_get_description(pad_id)));
	}
}