//Y Movement
//Gravity
ySpeed += grav;

if ySpeed > terminalVelocity {ySpeed = terminalVelocity}

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
	if (_listInstance.ySpeed <= ySpeed || instance_exists(myFloorPlatform))
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
y += ySpeed;

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
