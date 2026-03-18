depth = -999;
textId = "";

//textbox parameters
textScale = 0.25;
textboxWidth = 300;
textboxHeight = 70;
border = 8;
lineSeperation = 12 / textScale;
lineWidth = (textboxWidth - border * 2) / textScale;
textboxSprite = sTextbox;
textboxImage = 0;
textboxImageSpeed = 6/60;

//text
page = 0;
pageNumber = 0;
text[0] = 0;
textLength[0] = string_length(text[0]);
drawChar = 0;
textSpeed = 1;

//options
option[0] = "";
optionLinkId[0] = -1;
optionPos = 0;
optionNumber = 0;
 
setup = false;

oPlayer.canMove = false;