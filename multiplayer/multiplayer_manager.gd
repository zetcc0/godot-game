extends Node

const SERVER_PORT = 8080
const SERVER_IP = "127.0.0.1"

var multiplayer_scene = preload("res://multiplayer/multiplayer_player.tscn")

var _players_spawn_node

func become_host():
	print("Starting host!")
	
	_players_spawn_node = get_tree().get_current_scene().get_node("Players")
	
	# Creating server peer
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(SERVER_PORT)
	# Assigning server peer
	multiplayer.multiplayer_peer = server_peer
	# Handling connection and disconnection
	multiplayer.peer_connected.connect(_add_player_to_game)
	multiplayer.peer_disconnected.connect(_del_player)
	
	# Remove single player mode, adding multiplayer player
	_remove_single_player()
	_add_player_to_game(1)

func join_as_player_2():
	print("Player 2 joining!")
	
	# Creating client peer
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(SERVER_IP, SERVER_PORT)
	# Assigning client peer
	multiplayer.multiplayer_peer = client_peer
	# Remove single player
	_remove_single_player()

func _add_player_to_game(id: int):
	print("player %s joined the game..." % id)
	
	var player_to_add = multiplayer_scene.instantiate()
	player_to_add.player_id = id
	player_to_add.name = str(id)
	
	_players_spawn_node.add_child(player_to_add, true)

func _del_player(id: int):
	print("player %s left the game..." % id)
	if not  _players_spawn_node.has_node(str(id)):
		return
	_players_spawn_node.get_node(str(id)).queue_free()
	
func _remove_single_player():
	print("Remove single player")
	var player_to_remove = get_tree().get_current_scene().get_node("Player")
	player_to_remove.queue_free()
