extends MultiplayerSynchronizer

var input_rotation
var input_velocity
var input_shoot

func _ready() -> void:
	if get_multiplayer_authority() != multiplayer.get_unique_id():
		set_process(false)
		set_physics_process(false)
		
	input_rotation = Input.get_axis("left", "right") 
	input_velocity = Input.get_axis("forward", "backward") 
	input_shoot = Input.is_action_just_pressed("shoot")

func _physics_process(_delta: float) -> void:
	input_rotation = Input.get_axis("left", "right") 
	input_velocity = Input.get_axis("forward", "backward") 
	input_shoot = Input.is_action_just_pressed("shoot")
