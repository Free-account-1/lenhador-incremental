extends CharacterBody2D

const SPEED = 80.0
func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO

	if Input.is_action_pressed('ui_left'):
		velocity.x = -1 * SPEED
		$AnimatedSprite2D.play("left")
	if Input.is_action_pressed('ui_right'):
		velocity.x = 1 * SPEED
		$AnimatedSprite2D.play("right")
	if Input.is_action_pressed('ui_up'):
		velocity.y = -1 * SPEED
		$AnimatedSprite2D.play("up")
	if Input.is_action_pressed('ui_down'):
		velocity. y = 1 * SPEED
		$AnimatedSprite2D.play("down")
	move_and_slide()
