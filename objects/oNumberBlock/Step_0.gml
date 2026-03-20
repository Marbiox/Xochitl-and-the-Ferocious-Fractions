ySpeed += grav;

if ySpeed > terminalVelocity {ySpeed = terminalVelocity}
	
//Y Collision
subPixel = 0.5;
if place_meeting(x, y + ySpeed, oWall) {
		
	//Make sure there is no space between player and wall
	var pixelCheck = subPixel * sign(ySpeed)
	while !place_meeting(x, y + subPixel, oWall) {
		y += pixelCheck;
	}
		
	//Set ySpeed to zero to "collide"
	ySpeed = 0;
}

//Move
y += ySpeed;