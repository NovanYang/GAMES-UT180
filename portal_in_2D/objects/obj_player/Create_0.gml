my_tile_map = layer_tilemap_get_id("Tiles_1");	//set correct tile set
vertical_velocity = 0;	//vertical movement
horizontal_velocity = 0;	//horizontal movement

//falling stuff
falling = false;
falling_gravity = 1;
max_falling_speed = 40;

//jumping stuff
jump_impluse = -20;
jumping = false;
on_floor = false;

//horizontal_movement
left_speed = -1;
right_speed = 1;
max_horizontal_speed = 8;
max_right_speed = -max_horizontal_speed;
max_left_speed = max_horizontal_speed;

//portal stuff
portal_timer = 0;
portal_duration = 10;
can_portal = true;
max_up_speed = 30;
speed_offset = 15;
global.blue_portal_created = false;
global.orange_portal_created = false;

