/// draw_sprite_skew_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, image_xskew, image_yskew);

var sprite   = argument0; 
var index    = argument1;
var xx       = argument2;
var yy       = argument3; 
var xscale   = argument4; 
var yscale   = argument5;
var cos_angle = cos(degtorad(argument6)); 
var sin_angle = sin(degtorad(argument6)); 
var tint     = argument7;
var alpha    = argument8;
var hskew    = argument9;
var vskew    = argument10;

// Calculate common operations
var spr_tex    = sprite_get_texture(sprite, index); 
var spr_width  = sprite_get_width(sprite);
var spr_height = sprite_get_height(sprite); 
var spr_x_origin  = sprite_get_xoffset(sprite); 
var spr_y_origin  = sprite_get_yoffset(sprite);

var tmp_x, tmp_y;

// Begin drawing primitive
draw_primitive_begin_texture(pr_trianglestrip, spr_tex);

// Top-left corner
tmp_x = (-spr_x_origin + (spr_y_origin / spr_height) * hskew) * xscale;
tmp_y = (-spr_y_origin + (spr_x_origin / spr_width) * -vskew) * yscale;
draw_vertex_texture_color(xx + tmp_x * cos_angle - tmp_y * sin_angle, yy + tmp_x * sin_angle + tmp_y * cos_angle, 0, 0, tint, alpha);

// Top-right corner
tmp_x = (spr_width + (spr_y_origin / spr_height) * hskew - spr_x_origin) * xscale;
tmp_y = (-spr_y_origin + (1 - spr_x_origin / spr_width) * vskew) * yscale;
draw_vertex_texture_color(xx + tmp_x * cos_angle - tmp_y * sin_angle, yy + tmp_x * sin_angle + tmp_y * cos_angle, 1, 0, tint, alpha);

// Bottom-left corner
tmp_x = (-spr_x_origin + (1 - spr_y_origin / spr_height) * -hskew) * xscale;
tmp_y = (spr_height - spr_y_origin + (spr_x_origin / spr_width) * -vskew) * yscale;
draw_vertex_texture_color(xx + tmp_x * cos_angle - tmp_y * sin_angle, yy + tmp_x * sin_angle + tmp_y * cos_angle, 0, 1, tint, alpha);

// Bottom-right corner
tmp_x = (spr_width - spr_x_origin + (1 - spr_y_origin / spr_height) * -hskew) * xscale;
tmp_y = (spr_height - spr_y_origin + (1 - spr_x_origin / spr_width) * vskew) * yscale;
draw_vertex_texture_color(xx + tmp_x * cos_angle - tmp_y * sin_angle, yy + tmp_x * sin_angle + tmp_y * cos_angle, 1, 1, tint, alpha);

// Finish drawing primitive
draw_primitive_end();