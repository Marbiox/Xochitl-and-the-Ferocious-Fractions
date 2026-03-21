
xSpeed = 1.5;
if !facingRight { xSpeed *= -1; }
x += xSpeed;

bubbleLifeTimer++;

if place_meeting(x, y, oWall) || bubbleLifeTimer >= bubbleLifeFrames { instance_destroy(); }
