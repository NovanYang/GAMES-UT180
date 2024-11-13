/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//moving to center of screen when pushing
if(push_timer < push_duration){
	y -= 1;
	push_timer ++;
}
else{
	staying = true;
}

//stay and fire when staying
if(staying){
	if(stay_timer < stay_duration){
		stay_timer ++;
	}
	else{
		staying = false;
		leaving = true;
	}
	
	if(fire_timer < rate_of_fire){
		fire_timer ++
	}
	else{
		instance_create_layer(x, y, "Instances", obj_enemy_bullet);
		fire_timer=0;
	}
}

//speed up and leave
if(leaving){
	y -=4;
}
