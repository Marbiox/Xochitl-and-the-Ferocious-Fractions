event_inherited();

if Manager.eventIntroductionComplete && eventCheck = EVENT.INTRODUCTION_COMPLETE {
	instance_destroy();
}
if Manager.eventFractionPuzzleComplete && eventCheck = EVENT.FRACTION_PUZZLE_COMPLETE {
	Manager.DrawTitleText("Puzzle Complete");
	instance_destroy();
}