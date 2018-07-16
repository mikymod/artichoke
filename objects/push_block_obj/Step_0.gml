// Apply the correct form of acceleration and friction
var accel;
var fric;
if (on_ground)
{
    accel = ground_accel;
    fric  = ground_fric;
}
else
{
    accel = air_accel;
    fric  = air_fric;
}

if (!on_ground)
{
    // Fall normally
    vel_y = approach(vel_y, vel_y_max, gravity_norm);
}