if(place_meeting(x, y - 4, [obj_player,obj_companion_cube])){	//if the player or the cube is on the button
	if(place_meeting(x, y-4, obj_companion_cube) && !place_meeting(x, y - 4, obj_player)){	//if only cube is colliding
		var the_block = instance_nearest(x, y, obj_companion_cube)
		if(the_block.picked_up){	//when the cube is not actually on the button, disable the cube from opening the door
			with(target_machine){
				door_open = false;
			}
			return;
		}
	}
	//show_debug_message("activate");
	image_index = 1;
	with(target_machine){	//in other situations, open the corresponding door.
		//image_index = 1;
		door_open = true;
	}
}
else{
	//show_debug_message("deactivate");
	with(target_machine){	//close the door in other situations
		//image_index = 0;
		door_open = false;
	}
	image_index = 0;
}

