depth = -100

//control setup
ControlsSetup();

//Moving
moveDirection = 0;
minSpeed = 2;
maxSpeed = 4
sprintingFrames = 30;
sprintingTimer = 0;
xSpeed = 0;
ySpeed = 0;

//Jumping
grav = 0.275;
terminalVelocity = 4;
jumpSpeed = -3;
jumpHoldTimer = 0;
jumpHoldFrames = 18;
onGround = true;

//Moving Platforms
myFloorPlatform = noone;
movingPlatformXSpeed = 0;
forgetSemisolid = noone;

checkpointPos = [x,y]

canMove = true;

collisionArray = [oWall, oGate]

block = noone
