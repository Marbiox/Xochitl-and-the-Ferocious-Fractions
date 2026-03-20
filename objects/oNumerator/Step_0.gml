block = instance_place(x, y, oNumberBlock)
if block != noone && !block.held {
	value = block.value
}
else value = noone;