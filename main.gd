extends Node2D

func _ready():
	Globals.multiplayer_hud = $MultiplayerHUD
	$BulletSpawner.add_spawnable_scene(Globals.bullet_scene.resource_path)
	$MultiplayerSpawner.add_spawnable_scene(Globals.multiplayer_player_scene.resource_path)
