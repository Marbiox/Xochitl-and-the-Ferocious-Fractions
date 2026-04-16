var ww = display_get_width() 
var wh = display_get_height() 
if (window_get_width() != ww || window_get_height() != wh) { 
	window_set_rectangle(0,0,ww,wh) surface_resize(application_surface,ww,wh) 
} 