extends HBoxContainer


@onready var slots = get_children()
signal index(i : int)
var new_index : int = 0

var curr_index : int:
	set(value):
		curr_index = value
		reset_focus()
		set_focus()

func _ready():
	get_child(0).grab_focus()
	get_child(0).set_process_input(true)

func reset_focus():
	for slot in slots:
		slot.set_process_input(false)

func set_focus():
	get_child(curr_index).grab_focus()
	get_child(curr_index).set_process_input(true)
	index.emit(curr_index)

func _input(event):
	if event.is_action_pressed("scroll_down"):
		curr_index = (curr_index + 1) % get_child_count()
	if event.is_action_pressed("scroll_up"):
		curr_index = (curr_index - 1 + get_child_count()) % get_child_count()

func add_item(item, skill):
	for slot in slots:
		if !slot.item:
			slot.item = item
			slot.skill = skill
			new_index = slot.get_index()
			return
