sprite_index = -1;

enum YieldableTerrainState
{
	None,
	Active,
	Yield,
	Respawn
}

state = YieldableTerrainState.None;

max_active_timer = 60;
active_timer = max_active_timer;
max_respawn_timer = 60;
respawn_timer = max_respawn_timer;

// TODO: add erosion particle system