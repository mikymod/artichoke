with (grass_obj)
{
    if (!cut)
	{
		// Chop grass
		if (!(bbox_left > other.bboxright || bbox_right < other.bboxleft || bbox_top > other.bboxbottom || bbox_bottom < other.bboxtop))
		{
            switch (sprite_index)
			{
			    case grass_fg_spr:
			        sprite_index = grass_fg2_spr;
					part_emitter_region(
						other.part_system,
						other.emitter,
						other.bboxleft,
						other.bboxright,
						other.bboxtop,
						other.bboxbottom,
						ps_shape_ellipse,
						ps_distr_linear
					);
					part_emitter_burst(other.part_system, other.emitter, other.particle, 10);
					
					break;
				case grass_bg_spr:
			        sprite_index = grass_bg2_spr;
					break;
			}
			
            xskew = round(random_range(2, 4)) * choose(-1, 1);
        }
        
        alarm[0] = 3;
        cut = true;
    }
}

with (enemy_obj)
{
	// TODO: start enemy death animation, particles, ecc
	instance_destroy();
}