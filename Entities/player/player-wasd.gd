extends CharacterBody2D

@export var speed : int = 300
@export var rotation_speed : float = 0.02

func get_input() -> void:
	rotation += Input.get_axis("left", "right") * rotation_speed
	velocity = transform.y * Input.get_axis("forward", "backward") * speed 

func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
