function SetDefaultsForText() {
	lineBreakPos[0, pageNumber] = 0;
	lineBreakNum[pageNumber	] = 0;
	lineBreakOffset[pageNumber] = 0;
	
	textboxSprite[pageNumber] = sTextbox;
	speakerSprite[pageNumber] = noone;
	speakerSide[pageNumber] = 1;
}

/// @param text
/// @param {character}
function WriteText(_text, _character = ""){
	SetDefaultsForText();
	text[pageNumber] = _text;
	
	switch(_character) {
		case CHARACTER.PLAYER:
			speakerSprite[pageNumber] = sPlayerSpeak;
			break;
		case CHARACTER.NPC:
			speakerSprite[pageNumber] = sNpcSpeak;
			speakerSide[pageNumber] = -1;
			break;
		case CHARACTER.NPCMAD:
			speakerSprite[pageNumber] = sNpcMad;
			speakerSide[pageNumber] = -1;
			break;
	}
	
	pageNumber++;
}

/// @param option
/// @param linkId
function SetOption(_option, _linkId) {
	option[optionNumber] = _option;
	optionLinkId[optionNumber] = _linkId;
	optionNumber++;
}

/// @param textId
/// @param {optionId}
function CreateTextbox(_textId, _optionId = "") {
	if !Manager.textboxActive {
		Manager.textboxActive = true;
	}
	with(instance_create_depth(0, 0, -999, oTextbox)) {
			textId = _textId;
			ScrGameText(_textId, _optionId);
	}
}