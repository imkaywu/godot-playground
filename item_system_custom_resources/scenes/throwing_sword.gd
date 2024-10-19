extends AbstractItem

var dir : Vector2 = Vector2.RIGHT
var is_throwing : bool = true


func _ready():
	set_physics_process(false)
	item = ItemFactory.get_item("throwing_sword")

func _physics_process(delta):
	check_direction()
	position += dir * 400 * delta

func use_item():
	set_physics_process(true)
	
	collision.disabled = is_throwing
	call_deferred("reparent", get_tree().current_scene)
	
	if is_throwing:
		$Timer.start()
	else:
		$Timer.stop()
	
	is_throwing = !is_throwing
	
func _on_timer_timeout():
	set_physics_process(false)

func check_direction():
	var direction_to_mouse = get_global_mouse_position() - global_position
	var direction_to_player = player.global_position - global_position
	
	if is_throwing and direction_to_player.length() > 5:
		dir = direction_to_player.normalized()
	elif !is_throwing and direction_to_mouse.length() > 5:
		dir = direction_to_mouse.normalized()
	else:
		set_physics_process(false)
