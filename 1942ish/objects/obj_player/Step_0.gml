//conditions for player to move and shoot
moving_left = keyboard_check(ord("A")) && (x - screen_offset > 0);
moving_right = keyboard_check(ord("D")) && (x + screen_offset < room_width);
moving_up = keyboard_check(ord("W")) && (y - screen_offset > 0);
moving_down = keyboard_check(ord("S")) && (y + screen_offset < room_height);
shooting = keyboard_check(vk_space);

//do movement
if(moving_left){
	x -= moving_speed;
}
if(moving_right){
	x += moving_speed;
}
if(moving_up){
	y -= moving_speed;
}
if(moving_down){
	y += moving_speed;
}

if(shooting){	//shoot and upgrade for fire power
	if(fire_timer < rate_of_fire){
		fire_timer++
	}
	else{
		if(!global.fire_upgrade){
			instance_create_layer(x - 10, y, "Instances", obj_bullet);
			instance_create_layer(x + 10, y, "Instances", obj_bullet);
		}
		else{
			if(global.second_upgrade){
				instance_create_layer(x - 25, y, "Instances", obj_bullet);
				instance_create_layer(x + 25, y, "Instances", obj_bullet);
			}
			instance_create_layer(x - 5, y, "Instances", obj_bullet);
			instance_create_layer(x + 5, y, "Instances", obj_bullet);
			instance_create_layer(x - 10, y, "Instances", obj_bullet);
			instance_create_layer(x + 10, y, "Instances", obj_bullet);
		}
		fire_timer=0;
	}
}
else{
	fire_timer = rate_of_fire;
}

if(place_meeting(x, y, obj_enemy_bullet)){
	//show_debug_message("Get hit!!!");
}

if(!rolling && keyboard_check_pressed(ord("R")) && global.roll_number >= 1){	//do the rolling aciton
	rolling = true;	
	global.roll_number -= 1;
}

if(rolling){	//make player invincible when rolling
	invincible = true;
	if(roll_timer < roll_duration){
		roll_timer++;
	}
	else{
		roll_timer = 0;
		rolling = false;
		invincible = false;
	}
	if(roll_timer < roll_duration/3){
		y -= 10;
	}
	else if(roll_timer < roll_duration/3 * 2){
		y += 10;
		image_angle = 180;
	}
	else{
		image_angle = 0;
	}
}

if(place_meeting(x + 100, y, obj_aircraft) || place_meeting(x - 100, y,obj_aircraft)){	//set winning
	global.win = true;
	room_goto(rm_end_screen);
}
if(!invincible){	//when not invincible, calcualte for health system
	if(place_meeting(x, y, obj_enemy_bullet) || place_meeting(x, y, obj_enemy)){
		if(global.player_health > 1){
			room_goto(rm_level_1);
			global.player_health -= 1;
			global.player_score = 0;
			global.roll_number = 3;
			global.fire_upgrade = false;
			global.second_upgrade = false;
			global.kill_count = 0;
		}
		else{
			room_goto(rm_end_screen);
		}
	}
}
