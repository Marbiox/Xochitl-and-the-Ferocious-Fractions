 function MoveUp() {
	var _pixelCheck = -0.5
	while place_meeting(x, y + _pixelCheck, oWall) { y += _pixelCheck; }
	ySpeed = 0;
}

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

//------------------Value Detection--------------------
#region
value=oXequals.value;


#endregion

//------------------Movement and X Collision------------------
#region
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
#endregion
