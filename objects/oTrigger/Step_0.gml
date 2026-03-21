if place_meeting(x, y, oPlayer) {
	
	if triggerEvent = TRIGGER.ENTER_ROOM2 {
		room_goto(Room2);
	}
	
	if triggerEvent = TRIGGER.ENTER_FRACTION_FARM {
		Manager.DrawTitleText("Fraction Farm");
		instance_destroy();
	}
	
}