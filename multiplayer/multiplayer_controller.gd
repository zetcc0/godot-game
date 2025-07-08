extends CharacterBody2D


@export var speed : int = 300
@export var rotation_speed : float = 0.02

@export var bullet_scene : PackedScene = preload("res://bullet.tscn")

@export var player_id : int = 1:
	set (id):
		player_id = id 
		%InputSynchronizer.set_multiplayer_authority(id)

func get_input() -> void:
	rotation += %InputSynchronizer.input_rotation * rotation_speed
	velocity = transform.y * %InputSynchronizer.input_velocity * speed 

func shoot() -> void:
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	b.transform = $".".global_transform

func _physics_process(_delta: float) -> void:
	if !multiplayer.is_server():
		return
	get_input()
	move_and_slide()
	if %InputSynchronizer.input_shoot:
		shoot()
