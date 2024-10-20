extends CharacterBody2D

class_name Player

@onready var action_bar: HBoxContainer = %ActionBar


func _physics_process(delta: float):
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 300
	move_and_slide()

func _input(event):
	if event.is_action_pressed("use"):
		use_item()

func add_item(item):
	action_bar.add_item(item)

func use_item():
	action_bar.use_item()
