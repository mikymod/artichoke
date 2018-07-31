key_left   = keyboard_check(vk_left)           || gamepad_axis_value(pad_id, gp_axislh) < -deadzone;
key_right  = keyboard_check(vk_right)          || gamepad_axis_value(pad_id, gp_axislh) > deadzone;
key_up     = keyboard_check(vk_up)             || gamepad_axis_value(pad_id, gp_axislv) < -deadzone;
key_down   = keyboard_check(vk_down)           || gamepad_axis_value(pad_id, gp_axislv) > deadzone;
key_jump   = keyboard_check_pressed(vk_space)  || gamepad_button_check_pressed(pad_id, gp_face1);
key_hook   = keyboard_check(ord("X"))          || gamepad_button_check(pad_id, gp_face3);
key_select = keyboard_check_pressed(vk_enter)  || gamepad_button_check_pressed(0, gp_face1);

axis_lh = gamepad_axis_value(pad_id, gp_axislh);
axis_lv = gamepad_axis_value(pad_id, gp_axislv);