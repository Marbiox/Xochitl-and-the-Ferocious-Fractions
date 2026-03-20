//Get Inputs
GetControls()

//------------------Movement------------------
canMove = !Manager.textboxActive;
if !canMove { BlockInput() }
//X Movement
//Direction
moveDirection = rightKey - leftKey;
if sign(xSpeed) != sign(moveDirection) {
	sprintingTimer = 0;
}
//Get xSpeed
xSpeed = moveDirection * minSpeed;
extraSpeed = 0;
if moveDirection > 0 && rightKey || moveDirection < 0 && leftKey {
	if sprintingTimer < sprintingFrames { sprintingTimer++ }
	extraSpeed = ((maxSpeed - minSpeed) * (sprintingTimer / sprintingFrames)) * moveDirection;
}

xSpeed += extraSpeed;

//x Collision
var subPixel = 0.5
if place_meeting(x + xSpeed, y, collisionArray) {
		
	//Make sure there is no space between player and wall
	var pixelCheck = subPixel * sign(xSpeed);
	while !place_meeting(x + pixelCheck, y, collisionArray) {
		x += pixelCheck;
	}
	
	//Set xSpeed to zero to "collide"
	xSpeed = 0;
}

//Move
x += xSpeed; 

//Y Movement
//Gravity
ySpeed += grav;

if ySpeed > terminalVelocity {ySpeed = terminalVelocity}

//Jump
if jumpKeyBuffered && onGround {
	jumpKeyBuffered = false;
	jumpKeyBufferedTimer = 0;
	ySpeed = jumpSpeed;
	
	jumpHoldTimer += jumpHoldFrames;
	
	SetOnGround(false);
}

if !jumpKey {
	jumpHoldTimer = 0;
}
if jumpHoldTimer > 0 {
	ySpeed = jumpSpeed;
	jumpHoldTimer--;
}
	
//Y Collision
//Check for solid and semisolid platforms
var _clampYSpeed = max(0, ySpeed);
var _list = ds_list_create();
var _array = array_create(0);
array_push(_array, oWall, oSemiSolidWall);

var _listSize = instance_place_list(x, y+1 + _clampYSpeed + terminalVelocity , _array, _list, false);

//Loop through the colliding instances and only return one if it's top is below the player
for (var i = 0; i < _listSize; i++) {
	var _listInstance = _list[| i];
	
	//Avoid magnetism
	if (_listInstance.ySpeed <= ySpeed || instance_exists(myFloorPlatform)) && (_listInstance.ySpeed > 0 || place_meeting(x, y+1 + _clampYSpeed, _listInstance)) {
		if _listInstance.object_index == oWall || object_is_ancestor(_listInstance.object_index, oWall) || floor(bbox_bottom) <= ceil((_listInstance.bbox_top - _listInstance.ySpeed)) {
			//Return the "highest" wall object
			if !instance_exists(myFloorPlatform) || _listInstance.bbox_top + _listInstance.ySpeed <= myFloorPlatform.bbox_top+ySpeed || _listInstance.bbox_top + _listInstance.ySpeed <= bbox_bottom {
				myFloorPlatform = _listInstance;	
			}
		}
	}
}
ds_list_destroy(_list);

if instance_exists(myFloorPlatform) && !place_meeting(x, y + terminalVelocity, myFloorPlatform) {
	myFloorPlatform = noone;	
}

//Land on the ground platform if there is one
if instance_exists(myFloorPlatform) {
	var _subPixel = 0.5;
	while !place_meeting(x, y + _subPixel, myFloorPlatform) && !place_meeting(x, y, oWall) { y += _subPixel; }
	if myFloorPlatform.object_index == oSemiSolidWall ||object_is_ancestor(myFloorPlatform.object_index, oSemiSolidWall) {
		while place_meeting(x, y, myFloorPlatform) { y -= _subPixel; }
	}
	y = floor(y);
	
	ySpeed = 0;
	SetOnGround(true);
}

//Move
y += ySpeed;

//------------------Spike Collision------------------
//Checkpoint and spike collision
if place_meeting(x, y, oCheckpoint) {
	checkpointPos = [x,y]	
}
	
if place_meeting(x, y, oSpike) {
	x = checkpointPos[0]
	y = checkpointPos[1]
}

//------------------Block Pickup------------------

if interaction && place_meeting(x, y, oNumberBlock) && block == noone {
	block = instance_place(x, y, oNumberBlock);
	block.held = true;
}
else if interaction && block != noone {
	block.x = x;
	block.y = y
	block.held = false;
	block = noone;
}
if block != noone {
	block.x = x;
	block.y = y - sprite_height;
}
