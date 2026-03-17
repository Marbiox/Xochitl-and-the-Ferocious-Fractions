depth = -999;

//textbox parameters
textScale = 0.25;
textboxWidth = 240;
textboxHeight = 80;
border = 8;
lineSeperation = 12 / textScale;
lineWidth = (textboxWidth - border * 2) / textScale;
textboxSprite = sTextbox;
textboxImage = 0;
textboxImageSpeed = 6/60;

//text
page = 0;
pageNumber = 0;
text[0] = "Do some fractions bro";
text[1] = "What is 10/4 simplified, I really like doing fractions, text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text";
text[2] = "It is 5/2!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!";
textLength[0] = string_length(text[0]);
drawChar = 0;
textSpeed = 1;
 
setup = false;