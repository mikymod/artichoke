
key_left   = keyboard_check(ord("A"))         || gamepad_axis_value(pad_id, gp_axislh) < -deadzone;
key_right  = keyboard_check(ord("D"))         || gamepad_axis_value(pad_id, gp_axislh) > deadzone;
key_up     = keyboard_check(ord("W"))         || gamepad_axis_value(pad_id, gp_axislv) < -deadzone;
key_down   = keyboard_check(ord("S"))         || gamepad_axis_value(pad_id, gp_axislv) > deadzone;
key_jump   = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(pad_id, gp_face1);
key_hook   = mouse_check_button(mb_left)      || gamepad_button_check(pad_id, gp_face3);
key_select = keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1);

pad_active = gamepad_axis_value(pad_id, gp_axislh) < -deadzone ||
             gamepad_axis_value(pad_id, gp_axislh) > deadzone  ||
             gamepad_axis_value(pad_id, gp_axislv) < -deadzone ||
			 gamepad_axis_value(pad_id, gp_axislv) > deadzone;

axis_lh = gamepad_axis_value(pad_id, gp_axislh);
axis_lv = gamepad_axis_value(pad_id, gp_axislv);
