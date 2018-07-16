var view_mat = matrix_build_lookat(
	delta_offset_x + size_w/2,
	delta_offset_y + size_h/2,
	-10,
	delta_offset_x + size_w/2,
	delta_offset_y + size_h/2,
	0,
	0,
	1,
	0
);

var proj_mat = matrix_build_projection_ortho(size_w, size_h, 1.0, 32000.0);
camera_set_view_mat(view_camera[0], view_mat);
camera_set_proj_mat(view_camera[0], proj_mat);