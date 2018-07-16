switch (state)
{
	case YieldableTerrainState.None:
	{
		image_index = 0;
		mask_index = yieldable_terrain_spr;

		break;
	}
	case YieldableTerrainState.Active:
	{
		image_index = 0;
		mask_index = yieldable_terrain_spr;
		
		break;
	}
	case YieldableTerrainState.Yield:
	{
		image_index = 1;
		mask_index = noone;

		break;
	}
	case YieldableTerrainState.Respawn:
	{
		image_index = 0;
		mask_index = yieldable_terrain_spr;
		
		break;	
	}
}

draw_sprite(yieldable_terrain_spr, image_index, x, y)