acceptKey = keyboard_check_pressed(ord("R"));

textboxX = camera_get_view_x(view_camera[0]);
textboxY = camera_get_view_y(view_camera[0]) + 180;

//setup
if !setup {
	setup = true;
	draw_set_font(fontMain);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through pages
	for (var i = 0; i < pageNumber; i++) {
		textLength[i] = string_length(text[i]);
		textXOffset[i] = 60
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
			//link text for options
			if optionNumber > 0 {
				CreateTextbox(textId, optionLinkId[optionPos]);
			}
			oPlayer.canMove = true;
			instance_destroy();
		}
	}
	else {
		drawChar = textLength[page];
	}
}

//draw the textbox
var _textboxX = textboxX + textXOffset[page]
var _textboxY = textboxY;
textboxImage += textboxImageSpeed;
textboxSpriteWidth = sprite_get_width(textboxSprite);
textboxSpriteHeight = sprite_get_height(textboxSprite);
//back of the textbox
draw_sprite_ext(textboxSprite, textboxImage, _textboxX, _textboxY, textboxWidth/textboxSpriteWidth, textboxHeight/textboxSpriteHeight, 0, c_white, 1);

//draw the text
var drawText = string_copy(text[page], 1, drawChar);
draw_text_ext_transformed(_textboxX + border, _textboxY + border, drawText, lineSeperation, lineWidth,textScale,textScale,0 );

//options
if drawChar == textLength[page] && page == pageNumber - 1 {
	
	//option selection
	optionPos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
	optionPos = clamp(optionPos, 0, optionNumber - 1);
	
	//draw options
	var _optionSpace = 20;
	var _optionBorder = 6;
	for (var optionCount = 0; optionCount < optionNumber; optionCount++) {
		//option box
		var _optionWidth = string_width(option[optionCount]) + _optionBorder * 2;
		draw_sprite_ext(textboxSprite, textboxImage, _textboxX + 23, _textboxY - _optionSpace*optionNumber + _optionSpace*optionCount, _optionWidth/textboxSpriteWidth, (_optionSpace-1)/textboxSpriteHeight, 0, c_white, 1);
		
		//arrow
		if optionPos = optionCount {
			draw_sprite(sTextboxArrow, 0, _textboxX, textboxY - _optionSpace*optionNumber + _optionSpace*optionCount);
		}
		
		//option text
		draw_text_transformed(_textboxX + 23 + _optionBorder,  _textboxY - _optionSpace*optionNumber + _optionSpace*optionCount + 6, option[optionCount], textScale, textScale, 0);
	}
}