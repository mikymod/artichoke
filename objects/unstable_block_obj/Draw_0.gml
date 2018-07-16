switch (state)
{
	case UnstableBlockState.Active:
	{
		draw_sprite_ext(sprite_index, image_index, x + irandom_range(-1, 1), y + irandom_range(-1, 1), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		break;
	}
	case UnstableBlockState.Falling:
	case UnstableBlockState.Grounded:
	case UnstableBlockState.None:
		draw_self();
}