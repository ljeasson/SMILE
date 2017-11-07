///Get Player Input

key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);

//Change player alpha
image_alpha = 0.5;

//React to Inputs
move = key_right + key_left;
hsp = move * moveSpeed;
if (vsp < 10) 
    vsp += grav;
if (place_meeting(x,y+1,obj_wall))
    vsp = key_jump * -jumpSpeed;
  
//Horizontal Collision
if (place_meeting(x+hsp,y,obj_wall)) {
    while(!place_meeting(x+sign(hsp),y,obj_wall)){
        x += sign(hsp);
    }
    hsp = 0;
}       
//Horizontal Movement
x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,obj_wall)) {
    while(!place_meeting(x,y+sign(vsp),obj_wall)){
        y += sign(vsp);
    }
    vsp = 0;
}       
//Vertical Movement
y += vsp;

//Variable Jump Height
if (vsp < 0) && (!key_jump_held) 
    vsp = max(vsp,-jumpSpeed/4);

  
//Animation  
//if (move != 0)
//    image_xscale = move;
//if (place_meeting(x,y+1,obj_wall)) {
//    if (hsp != 0)
//       sprite_index = /*Walking Animation*/;
//    else
//        sprite_index = /*Idle Animation*/;
//}
//else {
//    if (vsp < 0)
//        sprite_index = /*Jumping Animation*/;
//    else
//        prite_index = /*Falling Animation*/;
//}   
