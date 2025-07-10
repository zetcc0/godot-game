extends CharacterBody2D

@export var speed : int = 300
@export var rotation_speed : float = 0.02
@export var bullet_scene : PackedScene

func get_input() -> void:
	rotation += Input.get_axis("left", "right") * rotation_speed
	velocity = transform.y * Input.get_axis("forward", "backward") * speed 

func shoot() -> void:
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	b.transform = $".".global_transform

func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()
