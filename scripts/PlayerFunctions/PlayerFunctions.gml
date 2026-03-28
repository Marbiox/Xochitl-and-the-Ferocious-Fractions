function ControlsSetup() {
	bufferTime = 3;  
	jumpKeyBuffered = 0;
	jumpKeyBufferedTimer = 0;
}

function CheckForSemisolidPlatform(_x, _y) {
	var _return = noone;
	if ySpeed >= 0 && place_meeting(_x, _y, oSemiSolidWall) {
		var _list = ds_list_create();
		var _listSize = instance_place_list(_x, _y, oSemiSolidWall, _list, false);
		
		for (var i = 0; i < _listSize; i++) {
			var _listInstance = _list[| i];
			if _listInstance != forgetSemisolid && floor(bbox_bottom) <= ceil(_listInstance.bbox_top - _listInstance.ySpeed) {
				_return = _listInstance;
				break;
			}
		}
		ds_list_destroy(_list);
	}
	return _return;
}

function Semisolid(_wall) {
	return _wall.object_index == oSemiSolidWall || object_is_ancestor(_wall.object_index, oSemiSolidWall);
}
function Solid(_wall) {
	return _wall.object_index == oWall || object_is_ancestor(_wall.object_index, oWall)
}
function MovingSemisolid(_wall) {
	return _wall.object_index == oSemiSolidMovingPlatform || object_is_ancestor(_wall.object_index, oSemiSolidMovingPlatform);
}
function MovingSolid(_wall) {
	return _wall.object_index == oMovingPlatform || object_is_ancestor(_wall.object_index, oMovingPlatform);
}
function Block(_block) {
	return _block.object_index == oNumberBlock || object_is_ancestor(_block.object_index, oNumberBlock);
}

function GetControls() {
	
	//Interaction Input
	interaction = keyboard_check_pressed(ord("E"))
	
	//Direction Inputs
	rightKey = max(keyboard_check(vk_right), keyboard_check(ord("D")));
	leftKey = max(keyboard_check(vk_left), keyboard_check(ord("A")));
	downKey = max(keyboard_check(vk_down), keyboard_check(ord("S")));
	bKey = keyboard_check(ord("B"));
	
	//Action Inputs
	jumpKeyPressed = max(keyboard_check_pressed(vk_space), keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")));
	jumpKey =  max(keyboard_check(vk_space), keyboard_check(vk_up), keyboard_check(ord("W")));
	
	//Jump key buffering
	if jumpKeyPressed {
		jumpKeyBufferedTimer = bufferTime;	
	}
	if jumpKeyBufferedTimer > 0 {
		jumpKeyBuffered = true;
		jumpKeyBufferedTimer--;
	}
	else {
		jumpKeyBuffered = 0;
	}
	
}

function BlockInput() {
	rightKey = 0;
	leftKey = 0;
	jumpKeyPressed = 0;
	jumpKey = 0;
	jumpKeyBuffered = false;
	jumpKeyBufferedTimer = 0;
}

function SetOnGround(_val = true) {
	if _val = true {
		onGround = true;	
	} 
	else {
		onGround = false;
		myFloorPlatform = noone;
	}
}