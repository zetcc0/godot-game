extends Node

func become_host():
	print("become host pressed")
	Globals.multiplayer_hud.hide()
	MultiplayerManager.become_host()
	
func join_as_player_2():
	print("become 2nd player pressed")
	Globals.multiplayer_hud.hide()
	MultiplayerManager.join_as_player_2()

func set_ip(new_ip: String):
	MultiplayerManager.set_ip(new_ip)
