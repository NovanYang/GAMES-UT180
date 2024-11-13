out_of_map = y > room_height + 500 || y < -500 || x < -500 || x > room_width + 500;	//condition for enemy far out from map

if(health_point <= 0){	//when player kill enemy, add for socre and kill count
	instance_destroy();
	global.player_score += score_point;
	global.kill_count += 1;
}

if(place_meeting(x, y, obj_bullet)){	//when bullet hit enemy, calculate for eveything
	hitting_bullet = instance_nearest(x, y, obj_bullet);
	instance_destroy(hitting_bullet);
	health_point -= 1;
	effect_create_layer("Instances", ef_firework, x, y, 0, c_red);
}

if(out_of_map){		//destroy instance when out of map
	//show_debug_message("destroy!");
	instance_destroy();
}
