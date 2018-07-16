
var instance = argument0;
var object = instance.object_index;

var var_array = global.save_map[?object];

var map = ds_map_create();
map[?"object_index"] = object;
map[?"layer"] = instance.layer;
for (var i = 0; i < array_length_1d(var_array); i++)
{
	var name   = var_array[i];
	var value  = variable_instance_get(instance, name);
	map[?name] = value;
}

return map;