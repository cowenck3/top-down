extends State
class_name Attacking

@export var idle_state : State
@export var walking_state : State
@export var animation_player : AnimationPlayer



func on_enter():
	animation_tree["parameters/conditions/attacking"] = true
	
func on_exit():
	pass



func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if input_direction.length() > 0.0:
		next_state = walking_state
	else:
		next_state = idle_state
