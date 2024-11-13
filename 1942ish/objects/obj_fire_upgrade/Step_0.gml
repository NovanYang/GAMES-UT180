if(place_meeting(x, y, obj_player) && ! global.fire_upgrade){	//when picked up, do a first upgrade
	global.fire_upgrade = true;
	
	instance_destroy();
	
}

if(place_meeting(x, y, obj_player) && global.fire_upgrade){		//when picked up, do a second upgrade
	global.second_upgrade = true;
	instance_destroy();
}

y += 2;

if(y > room_height + 20){
	instance_destroy();
}