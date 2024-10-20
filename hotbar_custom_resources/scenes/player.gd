extends CharacterBody2D


@onready var fx: AnimatedSprite2D = $FX
@onready var hotbar: HBoxContainer = $UI/Hotbar


func _physics_process(delta):
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 150
	move_and_slide()
	
func play_fx(skill):
	fx.play(skill.name)

func add_item(item, skill):
	hotbar.add_item(item, skill)
