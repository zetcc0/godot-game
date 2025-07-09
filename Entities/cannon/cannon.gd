extends Node2D

@export var rotation_speed : float = 0.02
@export var bullet_scene : PackedScene = preload("res://Entities/bullet/bullet.tscn")
@onready var muzzle = $muzzle  # Un Marker2D al frente del cañón

func _process(_delta: float) -> void:
	handle_rotation()

func handle_rotation() -> void:
	var input = Input.get_axis("cannon_left", "cannon_right")
	rotation += input * rotation_speed

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	get_tree().root.add_child(bullet)
	bullet.global_transform = muzzle.global_transform
