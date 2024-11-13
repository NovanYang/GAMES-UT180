if(global.blue_portal_created){	//when portal already created, create one and destory previous one
	var current_portal = instance_nearest(x, y, obj_portal_blue);
	instance_destroy(current_portal);
	global.blue_portal_created = false;
}
	
//set for bullect direction and speed
blue_beam = instance_create_layer(x, y - 10, "Instances", obj_blue_beam);
blue_beam.speed = 20;
blue_beam.direction = point_direction(x, y, mouse_x, mouse_y);
blue_beam.image_angle = blue_beam.direction;

