gml_pragma("global", "save_meta()");

global.save_map = ds_map_create();

global.save_map[?player_obj] = ["x", "y"];