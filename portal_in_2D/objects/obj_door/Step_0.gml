//show_debug_message(string(x) + " " + string(y));
if(door_open){	//when the door is open, make it unable to collide and set correct visibility
	x = spawn_location_x;
	y = spawn_location_y - sprite_height;
	visible = false;
}
else{
	x = spawn_location_x;
	y = spawn_location_y;
	visible = true;
}