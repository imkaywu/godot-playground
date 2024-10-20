extends HBoxContainer


@onready var slots = get_children()
signal index(i : int)

var curr_index : int:
	set(value):
		curr_index = value
		reset_focus()
		set_focus()

func _ready():
	curr_index = 0

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
			return
