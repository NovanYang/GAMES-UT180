if(place_meeting(x, y, my_tile_map)){	//if the bullet is colliding with the walls
	//instance_create_layer(x, y, "Instances", obj_companion_cube);
	if(tilemap_get_at_pixel(my_tile_map, x, y-20) != 0 && tilemap_get_at_pixel(my_tile_map, x-20, y-10) != 0 && tilemap_get_at_pixel(my_tile_map, x+20, y-10) != 0 ){	//when detecting wall facing down
		var the_portal = instance_create_layer(x, y+8, "Instances", obj_portal_orange);
		global.orange_portal_created = true;
		the_portal.image_angle = 180;
	}
	else if(tilemap_get_at_pixel(my_tile_map, x, y+20) != 0 && tilemap_get_at_pixel(my_tile_map, x-20, y+10) != 0 && tilemap_get_at_pixel(my_tile_map, x+20, y+10) != 0 ){	//when detecting wall facing up
		var the_portal = instance_create_layer(x, y-8, "Instances", obj_portal_orange);
		global.orange_portal_created = true;
		the_portal.image_angle = 0;
	}
	else if(tilemap_get_at_pixel(my_tile_map, x-20, y) != 0){	//when detecting wall facing right
		var the_portal = instance_create_layer(x+8, y, "Instances", obj_portal_orange);
		global.orange_portal_created = true;
		the_portal.image_angle = -90;
	}
	else if(tilemap_get_at_pixel(my_tile_map, x+20, y) != 0){	//when detecting wall facing left
		var the_portal = instance_create_layer(x-8, y, "Instances", obj_portal_orange);
		global.orange_portal_created = true;
		the_portal.image_angle = 90;
	}
	instance_destroy();		//destory itself
}
