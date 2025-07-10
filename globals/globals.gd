extends Node

func _ready() -> void:
	multiplayer_hud = null
	_players_spawn_node = null
	_bullets_spawn_node = null

# Global variables for nodes
var multiplayer_hud: Control
var _players_spawn_node: Node2D
var _bullets_spawn_node: Node2D

# Global variables for scenes
@export_subgroup("singleplayer")
@export var singleplayer_player: PackedScene
@export var singleplayer_bullet: PackedScene

@export_subgroup("cannons")
@export var cannon_blue: PackedScene
@export var cannon_green: PackedScene

@export_subgroup("multiplayer")
@export var multiplayer_player_scene: PackedScene
@export var bullet_scene: PackedScene
