
enum TransitionDir
{
	None,
	Top,
	Left,
	Bottom,
	Right
};

dir      = TransitionDir.None;
//_time     = 60;      //step
//_cur_time = _time;   // step
size_w   = 640;     // px
size_h   = 360;     // px

offset_x = 0;       // px
offset_y = 0; // px
delta_offset_x = offset_x;
delta_offset_y = offset_y;

is_moving_x = false;
is_moving_y = false;
vel_x = 10;
vel_y = 10;
