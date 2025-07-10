extends Control

func _on_host_button_pressed() -> void:
	GameManager.become_host()

func _on_client_button_pressed() -> void:
	GameManager.join_as_player_2()

func _on_ip_adress_text_submitted(new_text: String) -> void:
	GameManager.set_ip(new_text)
