/// @param textId
function ScrGameText(_textId, _optionId){
	switch(_textId) {
		
		case DIALOGUE.NPC1:
			switch(_optionId) {
				case "":
					WriteText("(Sigh)... what am I going to do?", CHARACTER.NPC);
					WriteText("???", CHARACTER.PLAYER);
					WriteText("My friend’s birthday is tomorrow and I still don’t know how much cake to make! There are 12 people coming but the recipe feeds 24!", CHARACTER.NPC);
					WriteText("I've got an idea.", CHARACTER.PLAYER);
					WriteText("What do I do??? Please tell me!", CHARACTER.NPC);
					WriteText("Couldn't you use fractions to change the amount of cake?", CHARACTER.PLAYER);
					WriteText("Oooooooooooo... I hadn't thought of that!", CHARACTER.NPC);
					WriteText("Wait, what fraction would I need to make a cake for 12 people when the recipe feeds 24?", CHARACTER.NPC);
					SetOption("2/3", "wrong1");
					SetOption("1/3", "wrong1");
					SetOption("1/2", "correct1");
					SetOption("2", "wrong1");
					break;
				case "wrong1":
					WriteText("You’re so close! Think of it as 12/24. Are there any factors that 12 and 24 have in common? (Hint: 2, 4, 6, 12)", CHARACTER.NPCMAD);
					WriteText("I have rewound time so that you may try again.", CHARACTER.NPCMAD);
					WriteText("What fraction would I need to make a cake for 12 people when the recipe feeds 24?", CHARACTER.NPC);
					SetOption("2/3", "wrong1");
					SetOption("1/3", "wrong1");
					SetOption("1/2", "correct1");
					SetOption("2", "wrong1");
					break;
				case "correct1":
					WriteText("WOAH! thats so cool!!", CHARACTER.NPC);
					WriteText("So... how would I change the recipe?", CHARACTER.NPC);
					WriteText("Well... if you want one half of the recipe, you would need half of all the ingredients, right?",CHARACTER.PLAYER);
					WriteText("Oh yeah! That makes sense! Hmm... a bag of flour turns into a half... 4 cups of milk become two... eggs... eggs... what about the eggs?",CHARACTER.NPC)
					WriteText("Uuughhh... the recipe calls for 12 eggs but I only have 1, how many more eggs would I need?", CHARACTER.NPC);
					SetOption("11", "wrong2");
					SetOption("5", "correct2");
					SetOption("6", "wrong2");
					SetOption("12","wrong2");
					break;
				case "wrong2":
					WriteText("If you’re halving the recipe that would be 12/2. If Butterscotch has ONE egg, how many MORE do they need to get to 12/2?", CHARACTER.NPCMAD);
					WriteText("I have rewound time so that you may try again.", CHARACTER.NPCMAD);
					WriteText("Uuughhh... the recipe calls for 12 eggs but I only have 1, how many more eggs would I need?", CHARACTER.NPC);
					SetOption("11", "wrong2");
					SetOption("5", "correct2");
					SetOption("6", "wrong2");
					SetOption("12","wrong2");
					break;
				case "correct2":
					WriteText("Now... where am I going to get 5 eggs...?", CHARACTER.NPC);
					WriteText("Where do you usually go to get them?", CHARACTER.PLAYER);
					WriteText("Oh! They're scattered all over the place! ", CHARACTER.NPC);
					WriteText("Scattered all over the place?", CHARACTER.PLAYER);
					WriteText("Yeah! If you see any, could you PRETTY PLEASE give them to me when you see me again? If you get me enough i might be able to make a full cake instead and give you half for helping me out so much!", CHARACTER.NPC);
					WriteText("Neat!", CHARACTER.PLAYER);
					break;
							
				}
				break;
		
		case DIALOGUE.NPC1_INTRODUCTION_COMPLETE:
			WriteText("Go forth, young salamander! Fetch me my eggs!", CHARACTER.NPC);
			WriteText("I'm an axolotl.", CHARACTER.PLAYER);
			WriteText("Potato, tomato. Same thing.", CHARACTER.NPC);
			WriteText("...bye.", CHARACTER.PLAYER);
			break;
		
		case DIALOGUE.NPC2:
			WriteText("Greetings.", CHARACTER.NPCMAD);
			WriteText("Hello again!", CHARACTER.PLAYER);
			WriteText("You have entered a place where math and real life merge into one!", CHARACTER.NPCMAD);
			WriteText("?!?!?!", CHARACTER.PLAYER);
			WriteText("These puzzles ahead of you are made of PURE MATHEMATICAL ENERGY! They have replaced every key to every locked door in this ruin! If you wish to proceed, you must solve them!", CHARACTER.NPCMAD);
			WriteText("But what if I don't want to?", CHARACTER.PLAYER);
			WriteText("...", CHARACTER.NPCMAD);
			WriteText("Too bad! See those boxes over there?", CHARACTER.NPCMAD);
			WriteText("Uh... yeah?", CHARACTER.PLAYER);
			WriteText("You can press 'E' to pick them up or drop them, and the gate at the end of the room will NOT open unless you make the two fraction platforms equal to each other.", CHARACTER.NPCMAD);
			WriteText("I made this one super easy so you can understand the way it works, but trust me, they get a LOT harder.", CHARACTER.NPCMAD);
			WriteText("Wait, YOU MADE THEM?! Why did you make these puzzles in the first place?!", CHARACTER.PLAYER);
			WriteText("I'm the fraction king, it brings me joy.", CHARACTER.NPCMAD);
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
			case DIALOGUE.MISSINGEGGS:
				WriteText("YOU SUCK BRO", CHARACTER.NPC);
				WriteText("I'M SORRY I AM A FAILURE", CHARACTER.PLAYER);
				WriteText("YOUR DEAD TO ME.................", CHARACTER.NPC);
				break;
			case DIALOGUE.ENOUGHEGGS:
				WriteText("You are doing the bare minimum bro", CHARACTER.NPC);
				WriteText(".............", CHARACTER.PLAYER);
				WriteText("Go away", CHARACTER.NPC);
				break;
			case DIALOGUE.ALLTHEEGSS:
				WriteText("You my friend are a glories speciman", CHARACTER.NPC);
				WriteText("I am", CHARACTER.PLAYER);
				WriteText("Yes amazing fish person", CHARACTER.NPC);
				break;
		}
}