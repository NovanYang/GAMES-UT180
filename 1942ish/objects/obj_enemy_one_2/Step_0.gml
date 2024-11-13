/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(pushing_timer < pushing_duration){
	pushing_timer++;
	vertical_speed = 3;
	image_angle = 180;
	
	if(fire_timer < rate_of_fire){
		fire_timer ++
	}
	else{
		instance_create_layer(x, y, "Instances", obj_enemy_bullet);
		fire_timer=0;
	}
}

else{
	vertical_speed = -4;
	image_angle = 0;
}