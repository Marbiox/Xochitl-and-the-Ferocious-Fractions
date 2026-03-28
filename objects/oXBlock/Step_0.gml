<<<<<<< HEAD

//------------------Value Detection--------------------
#region
value=oXequals.value;


#endregion

//-----------------Normal Block Behavior-------------------
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
=======
event_inherited();

//------------------Value Detection--------------------
#region
if oXequals.value != noone { value = oXequals.value; }
else value = noone;


#endregion

>>>>>>> 989a0bcb98dd9c7fdc40363d9f236d3b17098c5a

