extends CharacterBody2D

const MaxSpeed = 200.0
const Acceleration = 50.0

@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get('parameters/playback')


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		animation_tree.set('parameters/Idle/blend_position', direction)
		animation_tree.set('parameters/Walk/blend_position', direction)
		animation_tree.set('parameters/Hit/blend_position', direction)
		animation_state.travel('Walk')
		velocity = velocity.move_toward(MaxSpeed * direction, Acceleration * delta)
	else:
		animation_state.travel('Idle')
		velocity = velocity.move_toward(Vector2.ZERO, Acceleration * delta)

	move_and_slide()
