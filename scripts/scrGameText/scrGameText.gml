/// @param textId
function ScrGameText(_textId, _optionId){
	switch(_textId) {
		
		case DIALOGUE.NPC1:
			switch(_optionId) {
				case "":
					WriteText("(Sigh)... what am I going to do?", CHARACTER.NPCBSCOTCH);
					WriteText("???", CHARACTER.PLAYER);
					WriteText("My friend's birthday is tomorrow and I still don't know how much cake to make! There are 12 people coming but the recipe feeds 24!", CHARACTER.NPCBSCOTCH);
					WriteText("I've got an idea.", CHARACTER.PLAYER);
					WriteText("What do I do??? Please tell me!", CHARACTER.NPCBSCOTCH);
					WriteText("Couldn't you use fractions to change the amount of cake?", CHARACTER.PLAYER);
					WriteText("Oooooooooooo... I hadn't thought of that!", CHARACTER.NPCBSCOTCH);
					WriteText("Wait, what fraction would I need to make a cake for 12 people when the recipe feeds 24?", CHARACTER.NPCBSCOTCH);
					SetOption("2/3", "wrong1");
					SetOption("1/3", "wrong1");
					SetOption("1/2", "correct1");
					SetOption("2", "wrong1");
					break;
				case "wrong1":
					WriteText("You're so close! Think of it as 12/24. Are there any factors that 12 and 24 have in common? (Hint: 2, 4, 6, 12)", CHARACTER.NPCMAD);
					WriteText("I have rewound time so that you may try again.", CHARACTER.NPCMAD);
					WriteText("What fraction would I need to make a cake for 12 people when the recipe feeds 24?", CHARACTER.NPCBSCOTCH);
					SetOption("2/3", "wrong1");
					SetOption("1/3", "wrong1");
					SetOption("1/2", "correct1");
					SetOption("2", "wrong1");
					break;
				case "correct1":
					WriteText("WOAH! thats so cool!!", CHARACTER.NPCBSCOTCH);
					WriteText("So... how would I change the recipe?", CHARACTER.NPCBSCOTCH);
					WriteText("Well... if you want one half of the recipe, you would need half of all the ingredients, right?",CHARACTER.PLAYER);
					WriteText("Oh yeah! That makes sense! Hmm... a bag of flour turns into a half... 4 cups of milk become two... eggs... eggs... what about the eggs?",CHARACTER.NPCBSCOTCH)
					WriteText("Uuughhh... the recipe calls for 12 eggs but I only have 1, how many more eggs would I need?", CHARACTER.NPCBSCOTCH);
					SetOption("11", "wrong2");
					SetOption("5", "correct2");
					SetOption("6", "wrong2");
					SetOption("12","wrong2");
					break;
				case "wrong2":
					WriteText("If you're halving the recipe that would be 12/2. If Butterscotch has ONE egg, how many MORE do they need to get to 12/2?", CHARACTER.NPCMAD);
					WriteText("I have rewound time so that you may try again.", CHARACTER.NPCMAD);
					WriteText("Uuughhh... the recipe calls for 12 eggs but I only have 1, how many more eggs would I need?", CHARACTER.NPCBSCOTCH);
					SetOption("11", "wrong2");
					SetOption("5", "correct2");
					SetOption("6", "wrong2");
					SetOption("12","wrong2");
					break;
				case "correct2":
					WriteText("Now... where am I going to get 5 eggs...?", CHARACTER.NPCBSCOTCH);
					WriteText("Where do you usually go to get them?", CHARACTER.PLAYER);
					WriteText("Oh! They're scattered all over the place! ", CHARACTER.NPCBSCOTCH);
					WriteText("Scattered all over the place?", CHARACTER.PLAYER);
					WriteText("Yeah! If you see any, could you PRETTY PLEASE give them to me when you see me again? If you get me enough I might be able to make a full cake instead and give you half!", CHARACTER.NPCBSCOTCH);
					WriteText("Neat!", CHARACTER.PLAYER);
					break;
							
				}
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
			switch(_optionId) {
				case "":
					WriteText("Howdy there, young fellow!", CHARACTER.NPCFARM);
					WriteText("Hello! Is this your farm?", CHARACTER.PLAYER);
					WriteText("Indeed! Or... at least it WAS until those weird boxes showed up. Not good for the soil, those boxes.", CHARACTER.NPCFARM);
					WriteText("Shouldn't you be harvesting the corn you have, then? You know, before it spoils?", CHARACTER.PLAYER);
					WriteText("I'm taking a quick break from that. I've been harvesting all day but it barely feels like I've made any progress!", CHARACTER.NPCFARM);
					WriteText("Well, how much do you have left to do?", CHARACTER.PLAYER);
					WriteText("I have twenty plots of corn and I've only harvested five of them so far... Could YOU figure our what amount I've already picked? I'm too tired to do math right now.", CHARACTER.NPCFARM);
					SetOption("1/4", "correct1");
					SetOption("1/5", "wrong1");
					SetOption("1/3", "wrong");
					break;
				case "wrong1":
					WriteText("Think of it as 5/20. What does this simplify to? What are the factors of twenty? (Hint: 2, 4, 5, 10)", CHARACTER.NPCMAD);
					WriteText("I have rewound time so that you may try again.", CHARACTER.NPCMAD);
					WriteText("I have twenty plots of corn and I've only harvested five of them so far... Could YOU figure our what amount I've already picked? I'm too tired to do math right now.", CHARACTER.NPCFARM);
					SetOption("1/4", "correct1");
					SetOption("1/5", "wrong1");
					SetOption("1/3", "wrong");
					break;
				case "correct1":
					WriteText("Ah... that's... a lot of work left.", CHARACTER.NPCFARM);
					WriteText("How long have you been out here?", CHARACTER.PLAYER);
					WriteText("An hour.",CHARACTER.NPCFARM);
					WriteText("Hey! Since you seem to be so good at math, mind telling me how much MORE time I have to spend out here?",CHARACTER.NPCFARM);
					WriteText("Um...",CHARACTER.PLAYER);
					SetOption("2 hours", "wrong2");
					SetOption("3 hours", "correct2");
					SetOption("4 hours", "wrong2");
					break;
				case "wrong2":
					WriteText("She took an hour to pick 1/4 of the corn. If you think of the total corn as 1, how many more 1/4ths would you need to make 1?.", CHARACTER.NPCMAD);
					WriteText("I have rewound time so that you may try again.", CHARACTER.NPCMAD);
					WriteText("Since you seem to be so good at math, mind telling me how much MORE time I have to spend out here?",CHARACTER.NPCFARM);
					WriteText("Um...",CHARACTER.PLAYER);
					SetOption("2 hours", "wrong2");
					SetOption("3 hours", "correct2");
					SetOption("4 hours", "wrong2");
					break;
				case "correct2":
					WriteText("Oh... three more hours...", CHARACTER.NPCFARM);
					WriteText("You know, for a farmer you don't seem like you enjoy your job that much.", CHARACTER.PLAYER);
					WriteText("I like farming the tomatoes a lot more than the corn.", CHARACTER.NPCFARM);
					WriteText("...", CHARACTER.PLAYER);
					WriteText("Speaking of, if I had 45 tomatoes and you took 12 of them, what fraction of the total number of tomatoes would you be taking from me?", CHARACTER.NPCFARM);
					SetOption("4/15", "correct3");
					SetOption("45/12", "wrong3");
					SetOption("3/5", "wrong3");
					SetOption("12", "wrong3");
					break;
					
				case "wrong3":
					WriteText("Perhaps the numbers could be simplified. For example, 6/30 can be simplified to 1/5, since both numbers can be divided by 6.", CHARACTER.NPCMAD);
					WriteText("I have rewound time so that you may try again.", CHARACTER.NPCMAD);
					WriteText("If I had 45 tomatoes and you took 12 of them, what fraction of the total number of tomatoes would you be taking from me?", CHARACTER.NPCFARM);
					SetOption("4/15", "correct3");
					SetOption("45/12", "wrong3");
					SetOption("3/5", "wrong3");
					SetOption("12", "wrong3");
					break;
				case "correct3":
					WriteText("Okay... now, once you take your tomatoes, how much, as a fraction, would I have left with me?", CHARACTER.NPCFARM);
					SetOption("45/12", "wrong4");
					SetOption("12/45", "wrong4");
					SetOption("45/33", "wrong4");
					SetOption("11/15", "correct4");
					break;
				case "wrong4":
					WriteText("Think back to the previous question. Is this one really that different? Perhaps all you need is one extra step somewhere in the process.", CHARACTER.NPCMAD);
					WriteText("I have rewound time so that you may try again.", CHARACTER.NPCMAD);
					WriteText("Once you take your tomatoes, how much, as a fraction, would I have left with me?", CHARACTER.NPCFARM);
					SetOption("45/12", "wrong4");
					SetOption("12/45", "wrong4");
					SetOption("45/33", "wrong4");
					SetOption("11/15", "correct4");
					break;
				case "correct4":
					WriteText("Wow, thank you for taking the time out of your day to help a lady with some math!", CHARACTER.NPCFARM);
					WriteText("No problem! Also, have you seen any... eggs scattered around?", CHARACTER.PLAYER);
					WriteText("Oh! I see them all the time in the dark, ominous ruins over there!", CHARACTER.NPCFARM);
					WriteText("...", CHARACTER.PLAYER);
					WriteText(".....", CHARACTER.NPCFARM);
					WriteText(".......", CHARACTER.PLAYER);
					WriteText("Well! I'd best be getting to harvesting this corn! Good luck out there!", CHARACTER.NPCFARM);
					WriteText(".........", CHARACTER.PLAYER);
					break;
							
				}
				break;
		
		case DIALOGUE.NPC4:
			switch(_optionId) {
				case "":
					WriteText("(Coughs) Greetings... traveller... it is I... the fraction sphinx... to pass, you must answer my riddles three and...", CHARACTER.NPCSPHINX);
					WriteText("...", CHARACTER.NPCSPHINX);
					WriteText("...hold on, I forgot my lines.", CHARACTER.NPCSPHINX);
					WriteText("What?", CHARACTER.PLAYER);
					WriteText("Yeah (coughs), it's been a while since anyone came through here. I've been counting birds to pass the time for the last, what? 10 years?", CHARACTER.NPCSPHINX);
					WriteText("How many have you counted so far?", CHARACTER.PLAYER);
					WriteText("One.", CHARACTER.NPCSPHINX);
					WriteText("...", CHARACTER.PLAYER);
					WriteText("In my defense, we ARE in the middle of a dark, ominous ruin where NOTHING GOES. Seriously, who puts a sphinx here?!", CHARACTER.NPCSPHINX);
					WriteText("I think I've maybe had 4 chances to get people to answer my riddles, and 2 of them just WALKED AWAY before I could even ask them the first one!", CHARACTER.NPCSPHINX);
					WriteText("That is really sad.", CHARACTER.PLAYER);
					WriteText("Exactly!", CHARACTER.NPCSPHINX);
					WriteText("...", CHARACTER.NPCSPHINX);
					WriteText("Wait you're not going to leave, are you?! Please don't leave! I need someone to answer my riddles!!", CHARACTER.NPCSPHINX);
					WriteText("What's your name?", CHARACTER.NPCSPHINX);
					WriteText("Xochitl!", CHARACTER.PLAYER);
					WriteText("Xochitl... Xochitl, please. You've GOTTA hear my riddles! I just remembered them! Don't walk away, please!", CHARACTER.NPCSPHINX);
					WriteText("(Sigh) Alright...", CHARACTER.PLAYER);
					WriteText("Really?!?! Oh boy oh boy oh boy oh boy I can't BELIEVE it!!!!", CHARACTER.NPCSPHINX);
					WriteText("Ok... here I go: What's 10/4 x 2/5?", CHARACTER.NPCSPHINX);
					SetOption("20", "wrong1");
					SetOption("25/4", "wrong1");
					SetOption("1", "correct1");
					SetOption("2", "wrong1");
					break;
				case "wrong1":
					WriteText("Alright, you got it wrong and I'm supposed to eat you, but I'm not going to because you are genuinely the best thing to happen to me in the past 20 years.", CHARACTER.NPCSPHINX);
					WriteText("You may try again.", CHARACTER.NPCSPHINX);
					WriteText("Alright, again: What's 10/4 x 2/5?", CHARACTER.NPCSPHINX);
					SetOption("20", "wrong1");
					SetOption("25/4", "wrong1");
					SetOption("1", "correct1");
					SetOption("2", "wrong1");
					break;
				case "correct1":
					WriteText("You got it right! Someone answered my riddle and got it right!", CHARACTER.NPCSPHINX);
					WriteText("Onto the next questi- I mean riddle!!", CHARACTER.NPCSPHINX);
					WriteText("What's 10/4 DIVIDED by 2/5?", CHARACTER.NPCSPHINX);
					WriteText("You want me to divide by a fraction?!", CHARACTER.PLAYER);
					WriteText("Yeah. That's... what grade are you in?!", CHARACTER.NPCSPHINX);
					WriteText("Fifth!!", CHARACTER.PLAYER);
					WriteText("Well, you should be able to do that!", CHARACTER.NPCSPHINX);
					WriteText("We haven't gotten to it yet!", CHARACTER.PLAYER);
					WriteText("Okay, well... I guess I'll have to do a warm-up... riddle... thing!", CHARACTER.NPCSPHINX);
					WriteText("Uhhm... uh... okay... see that box over there that says '4/5' on it?", CHARACTER.NPCSPHINX);
					WriteText("Yeah?", CHARACTER.PLAYER);
					WriteText("What do YOU think would happen if you put that box in the denominator?", CHARACTER.NPCSPHINX);
					SetOption("Divide the numerator by 20", "wrong2");
					SetOption("Multiply the top by 4 and then divide it by 5", "wrong2");
					SetOption("Multiply the top by 5 and then divide it by 4", "correct2");
					SetOption("The world would explode because you can't do that", "wrong2");
					break;
				case "wrong2":
					WriteText("...", CHARACTER.NPCSPHINX);
					WriteText("Did I get it?", CHARACTER.PLAYER);
					WriteText("No.", CHARACTER.NPCSPHINX);
					WriteText("What do YOU think would happen if you put the 4/5 box in the denominator?", CHARACTER.NPCSPHINX);
					SetOption("Divide the numerator by 20", "wrong2");
					SetOption("Multiply the top by 4 and then divide it by 5", "wrong2");
					SetOption("Multiply the top by 5 and then divide it by 4", "correct2");
					SetOption("The world would explode because you can't do that", "wrong2");
					break;
				case "correct2":
					WriteText("Ok, so you understand how it works now, right?", CHARACTER.NPCSPHINX);
					WriteText("I think so??", CHARACTER.PLAYER);
					WriteText("Good enough. What's 10/4 DIVIDED by 2/5?", CHARACTER.NPCSPHINX);
					SetOption("25/4", "correct3");
					SetOption("20", "wrong3");
					SetOption("2", "wrong3");
					SetOption("1", "wrong3");
					break;
				case "wrong3":
					WriteText("That wasn't correct.", CHARACTER.NPCSPHINX);
					WriteText("Darn it!", CHARACTER.PLAYER);
					WriteText("Maybe this will help you think about it a little easier: All you have to do is flip the second fraction upside down, and then MULTIPLY that and the first one.", CHARACTER.NPCSPHINX);
					WriteText("Again. What's 10/4 DIVIDED by 2/5?", CHARACTER.NPCSPHINX);
					SetOption("25/4", "correct3");
					SetOption("20", "wrong3");
					SetOption("2", "wrong3");
					SetOption("1", "wrong3");
					break;
				case "correct3":
					WriteText("Oh shoot.", CHARACTER.NPCSPHINX);
					WriteText("What?", CHARACTER.PLAYER);
					WriteText("The warm up riddle counted as one of my three riddles. I've got to let you through now.", CHARACTER.NPCSPHINX);
					WriteText("Why?", CHARACTER.PLAYER);
					WriteText("It is the way of the sphinx, my friend.", CHARACTER.NPCSPHINX);
					WriteText("Didn't you break the rule about eating me?", CHARACTER.PLAYER);
					WriteText("That one was always optional. We just get hungry sometimes.", CHARACTER.NPCSPHINX);
					WriteText("...", CHARACTER.PLAYER);
					WriteText(".....", CHARACTER.NPCSPHINX);
					WriteText("So are you going to open the door?", CHARACTER.PLAYER);
					WriteText("Oh right yeah go ahead", CHARACTER.NPCSPHINX);
					break;
							
				}
				break;
			case DIALOGUE.MISSINGEGGS:
				WriteText("Hey! It's me again!", CHARACTER.NPCBSCOTCH);
				WriteText("Oh hi!", CHARACTER.PLAYER);
				WriteText("Did you get the eggs?", CHARACTER.NPCBSCOTCH);
				WriteText("Sorry, I couldn't find any!", CHARACTER.PLAYER);
				WriteText("Dang! I guess I'll have to go to the store.", CHARACTER.NPCBSCOTCH);
				WriteText("YOU COULD HAVE DONE THAT THE WHOLE TIME?!?!", CHARACTER.PLAYER);
				break;
			case DIALOGUE.ENOUGHEGGS:
				WriteText("Hey! It's me again!", CHARACTER.NPCBSCOTCH);
				WriteText("Oh hi!", CHARACTER.PLAYER);
				WriteText("Did you get the eggs?", CHARACTER.NPCBSCOTCH);
				WriteText("Yeah! All 5 of them!", CHARACTER.PLAYER);
				WriteText("Neat!", CHARACTER.NPCBSCOTCH);
				WriteText("Have fun at the birthday party!", CHARACTER.PLAYER);
				WriteText("Actually... one of the people we invited got sick, so there may be room for another guest if you still want a slice of cake!", CHARACTER.NPCBSCOTCH);
				WriteText("I absolutely want that slice of cake.", CHARACTER.PLAYER);
				WriteText("Cool! See you then!", CHARACTER.NPCBSCOTCH);
				break;
			case DIALOGUE.ALLTHEEGSS:
				WriteText("Hey! It's me again!", CHARACTER.NPCBSCOTCH);
				WriteText("Oh hi!", CHARACTER.PLAYER);
				WriteText("Did you get the eggs?", CHARACTER.NPCBSCOTCH);
				WriteText("Does... 11 work?", CHARACTER.PLAYER);
				WriteText("Absolutely! I can't imagine how much work you must have had to go through to get all these!", CHARACTER.NPCBSCOTCH);
				WriteText("...you don't want to.", CHARACTER.PLAYER);
				WriteText("Welp, a deal's a deal. Stop by tomorrow and an entire half of the cake is yours!", CHARACTER.NPCBSCOTCH);
				WriteText("...", CHARACTER.PLAYER);
				WriteText("Worth it.", CHARACTER.PLAYER);
				break;
		}
}