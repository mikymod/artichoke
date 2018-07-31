show_debug_message("Event = " + async_load[? "event_type"]);
show_debug_message("Pad = " + string(async_load[? "pad_index"]));

switch(async_load[? "event_type"])
{
	case "gamepad discovered":
	{
	    var pad = async_load[? "pad_index"];
		
		pad_id = pad;

	    break;
	}
	case "gamepad lost":
	{
	    var pad = async_load[? "pad_index"];
		
		pad_id = -1;
		
	    break;
	}
}