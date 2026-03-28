var _blocks = ds_list_create();
var _listSize = instance_place_list(x,y,oNumberBlock,_blocks,false);


var _oldBlockFound = false;
if instance_exists(block) {
	for (var i = 0; i < _listSize; i++) {
		if _blocks[| i] == block && !_blocks[| i].held {
			_oldBlockFound = true;
			break;
		}
	}
}

var _blockFound = _oldBlockFound;
if !_oldBlockFound {
	for (var i = 0; i < _listSize; i++) {
		if !_blocks[| i].held {
			block = _blocks[| i]
			_blockFound = true;
			break;
		}
	}
}

ds_list_destroy(_blocks);

if !_blockFound { block = noone; }

if block != noone {
	value = block.value
}
else value = noone;