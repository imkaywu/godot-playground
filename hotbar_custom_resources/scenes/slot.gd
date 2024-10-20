extends Button

@onready var player = get_tree().current_scene.find_child("Player")

@export var item : Item = null:
	set(value):
		item = value
		if item != null:
			icon = item.texture
		else:
			icon = null

@export var skill : Skill = null

func _ready():
	set_process_input(false)

func _input(event):
	if event.is_action_pressed("use"):
		use_item()

func use_item():
	if skill != null:
		player.play_fx(skill)

func _on_pressed() -> void:
	use_item()
	get_parent().curr_index = get_index()
	player.find_child("Weapons")._on_index(get_index())
