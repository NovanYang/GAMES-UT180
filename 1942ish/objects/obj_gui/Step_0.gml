if(room != rm_start_menu){	//test
	show_instruction = false;
	for(var i=0; i < global.player_health; i++){
		draw_sprite(spr_health_icon, 0, 10+i*20, room_height-20);
		draw_sprite(spr_roll, 0, 390+i*20, room_height-20);
	}
}