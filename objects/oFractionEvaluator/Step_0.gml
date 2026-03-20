var _fractions = ds_list_create();
var _listSize = instance_place_list(x,y,oFraction,_fractions,false);

valid = true;
for (var i = 0; i < _listSize; i++) {
	if _fractions[| i].value == noone { valid = false }
}
if _listSize == 0 { valid = false }

matching = false;
if valid { 
	value = _fractions[| 0].value;
	matching = true;
}
if valid {
	for (var i = 1; i < _listSize; i++) {
		if _fractions[| i].value != value { matching = false }
	}
}

 if matching { Manager.eventFractionPuzzleComplete = true; }
 
 ds_list_destroy(_fractions);