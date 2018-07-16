
return place_meeting(x, y + 1, solid_obj) || (place_meeting(x, y + 1, jumpthru_obj) && !place_meeting(x, y, jumpthru_obj));