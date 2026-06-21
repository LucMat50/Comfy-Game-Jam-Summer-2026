extends Control

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_retry_pressed() -> void:
	$Select.play()
	get_tree().change_scene_to_file("res://Scenes/Cutscenes/opening.tscn")

func _on_quit_pressed() -> void:
	$Select.play()
	get_tree().quit()

func _on_retry_mouse_entered() -> void:
	$Hover.play()

func _on_quit_mouse_entered() -> void:
	$Hover.play()
