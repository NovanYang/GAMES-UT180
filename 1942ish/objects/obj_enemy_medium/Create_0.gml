/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
vertical_speed = 0;
health_point = 10;

//stage 1 movement
push_timer = 0;
push_duration = 500;

//stage 2 timer
stay_timer = 0;
stay_duration = 400;

//states
leaving = false;
staying = false;

//stage 2 fire action
fire_timer = 80;
rate_of_fire = 100;
score_point = 2000;
