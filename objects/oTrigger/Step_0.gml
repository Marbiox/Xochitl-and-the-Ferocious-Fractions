if place_meeting(x, y, oPlayer) {
	
	if triggerEvent = TRIGGER.ENTER_ROOM2 {
		room_goto(Room2);
	}
	if triggerEvent = TRIGGER.ENTER_ROOM3 {
		room_goto(Room3)
	}
	if triggerEvent = TRIGGER.ENTER_ROOM4 {
		room_goto(Room4)
	}
	if triggerEvent = TRIGGER.ENTER_ROOM5 {
		room_goto(Room5)
	}
	
	if triggerEvent = TRIGGER.ENTER_FRACTION_FARM {
		Manager.DrawTitleText("Fraction Farm");
		instance_destroy();
	}
	
}