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
if !jumpKey { jumpHoldTimer = 0; }
	
//Y Collision
//Check for solid and semisolid platforms

//upwards Y collision
if place_meeting(x, y + ySpeed, oWall) && ySpeed < 0 {
	var _pixelCheck = 0.5 * sign(ySpeed)
	while !place_meeting(x, y + _pixelCheck, oWall) { y += _pixelCheck; }
	ySpeed = 0;
}

//downwards Y collision
var _clampYSpeed = max(0, ySpeed);
var _list = ds_list_create();
var _array = array_create(0);
array_push(_array, oWall, oSemiSolidWall);

var _listSize = instance_place_list(x, y+1 + _clampYSpeed + terminalVelocity , _array, _list, false);

//Loop through the colliding instances and only return one if it's top is below the player
for (var i = 0; i < _listSize; i++) {
	var _listInstance = _list[| i];
	
	//Avoid magnetism
	if _listInstance != forgetSemisolid && (_listInstance.ySpeed <= ySpeed || instance_exists(myFloorPlatform)) 
	&& (_listInstance.ySpeed > 0 || place_meeting(x, y+1 + _clampYSpeed, _listInstance)) {
		if Solid(_listInstance) || floor(bbox_bottom) <= ceil(_listInstance.bbox_top - _listInstance.ySpeed) {
			//Return the "highest" wall object
			if !instance_exists(myFloorPlatform) || _listInstance.bbox_top + _listInstance.ySpeed <= myFloorPlatform.bbox_top + myFloorPlatform.ySpeed || _listInstance.bbox_top + _listInstance.ySpeed <= bbox_bottom {
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
	if Semisolid(myFloorPlatform) {
		while place_meeting(x, y, myFloorPlatform) { y -= _subPixel; }
	}
	y = floor(y);
	
	ySpeed = 0;
	SetOnGround(true);
}

//moving down platforms
if downKey {
	if instance_exists(myFloorPlatform) && Semisolid(myFloorPlatform) {
			var _yCheck = max(1, myFloorPlatform.ySpeed + 1);
			if !place_meeting(x, y + _yCheck, oWall) {
				
				y += 1;
				
				ySpeed = _yCheck - 1;
				
				forgetSemisolid = myFloorPlatform;
				
				SetOnGround(false);
			}
	}
}

//Move
y += ySpeed;

if instance_exists(forgetSemisolid) && !place_meeting(x, y, forgetSemisolid) {
	forgetSemisolid = noone;	
}

//Collision Snapping
movingPlatformXSpeed = 0;
if instance_exists(myFloorPlatform) { movingPlatformXSpeed = myFloorPlatform.xSpeed; }

if place_meeting(x + movingPlatformXSpeed, y, oWall) {
		
	var _subPixel = 0.5;
	var _pixelCheck = _subPixel * sign(movingPlatformXSpeed);
	while !place_meeting(x + _pixelCheck, y, oWall) {
		x += _pixelCheck;
	}
	
	movingPlatformXSpeed = 0;
}
x += movingPlatformXSpeed;

if instance_exists(myFloorPlatform) && (myFloorPlatform.ySpeed != 0 || Semisolid(myFloorPlatform))  {
	if !place_meeting(x, myFloorPlatform.bbox_top, oWall) && myFloorPlatform.bbox_top >= bbox_bottom-terminalVelocity {
		y = myFloorPlatform.bbox_top;
	}
	
	//Going up into a solid wall while on a semisolid platform
	if myFloorPlatform.ySpeed < 0 && place_meeting(x, y + myFloorPlatform.ySpeed, oWall) {
		if Semisolid(myFloorPlatform) {
			var _subPixel = 0.25;
			while place_meeting(x, y + myFloorPlatform.ySpeed, oWall) { y +=  _subPixel; }
			while place_meeting(x, y, oWall) { y -= _subPixel; }
			y = round(y);
		}
		SetOnGround(false);
	}
}

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
