enum UnstableBlockState
{
	None,
	Active,
	Falling,
	Grounded
}
state = UnstableBlockState.None;

active_timer = 60; // step
vel_y_max = 5;
vel_y = 1;
gravity_norm = 0.5;