function RemoveGate(_gate) {
	for (var i = instance_number(oGate) - 1; i >= 0; i--) {
		var _instance = instance_find(oGate, i);
		if _instance.gate == _gate {
			instance_destroy(_instance);
		}
			
	}
}

if keyboard_check_pressed(ord("R")) && keyboard_check(vk_shift) {
	room_restart();	
}