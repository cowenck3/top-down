extends State
class_name WalkingState


@export var idle_state : State
@export var attack_state: State


var speed := 150.0

func on_enter():
	animation_tree["parameters/conditions/idle"] = false
	animation_tree["parameters/conditions/is_walking"] = true
	animation_tree["parameters/conditions/attacking"] = false


func state_process(_delta):
	var has_input_direction := input_direction.length() > 0.0
	if has_input_direction:
		animation_tree["parameters/Walk/blend_position"] = input_direction
		animation_tree["parameters/Idle/blend_position"] = input_direction
		animation_tree["parameters/Attack/blend_position"] = input_direction
		var desired_velocity := input_direction * speed
		player.velocity = desired_velocity
		#check x direction and flip sprite if negative
		if round(input_direction.x) == -1.0:
			sprite_2d.flip_h = true
		else: 
			sprite_2d.flip_h = false
			
	else:
		player.velocity = Vector2.ZERO
		next_state = idle_state
	
func state_input(event : InputEvent):
	if event.is_action_pressed("attack"):
		animation_tree["parameters/Attack/blend_position"] = input_direction
		animation_tree["parameters/conditions/is_walking"] = false
		
		next_state = attack_state
