## Player

### How to create a Player

1. Add a new **CharacterBody2D** node, rename it *Player*
2. Add a **Sprite2D** node, import sprite as texture
3. Add a **AnimatedSprite2D** node
4. Add a **CollisionShape2D** node, add a collision shape
5. Attach a script to the character/player node


### Player movement
In the player script, add the following code:
```
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
```

### Player animation


### Player collision
