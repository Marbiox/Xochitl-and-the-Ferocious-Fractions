/// @param textId
function ScrGameText(_textId, _optionId){
	switch(_textId) {
		
		case DIALOGUE.NPC1:
			switch(_optionId) {
				case "":
					WriteText("Hello I am NPC1.", CHARACTER.NPC);
					WriteText("Hi I am Xochitl! It is nice to meet you NPC1. You look like the fractions I saw in 5th grade. I sure hope this is not an educational videogame.", CHARACTER.PLAYER);
					WriteText("HOW DARE YOU CALL ME A FRACTION! I am soooooo much more than that... I am THE FRACTURED KING", CHARACTER.NPCMAD);
					WriteText("I thought you were NPC1?", CHARACTER.PLAYER);
					WriteText("Don't mind what I just said... You don't seem very smart. So I will give you fractions to do!", CHARACTER.NPC);
					WriteText("What is 10/4 simplified", CHARACTER.NPC);
					SetOption("20", "wrong");
					SetOption("5/2", "correct");
					break;
				case "wrong":
					WriteText("HOW DARE YOU BE WRONG! BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD BAD", CHARACTER.NPCMAD);
					WriteText("Try again you fool", CHARACTER.NPC);
					WriteText("What is 10/4 simplified", CHARACTER.NPC);
					SetOption("20", "wrong");
					SetOption("5/2", "correct");
					break;
				case "correct":
					WriteText("You my friend are a genius", CHARACTER.NPC);
					WriteText("I have opened the gate so that you can collect your 5 eggs! IDK why you want eggs but who am I to stop you after you did such a great job with those fractions!", CHARACTER.NPC);
					break;
			}
			break;
		case DIALOGUE.NPC1_INTRODUCTION_COMPLETE:
			WriteText("Go collect your eggs bro", CHARACTER.NPC);
			break;
		case DIALOGUE.NPC2:
			WriteText("Hello I am NPC2");
			break;
		
	}
}