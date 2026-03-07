//Get Inputs 
rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);
jumpKeyPressed = max(keyboard_check_pressed(vk_space), keyboard_check_pressed(vk_up))

//X Movement
	//Direction
	moveDirection = rightKey - leftKey;

	//Get xSpeed
	xSpeed = moveDirection * moveSpeed;

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
	
	//Jump
	if jumpKeyPressed && place_meeting(x, y + 1, oWall) {
		ySpeed = jumpSpeed;
	}
	
	//Y Collision
	var subPixel = 0.5;
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
