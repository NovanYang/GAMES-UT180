if(room == rm_start_menu){	//if at start menu, press enter to playe
	if(keyboard_check_pressed(vk_enter)){
		room_goto(rm_level_1);
	}
	timeline_running = false;
}

if(room == rm_level_1){	//start timeline
	timeline_running = true;
}

if(room == rm_end_screen){	//pause timeline
	timeline_running = false;
}

if(room == rm_end_screen){	//restart everything when R is pressed
	if(keyboard_check_pressed(ord("R"))){
		room_goto(rm_start_menu);
		global.player_score = 0;
		global.fire_upgrade = false;
		global.second_upgrade = false;
		global.player_health = 3;
		global.kill_count = 0;
		global.roll_number = 3;
		global.win = false;
	}
}


