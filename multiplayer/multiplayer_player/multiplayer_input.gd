extends MultiplayerSynchronizer

@onready var player = $".."

var input_rotation
var input_velocity

func _ready() -> void:
	if get_multiplayer_authority() != multiplayer.get_unique_id():
		set_physics_process(false)
		set_process(false)

	input_rotation = Input.get_axis("left", "right") 
	input_velocity = Input.get_axis("forward", "backward") 

func _physics_process(_delta: float) -> void:
	input_rotation = Input.get_axis("left", "right") 
	input_velocity = Input.get_axis("forward", "backward") 

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot.rpc()

@rpc("call_local")
func shoot():
	if multiplayer.is_server():
		player.is_shooting = true
