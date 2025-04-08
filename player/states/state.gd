extends Node
class_name State

#export variables
@export var can_move : bool = true

#variables
var player : CharacterBody2D
var next_state : State 
var input_direction : Vector2
var animation_tree : AnimationTree
var sprite_2d : Sprite2D



func state_input(_event):
	pass

func on_enter():
	pass

func on_exit():
	pass

func state_process(_delta):
	pass
