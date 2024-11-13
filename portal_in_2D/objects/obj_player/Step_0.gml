temp = 0;

//vertical movement
if(!place_meeting(x, y, my_tile_map)){	//when not on wall, start falling
	falling = true;
	on_floor = false;
	//show_debug_message("falling");
}

if(falling){	//when falling
	vertical_velocity += falling_gravity;
	if(vertical_velocity > max_falling_speed){	//limit falling speedS
		vertical_velocity = max_falling_speed;
	}
	if(place_meeting(x, y + 2, [my_tile_map, obj_obstacles])){	//set on floor when touching objectsS
		//show_debug_message("touched");
		falling = false;
		on_floor = true;
		vertical_velocity = 0;
	}
	if(place_meeting(x, y -2, [my_tile_map, obj_obstacles])){	//set vertical velocity to 0 when on ground
		if(vertical_velocity < 0){
			vertical_velocity = 0;
		}
	}
}

if(on_floor){	//when on floor, enable jump
	if(keyboard_check(vk_space)){
		vertical_velocity += jump_impluse;
	}
}

//horizontal movement
if(keyboard_check(ord("A"))){	//moving left with speed limitS
	horizontal_velocity += left_speed;
	if(horizontal_velocity < max_right_speed){
		horizontal_velocity = max_right_speed;
	}
}
else{
	if(horizontal_velocity < 0){
		horizontal_velocity += 0.2;
	}
}


if(keyboard_check(ord("D"))){	//moving right with speed limits
	horizontal_velocity += right_speed;
	if(horizontal_velocity > max_left_speed){
		horizontal_velocity = max_left_speed;
	}
}
else{
	if(horizontal_velocity > 0){
		horizontal_velocity -= 0.2;
	}
}

//portal movement
if(place_meeting(x + sprite_width ,y,[obj_portal_orange,obj_portal_blue]) && horizontal_velocity > 0 && (global.blue_portal_created && global.orange_portal_created)){	//when is moving right and meeting one portal
	var destination_portal, initial_portal;
	if(place_meeting(x + sprite_width, y, obj_portal_orange)){	//if meeting with orange portal, set correction destination and initial point
		var destination_portal = instance_nearest(x, y, obj_portal_blue);
		var initial_portal = instance_nearest(x, y, obj_portal_orange);
	}
	else if(place_meeting(x + sprite_width, y, obj_portal_blue)){	//if meeting with blue portal, set correction destination and initial point
		var destination_portal = instance_nearest(x, y, obj_portal_orange);
		var initial_portal = instance_nearest(x, y, obj_portal_blue);
	}
	//show_debug_message("dest angle:" + string(destination_portal.image_angle));
	if(initial_portal.facing == "left"){	//if we runs into a portal facing left
		if(place_meeting(x + sprite_width/2 - 20,y,[obj_portal_orange,obj_portal_blue]) && horizontal_velocity > 0){	//set correct detection range
			if(destination_portal.facing == "left"){	//if destination facing left
				//show_debug_message("left");
				x = destination_portal.x - 4 - sprite_width/2;
				y = destination_portal.y;
				horizontal_velocity = -horizontal_velocity;
				horizontal_velocity -= 4;
			}
			else if(destination_portal.facing == "up"){	//if destination facing up, reverse movement
				//show_debug_message("up");
				x = destination_portal.x;
				y = destination_portal.y - 50 - sprite_width/2;
				var temp = horizontal_velocity;
				//horizontal_velocity = 0;
				vertical_velocity = -temp;
				vertical_velocity -= 3;
			}
			else if(destination_portal.facing == "down"){	//if destination facing down
				//show_debug_message("down");
				x = destination_portal.x;
				y = destination_portal.y + 4 + sprite_width/2
				vertical_velocity = horizontal_velocity;
				//horizontal_velocity = 0;
			}
			else if(destination_portal.facing == "right"){	//if destinaiton facing right, reverse horizontal movement
				//show_debug_message("right");
				x = destination_portal.x + 16 + sprite_width/2;
				y = destination_portal.y;
			}
		}
	}
	
	if(initial_portal.facing == "up"){	//if we runs into a portal facing up
		if(place_meeting(x + sprite_width/2 - 20,y,[obj_portal_orange,obj_portal_blue])){	
			if(destination_portal.facing == "up"){	//if destination facing up, reverse movement
				x = destination_portal.x;
				y = destination_portal.y - 50 - sprite_width/2;
				temp = vertical_velocity;
				vertical_velocity = -vertical_velocity;
				/**
				if(temp < max_up_speed && temp > speed_offset){
					vertical_velocity += 4;
				}
				**/
			}
			else if(destination_portal.facing == "left"){	//if destination facing left
				x = destination_portal.x - 14 - sprite_width/2;
				y = destination_portal.y;
				horizontal_velocity = -vertical_velocity;
				vertical_velocity = 0;
			}
			else if(destination_portal.facing == "right"){	//if destinaiton facing right, reverse horizontal movement
				x = destination_portal.x + 14 + sprite_width/2;
				y = destination_portal.y;
				horizontal_velocity = vertical_velocity;
				vertical_velocity = 0;
			}
			else if(destination_portal.facing == "down"){	//if destination facing left
				x = destination_portal.x;
				y = destination_portal.y + 14 + sprite_width/2;
				//horizontal_velocity = 0;
			}
		}
	}	
	
}

if(place_meeting(x - sprite_width ,y,[obj_portal_orange,obj_portal_blue]) && horizontal_velocity <= 0 && (global.blue_portal_created && global.orange_portal_created)){	//when is moving left and meeting one portal
	if(place_meeting(x - sprite_width, y, obj_portal_orange)){	//if meeting with orange portal, set correction destination and initial point
		var destination_portal = instance_nearest(x, y, obj_portal_blue);
		var initial_portal = instance_nearest(x, y, obj_portal_orange);
	}
	else{		//if meeting with blue portal, set correction destination and initial point
		var destination_portal = instance_nearest(x, y, obj_portal_orange);
		var initial_portal = instance_nearest(x, y, obj_portal_blue);
	}

	if(initial_portal.facing == "right"){	//if we runs into a portal facing rightS
		if(place_meeting(x - sprite_width/2 + 10 ,y,[obj_portal_orange,obj_portal_blue]) && horizontal_velocity <= 0){
			if(destination_portal.facing == "right"){	//if destinaiton facing right, reverse horizontal movement
				x = destination_portal.x + 14 + sprite_width/2;
				y = destination_portal.y;
				horizontal_velocity = -horizontal_velocity;
				horizontal_velocity += 4;
			}
			else if(destination_portal.facing == "left"){		//if destination facing left
				show_debug_message("left");
				x = destination_portal.x - 16 - sprite_width/2;
				y = destination_portal.y
				//horizontal_velocity = -horizontal_velocity;
			}
			else if(destination_portal.facing == "up"){	//if destination facing up, reverse movement
				x = destination_portal.x;
				y = destination_portal.y - 50 - sprite_width/2;
				var temp = horizontal_velocity;
				horizontal_velocity = 0;
				vertical_velocity = temp;
				vertical_velocity -= 3;
			}
			else if(destination_portal.facing == "down"){	//if destination facing down
				x = destination_portal.x;
				y = destination_portal.y + 4 + sprite_width/2
				vertical_velocity = -horizontal_velocity;
			}
		}
		
	}
	
	if(initial_portal.facing == "up"){	//if we runs into a portal facing up
		if(place_meeting(x - sprite_width/2 + 20 ,y,[obj_portal_orange,obj_portal_blue]) && horizontal_velocity <= 0){
			if(destination_portal.facing == "up"){	//if destination facing up, reverse movement
				x = destination_portal.x;
				y = destination_portal.y - 50 - sprite_width/2;
				temp = vertical_velocity;
				vertical_velocity = -vertical_velocity;
				/**
				if(temp < max_up_speed && temp > speed_offset){
					vertical_velocity += 4;
				}
				**/
			}
			else if(destination_portal.facing == "left"){		//if destination facing left
				x = destination_portal.x - 40 - sprite_width/2;
				y = destination_portal.y;
				horizontal_velocity = -vertical_velocity;
				vertical_velocity = 0;
			}
			else if(destination_portal.facing == "right"){	//if destinaiton facing right, reverse horizontal movement
				x = destination_portal.x + 14 + sprite_width/2;
				y = destination_portal.y - 2;
				horizontal_velocity = vertical_velocity;
				vertical_velocity = 0;
			}
			else if(destination_portal.facing == "down"){	//if destination facing down
				x = destination_portal.x;
				y = destination_portal.y + 14 + sprite_width/2;
				//horizontal_velocity = 0;
			}
		}
	}
}

if(y > room_height){	//when jumping into void, restart room and destory portalsS
	if(global.blue_portal_created){
		var blue_portal = instance_nearest(x, y, obj_portal_blue);
		instance_destroy(blue_portal);
	}
	if(global.orange_portal_created){
		var orange_portal = instance_nearest(x, y, obj_portal_orange);
		instance_destroy(orange_portal);
	}
	room_goto(room);
}






