switch (state)
{
	case YieldableTerrainState.None:
	{
		if (place_meeting(x, y - 1, actor_obj))
		{
			state = YieldableTerrainState.Active;
		}
		
		break;
	}
	case YieldableTerrainState.Active:
	{
		active_timer--;
		if (active_timer <= 0)
		{
			state = YieldableTerrainState.Yield;
			active_timer = max_active_timer;
		}
		
		break;
	}
	case YieldableTerrainState.Yield:
	{
		respawn_timer--;
		if (respawn_timer <= 0)
		{
			state = YieldableTerrainState.Respawn;
			respawn_timer = max_respawn_timer;
		}
		
		break;
	}
	case YieldableTerrainState.Respawn:
	{
		state = YieldableTerrainState.None;
		
		break;	
	}
}