acceptKey = keyboard_check_pressed(vk_space);

textboxX = camera_get_view_x(view_camera[0]);
textboxY = camera_get_view_y(view_camera[0]) + 160;

//setup
if !setup {
	setup = true;
	draw_set_font(fontMain);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through pages
	pageNumber = array_length(text);
	for (var i = 0; i < pageNumber; i++) {
		textLength[i] = string_length(text[i]);
		textXOffset[i] = 120
	}
}
	
//typing text
if drawChar	< textLength[page] {
	drawChar += textSpeed;
	drawChar = clamp(drawChar, 0, textLength[page]);
}

//flip through pages
if acceptKey {
	if drawChar == textLength[page]{
		if page < pageNumber - 1 {
			page++;
			drawChar = 0;
		}
		else {
			instance_destroy();
		}
	}
	else {
		drawChar = textLength[page];
	}
}
	
//draw the textbox
textboxImage += textboxImageSpeed;
textboxSpriteWidth = sprite_get_width(textboxSprite);
textboxSpriteHeight = sprite_get_height(textboxSprite);
//back of the textbox
draw_sprite_ext(textboxSprite, textboxImage, textboxX + textXOffset[page], textboxY, textboxWidth / textboxSpriteWidth, textboxHeight / textboxSpriteHeight, 0, c_white, 1);

//draw the text
var drawText = string_copy(text[page], 1, drawChar);
draw_text_ext_transformed(textboxX + textXOffset[page] + border, textboxY + border, drawText, lineSeperation, lineWidth,textScale,textScale,0 );