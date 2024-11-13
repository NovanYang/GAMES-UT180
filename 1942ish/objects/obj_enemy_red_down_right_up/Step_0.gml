/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//move when pushing state
if(push_timer < push_duration){
	push_timer++;
	y += 4;
}
else{
	turning = true;
}

//do a total 180 turn
//first turn
if(turning){
	if(turn_count < 3){
		x += 4;
		y += 4;
		if(turn_timer < turn_duration){
			turn_timer++;
		}
		else{
			turn_timer = 0;
			image_angle += 30;
			turn_count += 1;
		}
	}
	else{
		turning = false;
		change_direction = true;
	}
}

//after first turn, move a bit
if(change_direction){
	if(change_timer < change_duration){
		x += 4;
		change_timer++
	}
	else{
		//turn_count = 0
		second_turn = true;
		change_direction = false;
	}
}

//do the second turn
if(second_turn){
	if(turn_count < 6){
		x += 4;
		y -= 4;
		if(turn_timer < turn_duration){
			turn_timer++;
		}
		else{
			turn_timer = 0;
			image_angle += 30;
			turn_count += 1;
		}
	}
	else{
		second_turn = false;
		get_back = true;
	}
}
//escape
if(get_back){
	y -= 4;
}
