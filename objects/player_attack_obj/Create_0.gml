bboxleft   = 0;
bboxright  = 0;
bboxtop    = 0;
bboxbottom = 0;

// System
part_system = part_system_create();

// Particle
particle = part_type_create();
part_type_shape(particle, pt_shape_square);
part_type_direction(particle,0, 359, 1, 20);
part_type_speed(particle, -2, 2, 0, 0.5);
part_type_size(particle, 0.01, 0.06, 0, 0);
part_type_color1(particle, make_color_rgb(172, 212, 115));
part_type_blend(particle, false);

part_type_life(particle, 20, 30);
part_type_alpha2(particle, 0.5, 1);

// Emitter
emitter = part_emitter_create(part_system);