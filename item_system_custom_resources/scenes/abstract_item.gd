extends Sprite2D

class_name AbstractItem

@onready var collision: CollisionShape2D = $Area2D/CollisionShape2D
@onready var player = get_tree().current_scene.find_child("Player")

var item : Item = null:
	set(value):
		item = value
		
		if item:
			texture = item.texture
			item.connect("item_used", use_item)

func _ready():
	#testing
	item = ItemFactory.get_item("throwing_sword")

func use_item():
	print("item used")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.add_item(item)
		call_deferred("reparent", body) # make player new parent of AbstractItem
