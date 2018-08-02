if (slowdown)
	time_multiplier -= 0.05;
else
	time_multiplier = 1;

time_multiplier = clamp(time_multiplier, 0.05, 1.0);