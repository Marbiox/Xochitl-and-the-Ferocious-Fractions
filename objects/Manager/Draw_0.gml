function DrawTitleText(_text) {
	titleTextTimer = 0;
	tittleText = _text;
}

if titleTextTimer < titleTextFrames {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var _drawX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
	var _drawY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;
	draw_text_transformed_colour(_drawX, _drawY, tittleText, 3, 3, 0, c_white, c_white, c_white, c_white, 1);
	titleTextTimer++;
}

//-----------------Draw Egg UI-----------------
if eventEggQuestStarted {
	draw_set_halign(fa_top);
	draw_set_valign(fa_left);
	var _drawX = camera_get_view_x(view_camera[0])+10;
	var _drawY = camera_get_view_y(view_camera[0])+10;
	draw_sprite(sEgg,-1, _drawX,_drawY);
	_drawX += sprite_get_width(sEgg) + 10;
	eggUI = string(eggCount) + " / " + string(eggMax);
	draw_text_transformed_colour(_drawX, _drawY, eggUI, 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1);
}
              