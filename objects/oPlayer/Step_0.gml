//Get Inputs
GetControls()

//------------------Movement------------------
canMove = !Manager.textboxActive;
if !canMove { BlockInput() }
//X Movement
//Direction
moveDirection = rightKey - leftKey;

//Get xSpeed
xSpeed = moveDirection * moveSpeed;

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
}

if !jumpKey {
	jumpHoldTimer = 0;
}
if jumpHoldTimer > 0 {
	ySpeed = jumpSpeed;
	jumpHoldTimer--;
}
	
//Y Collision
subPixel = 0.5;
if place_meeting(x, y + ySpeed, collisionArray) {
		
	//Make sure there is no space between player and wall
	var pixelCheck = subPixel * sign(ySpeed)
	while !place_meeting(x, y + subPixel, collisionArray) {
		y += pixelCheck;
	}
		
	//Set ySpeed to zero to "collide"
	ySpeed = 0;
}
	
	if ySpeed >= 0 && place_meeting(x, y+1, collisionArray) {
		onGround = true;	
	}
	else {
		onGround = false;
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