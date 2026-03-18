depth = -999;
textId = "";

//textbox parameters
textScale = 1;
textboxWidth = 328;
textboxHeight = 80;
border = 12;
lineSeperation = 12;
lineWidth = (textboxWidth - border * 2);
textboxSprite[0] = sTextbox;
textboxImage = 0;
textboxImageSpeed = 6/60;

//offset
defaultTextboxXOffsetPortraitLeft = 120;
defaultPortraitXOffsetLeft = 32;
defaultTextboxXOffsetPortraitRight = 32;
defaultPortraitXOffsetRight = 368;
defaultTextboxXOffsetPortraitNone = 76;

//text
page = 0;
pageNumber = 0;
text[0] = 0;
textLength[0] = string_length(text[0]);
drawChar = 0;
textSpeed = 0.5;
char[0,0] = "";
charX[0,0] = 0;
charY[0,0] = 0;

//options
option[0] = "";
optionLinkId[0] = -1;
optionPos = 0;
optionNumber = 0;
 
setup = false;

//effects
SetDefaultsForText();
lastFreeSpace = 0;
textPauseTimer = 0;
textPauseTime = 16;