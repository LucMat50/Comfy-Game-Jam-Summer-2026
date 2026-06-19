extends Node

#VARIABLES
var player: CharacterBody3D = null

func go_to_scene(path : String) -> void:
	get_tree().change_scene_to_file(path)

func change_eyes_visbility(v : bool):
	player.eyes.visible = v
