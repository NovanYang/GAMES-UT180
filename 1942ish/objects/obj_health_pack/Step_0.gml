if(place_meeting(x, y, obj_player)){
	global.player_health += 1;
	instance_destroy();
}

y += 2;

if(y > room_height + 20){
	instance_destroy();
}
