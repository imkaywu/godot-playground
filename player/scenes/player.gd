extends CharacterBody2D

const MaxSpeed = 200.0
const Acceleration = 50.0


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = velocity.move_toward(MaxSpeed * direction, Acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, Acceleration * delta)

	move_and_slide()
