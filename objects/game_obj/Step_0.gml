var key_end           = keyboard_check_pressed(vk_escape);
var key_restart       = keyboard_check_pressed(ord("R"));
var key_next_room     = keyboard_check_pressed(vk_right);
var key_previous_room = keyboard_check_pressed(vk_left);
var key_fullscreen    = keyboard_check_pressed(ord("F"));
// test save system
var key_save          = keyboard_check_pressed(ord("S"));
var key_load          = keyboard_check_pressed(ord("L"));

if (key_next_room)
{
	if (room_next(room) == -1)
		room_goto(room_first);
	else
		room_goto_next();
}
else if (key_previous_room)
{
	if (room_previous(room) == -1)
		room_goto(room_last);
	else
		room_goto_previous();
}
else if (key_restart)
{
	room_restart();
}
else if (key_end)
{
	game_end();
}
else if (key_fullscreen)
{
	fullscreen = !fullscreen;
	window_set_fullscreen(fullscreen);
}
// test save system
else if (key_save)
{
	var json = save_instances();
	var file = file_text_open_write("save.json")
	file_text_write_string(file, json);
	file_text_close(file);
	
	url_open("save.json");
}
else if (key_load)
{
	var json = "";
	var file = file_text_open_read("save.json");
	while (!file_text_eof(file))
	{
		json += file_text_readln(file);
	}
	file_text_close(file);

	load_instances(json);
}