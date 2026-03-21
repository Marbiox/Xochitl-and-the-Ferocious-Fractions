
function DrawTitleText(_text) {
	titleTextTimer = 0;
	text = _text;
}

if titleTextTimer < titleTextFrames {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var _drawX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
	var _drawY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;
	draw_text_transformed_colour(_drawX, _drawY, text, 3, 3, 0, c_black, c_black, c_black, c_black, 1);
	titleTextTimer++;
}


