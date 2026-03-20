function ControlsSetup() {
	bufferTime = 3;  
	jumpKeyBuffered = 0;
	jumpKeyBufferedTimer = 0;
}

function GetControls() {
	
	//Interaction Input
	interaction = keyboard_check_pressed(ord("E"))
	
	//Direction Inputs
	rightKey = max(keyboard_check(vk_right), keyboard_check(ord("D")));
	leftKey = max(keyboard_check(vk_left), keyboard_check(ord("A")));
	
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