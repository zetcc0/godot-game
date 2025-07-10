extends Area2D

@export var speed : int = 100

func _physics_process(delta: float) -> void:
	position += -transform.y * speed * delta
