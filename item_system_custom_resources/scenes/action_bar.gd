extends HBoxContainer

@onready var slots = get_children()


func add_item(item):
	for slot in slots:
		if !slot.item:
			slot.item = item
			return

func use_item(idx = 0):
	if slots[idx].item:
		slots[idx].item.use_item()
