 if place_meeting(x,y,oPlayer) && keyboard_check_pressed(ord("E")) && !Manager.textboxActive {
		CreateTextbox(introductiontype);
		introductionStarted = true;
	}
if introductionStarted && !Manager.textboxActive {
	Manager.RemoveGate(GATE.INTRODUCTION);
	introductionComplete = true;
}

if introductionComplete {
	if event == EVENT.EGG_QUEST_STARTED { Manager.eventEggQuestStarted = true; }
}
