extends Sprite2D


@onready var collision: CollisionShape2D = $Area2D/CollisionShape2D

@export var item : Item
@export var skill : Skill

func _ready():
	if item:
		texture = item.texture

func _on_player_entered(body: Node2D):
	call_deferred("reparent", body.find_child("Weapons"))
	position = body.position
	body.add_item(item, skill)
	collision.call_deferred("set_disabled", true)
