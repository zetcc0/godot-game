extends Node2D

@export var rotation_speed : float = 0.07
@export var bullet_scene : PackedScene = preload("res://Entities/bullet/bullet.tscn")
@export var shoot_cooldown : float = 0.5  # medio segundo entre disparos

@onready var muzzle = $muzzle

var can_shoot: bool = true
var cooldown_timer: float = 0.0

func _process(delta: float) -> void:
	handle_rotation()
	update_cooldown(delta)

func handle_rotation() -> void:
	var input = Input.get_axis("cannon_left", "cannon_right")
	rotation += input * rotation_speed

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot") and can_shoot:
		shoot()

func shoot() -> void:
	can_shoot = false
	cooldown_timer = shoot_cooldown

	var bullet = bullet_scene.instantiate()
	get_tree().root.add_child(bullet)
	bullet.global_transform = muzzle.global_transform

func update_cooldown(delta: float) -> void:
	if not can_shoot:
		cooldown_timer -= delta
		if cooldown_timer <= 0.0:
			can_shoot = true
