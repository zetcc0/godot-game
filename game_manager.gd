extends Node

func become_host():
	print("become host pressed")
	%MultiplayerHUD.hide()
	MultiplayerManager.become_host()
	
func join_as_player_2():
	print("become 2nd player pressed")
	%MultiplayerHUD.hide()
	MultiplayerManager.join_as_player_2()
