extends CharacterBody2D

@export var speed : int = 300
@export var rotation_speed : float = 0.02
@export var player_id : int = 1:
	set (id):
		player_id = id 
		%InputSynchronizer.set_multiplayer_authority(id)

var is_shooting : bool = false

signal signal_shoot(player_transform : Transform2D)

func get_input() -> void:
	rotation += %InputSynchronizer.input_rotation * rotation_speed
	velocity = transform.y * %InputSynchronizer.input_velocity * speed 

func _physics_process(_delta: float) -> void:
	if !multiplayer.is_server():
		return
	get_input()
	move_and_slide()

func _process(_delta: float) -> void:
	if !multiplayer.is_server():
		return
	if is_shooting:
		print("I am shooting! ", player_id)
		is_shooting = false
		emit_signal("signal_shoot", $".".global_transform)
