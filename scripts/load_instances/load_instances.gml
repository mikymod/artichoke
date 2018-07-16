var json = argument0;

with (all)
{
	if (ds_map_exists(global.save_map, object_index))
	{
        instance_destroy();
	}
}

var m = json_decode(json);
var list = m[?"instances"];
for (var i = 0; i < ds_list_size(list); i++)
{
    var map = list[|i];
    save_map_get_instances(map);
}

ds_map_destroy(m);