fractions = ds_list_create();
instance_place_list(x,y,oFraction,fractions,false);

valid = true;
for (var i = 0; i < ds_list_size(fractions); i++) {
	if fractions[| i].value == noone { valid = false }
}
if ds_list_size(fractions) == 0 { valid = false }

matching = false;
if valid { 
	value = fractions[| 0].value;
	matching = true;
}
if valid {
	for (var i = 1; i < ds_list_size(fractions); i++) {
		if fractions[| i].value != value { matching = false }
	}
}

 if matching { Manager.eventFractionPuzzleComplete = true; }
 
 ds_list_destroy(fractions);