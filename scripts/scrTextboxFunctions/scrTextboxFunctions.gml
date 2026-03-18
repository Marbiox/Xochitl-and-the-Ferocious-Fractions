/// @param text
function WriteText(_text){
	text[pageNumber] = _text;
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
function CreateTextbox(_textId, _optionId = "") {
	with(instance_create_depth(0, 0, -999, oTextbox)) {
		textId = _textId;
		ScrGameText(_textId, _optionId);
	}
}