extends Node2D

@onready var tank = $Tank
@onready var cannon = $Cannon

func _process(delta):
	# Pegá el cañón al tanque, copiando su posición (pero NO su rotación)
	cannon.global_position = tank.global_position
