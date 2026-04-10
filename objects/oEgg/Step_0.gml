if place_meeting(x, y, oPlayer) {
	Manager.eggCount += 1;
	Manager.DrawTitleText("EGG COLLECTED");
	instance_destroy();
}