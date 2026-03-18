/// @param textId
function ScrGameText(_textId, _optionId){
	switch(_textId) {
		
		case DIALOGUE.NPC1:
			switch(_optionId) {
				case "":
					WriteText("Hello I am NPC1");
					WriteText("What is 10/4 simplified")
					SetOption("20", "wrong");
					SetOption("5/2", "correct");
					break;
				case "wrong":
					WriteText("Testing Wrong");
					break;
				case "correct":
					WriteText("Testing Correct");
					break;
			}
			break;
		case DIALOGUE.NPC2:
			WriteText("Hello I am NPC2");
		
	}
}