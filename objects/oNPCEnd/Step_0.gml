if place_meeting(x,y,oPlayer) && keyboard_check_pressed(ord("E")) && !Manager.textboxActive {
	if Manager.eggCount = Manager.totalEggs {
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
	else if introductionComplete {
	
	}
}
if introductionStarted && !Manager.textboxActive && !introductionComplete {
	introductionComplete = true;
	Manager.DrawTitleText("GAME COMPLETED");
	Manager.RemoveGate(GATE.INTRODUCTION);
}

if introductionComplete {
	if event == EVENT.EGG_QUEST_STARTED { Manager.eventEggQuestStarted = true; }
}
