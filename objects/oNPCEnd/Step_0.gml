if place_meeting(x,y,oPlayer) && keyboard_check_pressed(ord("E")) && !Manager.textboxActive {
	if introductionComplete {
		CreateTextbox(DIALOGUE.NPC1_INTRODUCTION_COMPLETE);
	}
	else if Manager.eggCount = Manager.totalEggs {
		CreateTextbox(DIALOGUE.ALLTHEEGSS);
		introductionStarted = true;
	}
	else if Manager.eggCount >= Manager.eggMax {
		CreateTextbox(DIALOGUE.ENOUGHEGGS);
		introductionStarted = true;
	}
	else if Manager.eggCount < Manager.eggMax {
		CreateTextbox(DIALOGUE.MISSINGEGGS);
		introductionStarted = true;
	}
}
if introductionStarted && !Manager.textboxActive {
	introductionComplete = true;
}

if introductionComplete {
	if event == EVENT.EGG_QUEST_STARTED { Manager.eventEggQuestStarted = true; }
}
