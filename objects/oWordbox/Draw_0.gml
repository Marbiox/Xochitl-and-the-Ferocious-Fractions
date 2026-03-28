var _text = string(value);
var _textWidth = string_width(_text);
var _textHeight = string_height(_text);
var _textScale = sprite_height * 2 / max(_textWidth, _textHeight);

draw_self();
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_transformed(x, y - sprite_height/2, string(value), _textScale, _textScale, 0);