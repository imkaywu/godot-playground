extends Node2D


var curr_index : int = 0

func reset():
	var weapons = get_children()
	for weapon in weapons:
		weapon.hide()

func show_weapon(index):
	if index < get_child_count():
		get_child(index).show()

func _on_index(i: int = curr_index) -> void:
	reset()
	show_weapon(i)
	curr_index = i

func _on_child_entered_tree(node: Node) -> void:
	_on_index()
