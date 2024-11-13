y += bullet_speed;//when bullet out of map, destroy it
if(y > room_height){
	instance_destroy();
}
