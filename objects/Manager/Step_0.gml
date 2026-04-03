 function RemoveGate(_gate) {
	for (var i = 0; i < instance_number(oGate); i++) {
		var _instance = instance_find(oGate, i);
		if _instance.gate == _gate {
			instance_destroy(_instance);
		}
			
	}
	
	
}