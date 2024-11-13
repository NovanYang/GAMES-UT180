/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(push_timer < push_duration){
	push_timer++;
	y -= 3;
}
else{
	turning = true;
}


if(turning){
	if(turn_count < 3){
		x -= 1;
		y += 1;
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
		horizontal_moving = true;
	}
}

if(horizontal_moving){
	x -= 3;
}
