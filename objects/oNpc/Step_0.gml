 if place_meeting(x,y,oPlayer) && keyboard_check_pressed(ord("E")) && !Manager.textboxActive {
	if introductionComplete {
		CreateTextbox(DIALOGUE.NPC1_INTRODUCTION_COMPLETE);
	}
	else {
		CreateTextbox(introductiontype);
		introductionStarted = true;
	}
}
if introductionStarted && !Manager.textboxActive {
	Manager.RemoveGate(GATE.INTRODUCTION);
	Manager.eventIntroductionComplete = true;
	introductionComplete = true;
}

if introductionComplete {
	if event == EVENT.EGG_QUEST_STARTED { Manager.eventEggQuestStarted = true; }
}
