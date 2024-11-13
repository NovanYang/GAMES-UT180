//UI
draw_set_font(fnt_text);
draw_set_color(c_yellow);
draw_set_halign(fa_center);
//HIght score
draw_text(room_width/2, 10, "HIGH SCORE");
draw_set_color(c_white);
draw_text(room_width/2, 25, string(global.hight_score));

//current score
draw_text(40, 10, "SCORE");
draw_text(40, 25, string(global.player_score));
if(global.player_score >= global.hight_score){
	global.hight_score = global.player_score;
}


//when not in menu, show health info and rolling info
if(room != rm_start_menu){
	show_instruction = false;
	for(var i=0; i < global.player_health; i++){
		draw_sprite(spr_health_icon, 0, 10+i*20, room_height-20);
	}
	for(var i=0; i < global.roll_number; i++){
		draw_sprite(spr_roll, 0, 390+i*20, room_height-20);
	}
}
else{
	draw_text(room_width/2, room_height - 30, "@2024 Novan Yang");
}

if(show_instruction){//show instruction at menu
	draw_text(room_width/2, room_height/2 + 200, "Press ENTER to play");
	draw_text(room_width/2, room_height/2 + 220, "W A S D to move, SPACE to shoot");
	draw_text(room_width/2, room_height/2 + 240, "Press R to roll");
}

if(text_timer < text_duration && show_instruction){
	text_timer++;
}
else{
	show_instruction = false;
}

if(show_instruction = false){
	text_timer--;
	if(text_timer == 0){
		show_instruction = true;
	}
}

if(room == rm_end_screen){	//show instruciton at end screen
	var hit_rate = (global.kill_count / global.enemy_count) * 100;
	var hit_rate_text = "Hit Rate: " + string(hit_rate) + "%";
	if(global.win){
		draw_text(room_width/2, room_height/2 - 100, "Congratulation!");
	}
	else{
		draw_text(room_width/2, room_height/2 - 100, "Try Again!");
	}
	draw_text(room_width/2, room_height/2 + 220, hit_rate_text);
	draw_text(room_width/2, room_height/2 + 240, "Press R to replay");
	
}

