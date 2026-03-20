depth = -100

//control setup
ControlsSetup();

//Moving
moveDirection = 0;
moveSpeed = 2;
xSpeed = 0;
ySpeed = 0;

//Jumping
grav = 0.275;
terminalVelocity = 4;
jumpSpeed = -3;
jumpHoldTimer = 0;
jumpHoldFrames = 18;
onGround = true;

checkpointPos = [x,y]

canMove = true;

collisionArray = [oWall, oGate]

block = noone