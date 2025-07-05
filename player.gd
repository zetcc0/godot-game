extends CharacterBody2D

@export var speed = 4000
@export var rotation_speed = 1.5

func _physics_process(delta: float) -> void:
	velocity = Vector2()

	if Input.is_action_pressed("right"):
		rotation += 0.02
	if Input.is_action_pressed("left"):
		rotation -= 0.02
	if Input.is_action_pressed("backward"):
		velocity.y += 1
	if Input.is_action_pressed("forward"):
		velocity.y -= 1
	velocity = velocity * speed * delta
	velocity = velocity.rotated(rotation)
	move_and_slide()

func _input(event: InputEvent) -> void:
	pass
