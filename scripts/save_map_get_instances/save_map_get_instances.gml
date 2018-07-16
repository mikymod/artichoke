var map = argument0;

var object = map[?"object_index"];
var llayer  = map[?"layer"];
var var_array = global.save_map[?object];

var instance = instance_create_layer(0, 0, llayer, object);
for (var i = 0; i < array_length_1d(var_array); i++)
{
    var name = var_array[i];
    var value = map[?name];

    variable_instance_set(instance, name, value);
}

return instance;