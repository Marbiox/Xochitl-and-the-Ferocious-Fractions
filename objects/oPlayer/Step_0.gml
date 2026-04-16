//Get Inputs
GetControls()

if !facingRight && rightKey && !leftKey { facingRight = true; }
else if facingRight && leftKey && !rightKey { facingRight = false; }

if (block != noone) {
	image_yscale = blockYScale;	
}

//------------------Solid Moving Platform Collision------------------
#region
//Get out of solid moving platforms
var _rightWall = noone;
var _leftWall = noone;
var _bottomWall = noone;
var _topWall = noone;

var _list = ds_list_create();
var _listSize = instance_place_list(x, y, oMovingPlatform, _list, false);

for (var i = 0; i < _listSize; i++) {
	var _listInstance = _list[| i];
	
	//Get closest walls in all directions
	//Right Wall
	if _listInstance.bbox_left - _listInstance.xSpeed >= bbox_right - 1 {
		if !instance_exists(_rightWall) || _listInstance.bbox_left < _rightWall.bbox_left {
			_rightWall = _listInstance;	
		}
	}
	//Left Wall
	if _listInstance.bbox_right - _listInstance.xSpeed <= bbox_left + 1 {
		if !instance_exists(_leftWall) || _listInstance.bbox_right < _leftWall.bbox_right {
			_leftWall = _listInstance;	
		}
	}
	//Bottom Wall
	if _listInstance.bbox_top - _listInstance.ySpeed >= bbox_bottom - 1 {
		if !_bottomWall || _listInstance.bbox_top < _bottomWall.bbox_top {
			_bottomWall = _listInstance;	
		}
	}
	//Top Wall
	if _listInstance.bbox_bottom - _listInstance.ySpeed <= bbox_top + 1 {
		if !_topWall || _listInstance.bbox_bottom > _topWall.bbox_bottom {
			_topWall = _listInstance;
		}
	}
	
}
ds_list_destroy(_list);

//Get out of walls
if instance_exists(_rightWall) {
	var _rightDistance = bbox_right - x;
	x = _rightWall.bbox_left - _rightDistance;
}
if instance_exists(_leftWall) {
	var _leftDistance = x - bbox_left;
	x = _leftWall.bbox_right + _leftDistance;
}
if instance_exists(_bottomWall) {
	var _bottomDistance = bbox_bottom - y;
	y = _bottomWall.bbox_top - _bottomDistance;
}
if instance_exists(_topWall) {
	var _upDistance = y - bbox_top;
	var _targetY = _topWall.bbox_bottom + _upDistance;
	if !place_meeting(x, _targetY, oWall) {
		y = _targetY;	
	}
}
	
//Don't get left behind by moving platforms
earlyMovingPlatformXSpeed = false;
if instance_exists(myFloorPlatform) && myFloorPlatform.xSpeed != 0 && !place_meeting(x, y + terminalVelocity + 1, myFloorPlatform) {
	if !place_meeting(x + myFloorPlatform.xSpeed, y, oWall) {
		x += myFloorPlatform.xSpeed;	
		earlyMovingPlatformXSpeed = true;
	}
}
#endregion

//------------------Movement and X Collision------------------
#region
canMove = !Manager.textboxActive;
if !canMove { BlockInput() }
//X Movement
//Direction
moveDirection = rightKey - leftKey;
if sign(xSpeed) != sign(moveDirection) {
	sprintingTimer = 30;
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
if place_meeting(x + xSpeed, y, oWall) {
		
	//Make sure there is no space between player and wall
	var pixelCheck = subPixel * sign(xSpeed);
	while !place_meeting(x + pixelCheck, y, oWall) {
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

//Jumping
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
#endregion

//------------------Y Collision and X Moving Platform Collision------------------
#region
//Upwards Y Collision
if place_meeting(x, y + ySpeed, oWall) && ySpeed < 0 {
	var _pixelCheck = 0.5 * sign(ySpeed)
	while !place_meeting(x, y + _pixelCheck, oWall) { y += _pixelCheck; }
	ySpeed = 0;
}

//Downwards Y Collision
var _clampYSpeed = max(0, ySpeed);
_list = ds_list_create();
var _array = array_create(0);
array_push(_array, oWall, oSemiSolidWall);

_listSize = instance_place_list(x, y+1 + _clampYSpeed + terminalVelocity , _array, _list, false);

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
if !place_meeting(x, y + ySpeed, oWall) { y += ySpeed; }

if instance_exists(forgetSemisolid) && !place_meeting(x, y, forgetSemisolid) {
	forgetSemisolid = noone;	
}

//Collision Snapping
movingPlatformXSpeed = 0;
if instance_exists(myFloorPlatform) { movingPlatformXSpeed = myFloorPlatform.xSpeed; }

if !earlyMovingPlatformXSpeed && place_meeting(x + movingPlatformXSpeed, y, oWall) {
		
	var _subPixel = 0.5;
	var _pixelCheck = _subPixel * sign(movingPlatformXSpeed);
	while !place_meeting(x + _pixelCheck, y, oWall) {
		x += _pixelCheck;
	}
	
	movingPlatformXSpeed = 0;
}
x += movingPlatformXSpeed;

if instance_exists(myFloorPlatform) && (myFloorPlatform.ySpeed != 0 || MovingSemisolid(myFloorPlatform) || MovingSolid(myFloorPlatform)) {
	if !place_meeting(x, myFloorPlatform.bbox_top, oWall) && myFloorPlatform.bbox_top >= bbox_bottom-terminalVelocity {
		y = myFloorPlatform.bbox_top;
	}
}

//Get pushed down through a semisolid by a moving solid
if instance_exists(myFloorPlatform) && Semisolid(myFloorPlatform) && place_meeting(x, y, oWall) {
	var _maxPushDistance = 10;
	var _pushedDistance = 0;
	var _startY = y;
	while place_meeting(x, y, oWall) && _pushedDistance <= _maxPushDistance {
		y++;
		_pushedDistance++;
	}
	myFloorPlatform = noone;
	
	if _pushedDistance > _maxPushDistance { y = _startY; };
}

if myFloorPlatform == noone { SetOnGround(false); }

image_blend = c_white;
if place_meeting(x, y, oWall) {
	image_blend = c_red;	
}

#endregion

//------------------Bubble Trouble------------------
#region
bubbleShootingTimer++;
if bKey && bubbleShootingTimer >= bubbleShootingFrames && !lastPlatformWasBubble { //(!instance_exists(myFloorPlatform) || myFloorPlatform.object_index != oBubble) {
	bubble = instance_create_depth(x, y, -30, oBubble);
	bubble.facingRight = facingRight;
	if facingRight { bubble.x = x + 15; }
	else if !facingRight { bubble.x = x - bubble.sprite_width - 15; }
	bubble.y =  y + bubbleSpawnPositionY
	bubbleShootingTimer = 0;
}

if bubbleShootingTimer < bubbleShootingFrames {
	image_blend = c_aqua;
}

if instance_exists(myFloorPlatform) && myFloorPlatform.object_index == oBubble { lastPlatformWasBubble = true; }
else if instance_exists(myFloorPlatform) { lastPlatformWasBubble = false; }

#endregion

//------------------Sprite Stuff------------------
#region

if facingRight && image_xscale > 0 { image_xscale *= -1;  }
else if !facingRight && image_xscale < 0 { image_xscale *= -1; }

#endregion

image_yscale = 1;

//------------------Spike Collision------------------
#region
//Checkpoint and spike collision
if place_meeting(x, y, oCheckpoint) {
	checkpointPos = [x,y]	
}
	
if place_meeting(x, y, oSpike) {
	Reset();
	x = checkpointPos[0]
	y = checkpointPos[1]
	image_blend = c_white;
	block = noone
}
#endregion

//------------------Block Pickup------------------
#region
if interaction && place_meeting(x, y, oNumberBlock) && block == noone {
	block = instance_place(x, y, oNumberBlock);
	block.held = true;
	//blockYScale = ((bbox_bottom - bbox_top) + block.sprite_height) / (bbox_bottom - bbox_top);

}
else if interaction && block != noone {
	block.x = x;
	block.y = y
	if myFloorPlatform == noone || !Semisolid(myFloorPlatform) { block.y += 3; }
	block.MoveUp();
	block.held = false;
	block = noone;
}

if block != noone {
	block.x = x;
	block.y = y - (bbox_bottom-bbox_top);
}
#endregion

