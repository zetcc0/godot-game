extends Node

const SERVER_PORT : int = 8080
var server_ip : String = "127.0.0.1"

func _on_player_shoot(player_transform):
	var bullet = Globals.bullet_scene.instantiate()
	bullet.transform = player_transform
	Globals._bullets_spawn_node.add_child(bullet, true)

func set_ip(new_ip: String):
	print("New Ip: ", new_ip)
	server_ip = new_ip

func become_host():
	print("Starting host!")
	
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
	client_peer.create_client(server_ip, SERVER_PORT)
	# Assigning client peer
	multiplayer.multiplayer_peer = client_peer
	# Remove single player
	_remove_single_player()

func _add_player_to_game(id: int):
	print("player %s joined the game..." % id)
	var player_to_add =  Globals.multiplayer_player_scene.instantiate()
	player_to_add.player_id = id
	player_to_add.name = str(id)
	
	player_to_add.connect("signal_shoot", Callable(self, "_on_player_shoot"))
	
	Globals._players_spawn_node.add_child(player_to_add, true)

func _del_player(id: int):
	print("player %s left the game..." % id)
	if not  Globals._players_spawn_node.has_node(str(id)):
		return
	Globals._players_spawn_node.get_node(str(id)).queue_free()

func _remove_single_player():
	print("Remove single player")
	var player_to_remove = get_tree().get_current_scene().get_node("Player")
	player_to_remove.queue_free()
