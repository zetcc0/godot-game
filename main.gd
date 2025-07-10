extends Node2D

func _ready():
	# Assigning the nodes
	Globals.multiplayer_hud = $MultiplayerHUD
	Globals._bullets_spawn_node = %Bullets
	Globals._players_spawn_node = %Players 
	
	# Assigning spawnable scenes to synchronizing spawners
	$BulletSpawner.add_spawnable_scene(Globals.bullet_scene.resource_path)
	$MultiplayerSpawner.add_spawnable_scene(Globals.multiplayer_player_scene.resource_path)
