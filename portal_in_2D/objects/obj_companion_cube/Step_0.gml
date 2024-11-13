player_x_pos = instance_nearest(x, y, obj_player).x;	//get player's x pos
player_y_pos = instance_nearest(x, y, obj_player).y;	

if(point_distance(x, y, player_x_pos, player_y_pos) < 100 && !(picked_up)){	//when the player is close to the cube, make the cube to be able to be picked up
	//show_debug_message("can pick!");
	if(keyboard_check_pressed(ord("E"))){	//press E to pick up
		//show_debug_message("picked!");
		picked_up = true;
	}
}
else{
	if(picked_up){	//when picked up, make the cube follow player's mouse
		x = mouse_x;
		y = mouse_y;
		if(keyboard_check_pressed(ord("E")) && point_distance(x, y, player_x_pos, player_y_pos) < 100){	//when E is pressed again, drop the cube
			picked_up = false;
			//show_debug_message("drop");
		}
	}
}

if(!place_meeting(x, y, [my_tile_map, obj_player])){	//set falling for the cubeS
	falling = true;
}

if(falling && !picked_up){	//take gravity into the cubeS
	vertical_velocity += falling_gravity;
	if(vertical_velocity > max_falling_speed){
		vertical_velocity = max_falling_speed;
	}
	if(place_meeting(x, y + 2, [my_tile_map, obj_obstacles, obj_player])){
		//show_debug_message("touched");
		falling = false;
		vertical_velocity = 0;
	}
	if(place_meeting(x, y -2, [my_tile_map, obj_obstacles, obj_player])){
		if(vertical_velocity < 0){
			vertical_velocity = 0;
		}
	}
}
