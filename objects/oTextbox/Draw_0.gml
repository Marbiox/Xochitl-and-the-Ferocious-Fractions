acceptKey = keyboard_check_pressed(vk_space);

textboxX = camera_get_view_x(view_camera[0]);
textboxY = camera_get_view_y(view_camera[0]) + 160;

draw_set_font(fontMain);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

//setup
if !setup {
	setup = true;
	
	//loop through pages
	for (var p = 0; p < pageNumber; p++) {
		
		textLength[p] = string_length(text[p]);
		
		//get the x position for the textbox
		//chracter on the left
		textboxXOffset[p] = defaultTextboxXOffsetPortraitLeft
		portraitXOffset[p] = defaultPortraitXOffsetLeft;
		//character on the right
		if speakerSide[p] == -1 {
			textboxXOffset[p] = defaultTextboxXOffsetPortraitRight;
			portraitXOffset[p] = defaultPortraitXOffsetRight;
		}
		//no character
		if speakerSprite[p] == noone {
			textboxXOffset[p] = defaultTextboxXOffsetPortraitNone;
		}
		//setting individual characters and finding where the lines of text should break
		for (var c = 0; c < textLength[p]; c++) {
			
				var _charPos = c + 1;
				
				//store all characters in char array
				char[c,p] = string_char_at(text[p], _charPos);
				
				//get current width of line
				var _textUpToChar = string_copy(text[p], 1, _charPos);
				var _currentTextWidth = (string_width(_textUpToChar) - string_width(char[c,p])) * textScale;
				
				//get the last free space
				if char[c,p] == " " { lastFreeSpace = _charPos + 1 }
				
				//get the line breaks
				if _currentTextWidth - lineBreakOffset[p] + border > lineWidth {
					lineBreakPos[lineBreakNum[p], p] = lastFreeSpace;
					lineBreakNum[p]++;
					var _textUpToLastSpace = string_copy(text[p], 1, lastFreeSpace);
					var _lastFreeSpaceString = string_char_at(text[p], lastFreeSpace);
					lineBreakOffset[p] = (string_width(_textUpToLastSpace) - string_width(_lastFreeSpaceString)) * textScale;
				}
		}
		
		//getting each characters cooridnates
		for (var c = 0; c < textLength[p]; c++) {
			
			var _charPos = c + 1;
			var _textX = textboxX + textboxXOffset[p] + border;
			var _textY = textboxY + border;
			//get current width of line
			var _textUpToChar = string_copy(text[p], 1, _charPos);
			var _currentTextWidth = (string_width(_textUpToChar) - string_width(char[c,p])) * textScale;
			var _textLine = 0;
			
			//compensate for string breaks
			for (var lineBreak = 0; lineBreak < lineBreakNum[p]; lineBreak++) {
				//if the current looping character is after a line break
				if _charPos >= lineBreakPos[lineBreak, p] {
					var _stringCopy = string_copy(text[p], lineBreakPos[lineBreak, p], _charPos-lineBreakPos[lineBreak,p]);
					_currentTextWidth = string_width(_stringCopy) * textScale;
					
					//record the line this character should be on
					_textLine = lineBreak + 1;
				}
			}
			//add to the x and y coordinates based on the new info
			charX[c,p] = _textX + _currentTextWidth;
			charY[c,p] = _textY + _textLine*lineSeperation;
		}
	}
}

//typing text
if textPauseTimer <= 0 {
	if drawChar	< textLength[page] {
		drawChar += textSpeed;
		drawChar = clamp(drawChar, 0, textLength[page]);
		var _checkChar = string_char_at(text[page], drawChar);
		if _checkChar == "." ||  _checkChar == "!" ||_checkChar == "?" ||_checkChar == "," {
			textPauseTimer = textPauseTime;
		}
	}
}
else {
	textPauseTimer--;
}

//flip through pages
if acceptKey {
	if drawChar == textLength[page] {
		if page < pageNumber - 1 {
			page++;
			drawChar = 0;
		}
		else {
			//link text for options
			if optionNumber > 0 {
				CreateTextbox(textId, optionLinkId[optionPos]);
			}
			else Manager.textboxActive = false;
			instance_destroy();
		}
	}
	else {
		drawChar = textLength[page];
	}
}

//----------------------------draw the textbox----------------------------
var _textboxX = textboxX + textboxXOffset[page]
var _textboxY = textboxY;
textboxImage += textboxImageSpeed;
textboxSpriteWidth = sprite_get_width(textboxSprite[page]);
textboxSpriteHeight = sprite_get_height(textboxSprite[page]);

//draw the speaker
if speakerSprite[page] != noone {
	sprite_index = speakerSprite[page];
	if drawChar == textLength[page] { image_index = 0 }
	var _speakerX = textboxX + portraitXOffset[page] + 8;
	var _speakerY = textboxY + 8
	if speakerSide[page] == -1 { _speakerX += sprite_width }
	draw_sprite_ext(textboxSprite[page], textboxImage, textboxX + portraitXOffset[page], textboxY, (sprite_width+16)/textboxSpriteWidth, (sprite_height+16)/textboxSpriteHeight, 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speakerX, _speakerY, speakerSide[page], 1, 0, c_white, 1);
}

//back of the textbox
draw_sprite_ext(textboxSprite[page], textboxImage, _textboxX, _textboxY, textboxWidth/textboxSpriteWidth, textboxHeight/textboxSpriteHeight, 0, c_white, 1);

//draw the text
for (var c = 0; c < drawChar; c++) {
	//the text
	draw_text_transformed(charX[c, page], charY[c, page], char[c,page], textScale, textScale, 0);
}


//var drawText = string_copy(text[page], 1, drawChar);
//draw_text_ext_transformed(_textboxX + border, _textboxY + border, drawText, lineSeperation, lineWidth,textScale,textScale,0 );


//----------------------------options----------------------------
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
		draw_sprite_ext(textboxSprite[page], textboxImage, _textboxX + 23, _textboxY - _optionSpace*optionNumber + _optionSpace*optionCount, _optionWidth/textboxSpriteWidth, (_optionSpace-1)/textboxSpriteHeight, 0, c_white, 1);
		
		//arrow
		if optionPos = optionCount {
			draw_sprite(sTextboxArrow, 0, _textboxX, textboxY - _optionSpace*optionNumber + _optionSpace*optionCount);
		}
		
		//option text
		draw_text_transformed(_textboxX + 23 + _optionBorder,  _textboxY - _optionSpace*optionNumber + _optionSpace*optionCount + 6, option[optionCount], textScale, textScale, 0);
	}
}