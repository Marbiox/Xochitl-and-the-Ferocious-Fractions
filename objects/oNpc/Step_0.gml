 if place_meeting(x,y,oPlayer) && keyboard_check_pressed(ord("E")) && !Manager.textboxActive {
	if introductionComplete {
		CreateTextbox(DIALOGUE.NPC1_INTRODUCTION_COMPLETE);
	}
	else {
		CreateTextbox(DIALOGUE.NPC1);
		introductionStarted = true;
	}
}
if introductionStarted && !Manager.textboxActive {
	Manager.RemoveGate(GATE.INTRODUCTION);
	Manager.eventIntroductionComplete = true;
	introductionComplete = true;
}
