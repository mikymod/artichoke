input_delay--;
if (input_delay > 0)
	return;

key_up     = input_manager_obj.key_up;
key_down   = input_manager_obj.key_down;
key_select = keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1);

if (key_up || key_down || key_select)
	input_delay = max_input_delay;

if (key_up)
{
	items_cursor++;
	if (items_cursor > num_items - 1)
		items_cursor = 0;
}
else if (key_down)
{
	items_cursor--;
	if (items_cursor < 0)
		items_cursor = num_items - 1;
}

if (key_select)
{
	switch (items_cursor)
	{
		case 0:
		{
			game_end();
			break;
		}
		case 1:
		{
			if (file_exists("save.json"))
			{
				var file = file_text_open_read("save.json");
				var last_room = file_text_read_real(file);
				room_goto(last_room);
			}
			
			break;
		}
		case 2:
		{
			room_goto_next();
			break;
		}
	}
}