extends State
class_name IdleState

@export var walking_state : State
@export var attack_state: State


func on_enter():
	animation_tree["parameters/conditions/idle"] = true
	animation_tree["parameters/conditions/is_walking"] = false
	animation_tree["parameters/conditions/attacking"] = false

func state_process(_delta):
	if input_direction.length() > 0.0:
		next_state = walking_state


func state_input(event : InputEvent):
	if event.is_action_pressed("attack"):
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/attacking"] = true
		next_state = attack_state
		
