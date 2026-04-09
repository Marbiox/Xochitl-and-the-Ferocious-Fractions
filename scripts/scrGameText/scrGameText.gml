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
			WriteText("I opened the gate. You can go now.", CHARACTER.NPC);
			break;
		
		case DIALOGUE.NPC2:
			WriteText("Yo.", CHARACTER.NPC);
			WriteText("Hello again!", CHARACTER.PLAYER);
			WriteText("Ahead of you lie the EVIL PUZZLES OF DOOM!", CHARACTER.NPC);
			WriteText("Hold on, where are the eggs?", CHARACTER.PLAYER);
			WriteText("You have to solve the puzzles first!", CHARACTER.NPC);
			WriteText("But what if I don't want to?", CHARACTER.PLAYER);
			WriteText("...", CHARACTER.NPC);
			WriteText("Too bad! See those boxes over there?", CHARACTER.NPC);
			WriteText("Uh... yeah?", CHARACTER.PLAYER);
			WriteText("You can press 'E' to pick them up or drop them, and the gate at the end of the room will NOT open unless you make the two fraction platforms equal to each other.", CHARACTER.NPC);
			WriteText("I made this one super easy so you can understand the way it works, but trust me, they get a LOT harder.", CHARACTER.NPC);
			WriteText("Why did you make these puzzles in the first place?", CHARACTER.PLAYER);
			WriteText("It brings me joy.", CHARACTER.NPC);
			break;	
		
		case DIALOGUE.NPC3:
			WriteText("WIP", CHARACTER.NPC);
			WriteText("Work in progress?", CHARACTER.PLAYER);
			WriteText("My dialogue's not done yet go away", CHARACTER.NPC);
			break;
		
		case DIALOGUE.NPC4:
			switch(_optionId) {
				case "":
					WriteText("Wow you're solving these things... well, I wouldn't exactly say FAST, buuuuut...", CHARACTER.NPC);
					WriteText("Just open the door.", CHARACTER.PLAYER);
					WriteText("I will", CHARACTER.NPC);
					WriteText("...", CHARACTER.PLAYER);
					WriteText(".....", CHARACTER.NPC);
					WriteText(".......", CHARACTER.PLAYER);
					WriteText("After this POP QUIZ!!!", CHARACTER.NPC);
					WriteText("Oh boy...", CHARACTER.PLAYER);
					WriteText("So, If I had 45 eggs, and you wanted 12 of them... What fraction of the total amount would you have to take from me?", CHARACTER.NPC);
					SetOption("45/12", "wrong1");
					SetOption("2/5", "wrong1");
					SetOption("4/15", "correct1");
					SetOption("12", "wrong1");
					break;
				case "wrong1":
					WriteText("No WONDER you took so long on those puzzles!", CHARACTER.NPC);
					WriteText("Try again.", CHARACTER.NPC);
					WriteText("If I had 45 eggs, and you wanted 12 of them... What fraction of the total amount would you have to take from me?", CHARACTER.NPC);
					SetOption("45/12", "wrong1");
					SetOption("2/5", "wrong1");
					SetOption("4/15", "correct1");
					SetOption("12", "wrong1");
					break;
				case "correct1":
					WriteText("DING DING DING! Correct!", CHARACTER.NPC);
					WriteText("Next question!", CHARACTER.NPC);
					WriteText("So. You may have noticed a box simply labeled 'X' in the puzzle ahead.", CHARACTER.NPC);
					WriteText("Oh yeah I DID see that! Is it just a useless box?", CHARACTER.PLAYER);
					WriteText("Ohhhhhhh no. Not at all. That, my good friend, is a VARIABLE!", CHARACTER.NPC);
					WriteText("The way you're saying that scares me.", CHARACTER.PLAYER);
					WriteText("You can think of a variable as a box you can put a number into. The box doesn't have a value of its own, it's value is what you carry around in it.", CHARACTER.NPC);
					WriteText("While 4 always equals 4, 'X' could equal 2, 4, 23/39, or any other number you can think of!", CHARACTER.NPC);
					WriteText("Uhhhhhh...", CHARACTER.PLAYER);
					WriteText("The trick is finding out what number goes in that box to make the whole equation work.", CHARACTER.NPC);
					WriteText("So carrying around the X box would be like carrying around a '2/3' box right now...", CHARACTER.PLAYER);
					WriteText("Wow, you picked this up pretty quick! Anyways, onto the question!", CHARACTER.NPC);
					WriteText("If X equals 2/5, what would X divided by 2 be?", CHARACTER.NPC);
					SetOption("1", "wrong2");
					SetOption("1/5", "correct2");
					SetOption("1 divided by 2 and a half", "wrong2");
					SetOption("2", "wrong2");
					break;
				case "wrong2":
					WriteText("...", CHARACTER.NPC);
					WriteText("Did I get it?", CHARACTER.PLAYER);
					WriteText("No.", CHARACTER.NPC);
					WriteText("If X equals 2/5, what would X divided by 2 be?", CHARACTER.NPC);
					SetOption("1", "wrong2");
					SetOption("1/5", "correct2");
					SetOption("1 divided by 2 and a half", "wrong2");
					SetOption("2", "wrong2");
					break;
				case "correct2":
					WriteText("You know I think I might have underestimated you", CHARACTER.NPC);
					WriteText("...so are you going to open the door?", CHARACTER.PLAYER);
					WriteText("Oh right yeah go ahead.", CHARACTER.NPC);
					break;
							
				}
				break;
		}
}