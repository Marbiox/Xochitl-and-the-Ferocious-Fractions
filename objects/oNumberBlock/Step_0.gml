//Y Movement
//Gravity
ySpeed += grav;

if ySpeed > terminalVelocity {ySpeed = terminalVelocity}

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
}

//Move
y += ySpeed;
